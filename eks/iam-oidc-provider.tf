resource "aws_iam_openid_connect_provider" "provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = []
  url             = "${aws_eks_cluster.eks_cluster.identity.0.oidc.0.issuer}"
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.provider.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-node"]
    }

    principals {
      identifiers = ["${aws_iam_openid_connect_provider.provider.arn}"]
      type        = "Federated"
    }
  }
}
