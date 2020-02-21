resource "aws_s3_bucket" "s3_website_bucket" {
  bucket = "${var.name}"
  acl    = "${var.s3_acl}"
  policy = <<EOF
{
       "Version":"2012-10-17",
       "Statement":[{
     	 "Sid":"PublicReadForGetBucketObjects",
             "Effect":"Allow",
     	  "Principal": "*",
           "Action":["s3:GetObject"],
           "Resource":["arn:aws:s3:::${var.name}/*"
           ]
         }
       ]
  }
  EOF
  website {
    index_document = "${var.index}"
    error_document = "${var.error}"

  }
}
