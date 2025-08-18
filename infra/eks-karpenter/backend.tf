terraform {
  backend "s3" {
    bucket = "techies-terraform"
    key = "dev/eks/eks.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}