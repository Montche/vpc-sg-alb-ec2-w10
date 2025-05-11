terraform {
  backend "s3" {
    bucket  = "mdiom-w7terraformstatebucket"
    key     = "alb/terraform.state"
    region  = "us-east-1"
    encrypt = true
  }
}