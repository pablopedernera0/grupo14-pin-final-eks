provider "aws" {
  region = "sa-east-1"
}

resource "aws_eks_cluster" "example" {
  name     = "example-eks-cluster"
  role_arn = aws_iam_role.eks_cluster.arn
}

resource "aws_iam_role" "eks_cluster" {
  name        = "eks-cluster-role"
  description = "EKS Cluster Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect = "Allow"
        Sid      = ""
      }
    ]
  })
}
