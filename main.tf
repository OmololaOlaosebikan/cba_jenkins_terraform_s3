provider "aws" {
    region = "eu-west-2"
}

resource "aws_s3_bucket" "s3test" {
    bucket = "cba_jenkins_terraform_bucket"
}

resource "aws_s3_bucket_ownership_controls" "s3test" {
    bucket = aws_s3_bucket.s3test.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "s3test" {
    depends_on = [aws_s3_bucket_ownership_controls.s3test]

    bucket = aws_s3_bucket.s3test.id
    acl    = "private"
}