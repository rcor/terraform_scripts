locals {
  LIVECYCLE_POLICIES = ["AFTER_7_DAYS", "AFTER_14_DAYS","AFTER_30_DAYS","AFTER_60_DAYS","AFTER_90_DAYS"]
}

resource "aws_efs_file_system" "file_system" {
  creation_token = "${var.creation_token}"
  encrypted = var.encrypted
  performance_mode = "${var.performance_mode}"
  tags = merge ({
    Name = "${var.name}"
    CreatedBy = "terraform"
  },var.tags)
}

resource "aws_efs_mount_target" "efs_mount" {
   count = length("${var.subnets}")
   file_system_id  = "${aws_efs_file_system.file_system.id}"
   subnet_id = "${element(var.subnets, count.index)}"
   security_groups = ["${aws_security_group.ingress_efs.id}"]
 }
