resource "aws_iam_instance_profile" "instance_profile" {
  count = var.attach_instance_profile ? 1 : 0
  name = "${var.environment}-${var.application}-instance-profile"

  role = var.iam_role
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  count         = var.instance_count

  iam_instance_profile = var.attach_instance_profile ? aws_iam_instance_profile.instance_profile[0].name : null

  associate_public_ip_address = var.associate_public_ip_address

  vpc_security_group_ids = var.security_group_ids

  subnet_id = element(var.subnet_ids, count.index % length(var.subnet_ids))

  root_block_device {
    volume_size = var.storage_size
  }

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-Instance"
      Environment = var.environment
      Owner       = var.owner
      CostCenter  = var.cost_center
      Application = var.application
    },
    var.tags
  )
}

resource "aws_eip" "instance" {
  count = var.attach_eip ? var.instance_count : 0

  instance = element(aws_instance.ec2_instance.*.id, count.index)
}