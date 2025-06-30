provider "aws" {
  region = "us-west-2"
  alias  = "virginia"
}

provider "aws" {
  region = "us-east-1"
  alias  = "east1"
}

data "aws_security_groups" "security_groups" {
  filter {
    name   = "tag:aws:eks:cluster-name"
    values = [var.cluster_name]
  }
}

resource "aws_ec2_tag" "security_groups" {
  for_each = toset(data.aws_security_groups.security_groups.ids)

  resource_id = each.value
  key         = "karpenter.sh/discovery"
  value       = var.cluster_name
}

data "aws_eks_cluster" "cert_authority_data" {
  provider = aws.virginia
  name     = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster_auth" {
  provider = aws.virginia
  name     = data.aws_eks_cluster.cert_authority_data.name
}

provider "helm" {
  kubernetes = {
    host                   = data.aws_eks_cluster.cert_authority_data.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cert_authority_data.certificate_authority[0].data)

    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cert_authority_data.name, "--region", local.region]
    }
  }
}


provider "kubectl" {
  apply_retry_count      = 5
  host                   = data.aws_eks_cluster.cert_authority_data.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cert_authority_data.certificate_authority[0].data)
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cert_authority_data.name]
  }
}

data "aws_availability_zones" "available" {}
data "aws_ecrpublic_authorization_token" "token" {
  provider = aws.east1
}

locals {
  name   = "ex-${basename(path.cwd)}"
  region = "us-west-2"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Example = local.name
  }
}


# Karpenter

module "karpenter" {
  source = "../../modules/karpenter"

  create                                  = var.create
  tags                                    = var.tags
  cluster_name                            = var.cluster_name
  create_iam_role                         = var.create_iam_role
  iam_role_name                           = var.iam_role_name
  iam_role_use_name_prefix                = var.iam_role_use_name_prefix
  iam_role_path                           = var.iam_role_path
  iam_role_description                    = var.iam_role_description
  iam_role_max_session_duration           = var.iam_role_max_session_duration
  iam_role_permissions_boundary_arn       = var.iam_role_permissions_boundary_arn
  iam_role_tags                           = var.iam_role_tags
  iam_policy_name                         = var.iam_policy_name
  iam_policy_use_name_prefix              = var.iam_policy_use_name_prefix
  iam_policy_path                         = var.iam_policy_path
  iam_policy_description                  = var.iam_policy_description
  iam_policy_statements                   = var.iam_policy_statements
  iam_role_policies                       = var.iam_role_policies
  ami_id_ssm_parameter_arns               = var.ami_id_ssm_parameter_arns
  enable_pod_identity                     = var.enable_pod_identity
  enable_v1_permissions                   = var.enable_v1_permissions
  enable_irsa                             = var.enable_irsa
  irsa_oidc_provider_arn                  = var.irsa_oidc_provider_arn
  irsa_namespace_service_accounts         = var.irsa_namespace_service_accounts
  irsa_assume_role_condition_test         = var.irsa_assume_role_condition_test
  create_pod_identity_association         = var.create_pod_identity_association
  namespace                               = var.namespace
  service_account                         = var.service_account
  enable_spot_termination                 = var.enable_spot_termination
  queue_name                              = var.queue_name
  queue_managed_sse_enabled               = var.queue_managed_sse_enabled
  queue_kms_master_key_id                 = var.queue_kms_master_key_id
  queue_kms_data_key_reuse_period_seconds = var.queue_kms_data_key_reuse_period_seconds
  create_node_iam_role                    = var.create_node_iam_role
  cluster_ip_family                       = var.cluster_ip_family
  node_iam_role_arn                       = var.node_iam_role_arn
  node_iam_role_name                      = var.node_iam_role_name
  node_iam_role_use_name_prefix           = var.node_iam_role_use_name_prefix
  node_iam_role_path                      = var.node_iam_role_path
  node_iam_role_description               = var.node_iam_role_description
  node_iam_role_max_session_duration      = var.node_iam_role_max_session_duration
  node_iam_role_permissions_boundary      = var.node_iam_role_permissions_boundary
  node_iam_role_attach_cni_policy         = var.node_iam_role_attach_cni_policy
  node_iam_role_additional_policies       = var.node_iam_role_additional_policies
  node_iam_role_tags                      = var.node_iam_role_tags
  create_access_entry                     = var.create_access_entry
  access_entry_type                       = var.access_entry_type
  create_instance_profile                 = var.create_instance_profile
  rule_name_prefix                        = var.rule_name_prefix
}

