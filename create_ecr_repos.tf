provider "aws" {
  region = "us-west-1"  # Change this to your desired AWS region
}

resource "aws_ecr_repository" "learn-frontend" {
  name = "learn-frontend"
}

resource "aws_ecr_repository" "learn-subject" {
  name = "learn-subject"
}

resource "aws_ecr_repository" "learn-discovery" {
  name = "learn-discovery"
}

resource "aws_ecr_repository" "learn-config" {
  name = "learn-config"
}
