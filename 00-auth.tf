terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  alias  = "nvirginia"
  region = "us-east-1"
}

provider "aws" {
  alias  = "tokyo"
  region = "ap-northeast-1"
}

provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}

provider "aws" {
  alias  = "saopaulo"
  region = "sa-east-1"
}

provider "aws" {
  alias  = "australia"
  region = "ap-southeast-2"
}

provider "aws" {
  alias  = "hongkong"
  region = "ap-east-1"
}

provider "aws" {
  alias  = "california"
  region = "us-west-1"
}