module "karpenter_disabled" {
  source = "../../modules/karpenter"

  create = false
}

# Karpenter Helm chart & manifests

resource "helm_release" "karpenter" {
  namespace           = "kube-system"
  name                = "karpenter"
  repository          = "oci://public.ecr.aws/karpenter"
  repository_username = data.aws_ecrpublic_authorization_token.token.user_name
  repository_password = data.aws_ecrpublic_authorization_token.token.password
  chart               = "karpenter"
  version             = "1.3.0"
  wait                = false

  values = [
    <<-EOT
    serviceAccount:
      name: karpenter
    settings:
      clusterName: ${data.aws_eks_cluster.cert_authority_data.name}
      clusterEndpoint: ${data.aws_eks_cluster.cert_authority_data.endpoint}
      interruptionQueue: ${module.karpenter.queue_name}
    EOT
  ]
}

resource "kubectl_manifest" "karpenter_node_class" {
  yaml_body = <<-YAML
    apiVersion: karpenter.k8s.aws/v1
    kind: EC2NodeClass
    metadata:
      name: default
    spec:
      blockDeviceMappings:
        - deviceName: /dev/xvda
          ebs:
            volumeSize: 80Gi
            volumeType: gp3
            deleteOnTermination: true

      amiSelectorTerms:
        - alias: bottlerocket@latest
      
      role: ${module.karpenter.node_iam_role_name}
      subnetSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${data.aws_eks_cluster.cert_authority_data.name}
      securityGroupSelectorTerms:
        - tags:
            karpenter.sh/discovery: ${data.aws_eks_cluster.cert_authority_data.name}
      tags:
        karpenter.sh/discovery: ${data.aws_eks_cluster.cert_authority_data.name}
  YAML

  depends_on = [
    helm_release.karpenter
  ]
}

resource "kubectl_manifest" "karpenter_node_pool" {
  yaml_body = <<-YAML
    apiVersion: karpenter.sh/v1
    kind: NodePool
    metadata:
      name: default
    spec:
      template:
        spec:
          nodeClassRef:
            group: karpenter.k8s.aws
            kind: EC2NodeClass
            name: default
          requirements:
            - key: "karpenter.k8s.aws/instance-category"
              operator: In
              values: ["c", "m", "r"]
            - key: "karpenter.k8s.aws/instance-cpu"
              operator: In
              values: ["4", "8", "16", "32"]
            - key: "karpenter.k8s.aws/instance-hypervisor"
              operator: In
              values: ["nitro"]
            - key: "karpenter.k8s.aws/instance-generation"
              operator: Gt
              values: ["2"]
      limits:
        cpu: 1000
      disruption:
        consolidationPolicy: WhenEmpty
        consolidateAfter: 30s
  YAML

  depends_on = [
    kubectl_manifest.karpenter_node_class
  ]
}

# Example deployment using the [pause image](https://www.ianlewis.org/en/almighty-pause-container)
# and starts with zero replicas
resource "kubectl_manifest" "karpenter_example_deployment" {
  yaml_body = <<-YAML
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: inflate
    spec:
      replicas: 0
      selector:
        matchLabels:
          app: inflate
      template:
        metadata:
          labels:
            app: inflate
        spec:
          terminationGracePeriodSeconds: 0
          containers:
            - name: inflate
              image: public.ecr.aws/eks-distro/kubernetes/pause:3.7
              resources:
                requests:
                  cpu: 1
  YAML

  depends_on = [
    helm_release.karpenter
  ]
}

