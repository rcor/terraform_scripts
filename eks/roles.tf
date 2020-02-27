resource "aws_iam_role" "eks_cluster" {
  name = "${var.name}-eks-cluster"
  assume_role_policy = file("files/cluster.json")
}

resource "aws_iam_role_policy_attachment" "attachment_cluster_EKS_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.eks_cluster.name}"
}

resource "aws_iam_role_policy_attachment" "attachment_cluster_EKS_service_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.eks_cluster.name}"
}



resource "aws_iam_role" "node_group" {
  name = "${var.name}_eks_node_group"
  assume_role_policy = file("files/nodegroup.json")
}

resource "aws_iam_role_policy_attachment" "attachment-nodegroup_ALB_ingress_controller" {
  role       = "${aws_iam_role.node_group.name}"
  policy_arn = "${aws_iam_policy.ALB_ingress_controller_IAM_policy.arn}"
}

resource "aws_iam_role_policy_attachment" "attachment_nodegroup_EKS_worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_group.name
}

resource "aws_iam_role_policy_attachment" "attachment_nodegroup_EKS_CNI_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_group.name
}

resource "aws_iam_role_policy_attachment" "attachment_nodegroup_EC2_container_registry_readonly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_group.name
}


###

resource "aws_iam_policy" "ALB_ingress_controller_IAM_policy" {
  name = "${var.name}-ALB_ingress_controller_IAM_policy"
  path        = "/"
  description = "ALBIngressControllerIAMPolicy"
  policy = file("files/ALBIngressControllerIAMPolicy.json")
}

resource "aws_iam_role" "eks_alb_ingress_controller" {
  name = "${var.name}_eks_alb_ingress_controller"
  assume_role_policy =  "${data.aws_iam_policy_document.assume_role_policy.json}"
}

resource "aws_iam_role_policy_attachment" "ingress-attach" {
  role       = "${aws_iam_role.eks_alb_ingress_controller.name}"
  policy_arn = "${aws_iam_policy.ALB_ingress_controller_IAM_policy.arn}"
}
