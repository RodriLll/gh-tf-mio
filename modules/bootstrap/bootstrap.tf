##
# Module to build the Azure DevOps "seed" configuration
##

# Build an S3 bucket to store TF state
resource "aws_s3_bucket" "state_bucket" {
  bucket = var.name_of_s3_bucket

  # Prevents Terraform from destroying or replacing this object - a great safety mechanism
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Terraform = "true"
  }
}

# Encrypt s3-bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket_encryption" {
  bucket = aws_s3_bucket.state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
      # Omitting kms_master_key_id uses the default AWS S3 KMS key
    }
  }
}
# Enable versioning for s3-bucket
resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

