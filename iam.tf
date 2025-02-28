provider "aws" {
  region = "sa-east-1"
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

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServiceRolePolicy"
  role       = aws_iam_role.eks_cluster.name
}
