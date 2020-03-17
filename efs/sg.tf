// security.tf
resource "aws_security_group" "ingress_efs" {
   name = "${var.name}_ingress_efs_sg"
   vpc_id = "${var.vpc_id}"

   // NFS
   ingress {
     security_groups = var.sg_env
     from_port = 2049
     to_port = 2049
     protocol = "tcp"
   }

   // Terraform removes the default rule
   egress {
     security_groups = var.sg_env
     from_port = 0
     to_port = 0
     protocol = "-1"
   }
 }
