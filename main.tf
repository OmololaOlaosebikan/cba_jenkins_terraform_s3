provider "aws" {
    region = "eu-west-2"
}

resource "aws_s3_bucket" "s3test-lola" {
    bucket = "myjenkinsbucket-lola"
}

resource "aws_s3_bucket_ownership_controls" "s3test-lola" {
    bucket = aws_s3_bucket.s3test-lola.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "s3test-lola" {
    depends_on = [aws_s3_bucket_ownership_controls.s3test-lola]

    bucket = aws_s3_bucket.s3test-lola.id
    acl    = "private"
}
