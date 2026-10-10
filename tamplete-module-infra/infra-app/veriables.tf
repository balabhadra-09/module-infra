variable "env" {
  description = "This is the environment"
  type        = string
}

variable "bucket_name" {
  description = "This is the bucket name"
  type        = string
}

variable "key_pair" {
  description = "This is the key pair name"
  type        = string
}

variable "ami_id" {
  description = "This is the AMI ID"
  type        = string
}

variable "instance_type" {
  description = "This is the EC2 instance type"
  type        = string
}

variable "ec2_count" {
  description = "Number of EC2 instances"
  type        = number
}

variable "hash_key" {
  description = "This is the hash key"
  type        = string
}