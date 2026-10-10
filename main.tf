module "dev-infra" {
    source = "./tamplete-module-infra/infra-app"
    env = "dev"
    bucket_name = "my-infra0102"
    key_pair = "infra_key"
    ami_id = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    ec2_count = 2
    hash_key = "studentID"
    
}