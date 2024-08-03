# Configure the AWS provider ( It is only for learning)
provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-terraform-12345"  # Replace with a unique bucket name
  acl    = "private"

  tags = {
    Name        = "example-bucket"
    Environment = "Dev"
  }
}

# Create a new EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with an AMI ID available in your region
  instance_type = "t2.micro"               # Instance type

  tags = {
    Name = "example-instance"
  }
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}

# Output the instance ID
output "instance_id" {
  value = aws_instance.example_instance.id
}

