resource "aws_security_group" "eks_cluster" {
  name        = "${var.name}-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge({
    Name = "${var.name}-eks-cluster"
    },var.tags)
}


resource "aws_security_group" "eks_node" {
  name        = "eks-node"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge({
    Name = "${var.name}_eks_node"
    },var.tags)
}

resource "aws_security_group_rule" "eks_node_ingress_self" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.eks_node.id
  source_security_group_id = aws_security_group.eks_node.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "eks_node_ingress_cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control      plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_node.id
  source_security_group_id = aws_security_group.eks_cluster.id
  to_port                  = 65535
  type                     = "ingress"
 }

 resource "aws_security_group_rule" "eks_cluster_ingress_node_https" {
   description              = "Allow pods to communicate with the cluster API Server"
   from_port                = 443
   protocol                 = "tcp"
   security_group_id        = aws_security_group.eks_cluster.id
   source_security_group_id = aws_security_group.eks_node.id
   to_port                  = 443
   type                     = "ingress"
 }
