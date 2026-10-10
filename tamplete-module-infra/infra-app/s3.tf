resource "aws_s3_bucket" "my_s3bucket" {
  bucket = "${var.env}-${var.bucket_name}"

  tags = {
    Name = "${var.env}-${var.bucket_name}"
    Enviroment = var.env
     
  }
}