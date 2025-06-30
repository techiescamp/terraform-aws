terraform {
  backend "s3" {
    bucket = "techies-terraform"
    key = "dev/karpenter/karpenter.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}