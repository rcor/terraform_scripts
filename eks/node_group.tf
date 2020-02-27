resource "aws_eks_node_group" "node_group" {
  count = length(var.node_group)
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.node_group[count.index]["node_group_name"]
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = var.private_subnet[*]

  scaling_config {
    desired_size = var.node_group[count.index].scaling_config.desired_size
    max_size     = var.node_group[count.index].scaling_config.max_size
    min_size     = var.node_group[count.index].scaling_config.min_size
  }
  disk_size = var.node_group[count.index].disk_size
  tags=var.node_group[count.index]["tags"]
  labels=var.node_group[count.index]["labels"]
  instance_types=var.node_group[count.index]["instances_types"]

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.attachment_nodegroup_EKS_worker_node_policy,
    aws_iam_role_policy_attachment.attachment_nodegroup_EKS_CNI_policy,
    aws_iam_role_policy_attachment.attachment_nodegroup_EC2_container_registry_readonly,
  ]
}
