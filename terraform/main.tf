module "vpc" {
  source = "./modules/vpc"
}

module "key" {
  source   = "./modules/key"
  key_name = "lab_key"
}

module "secret_key" {
  source      = "./modules/secret-key"
  secret_name = "wpoms/lab_key_private_p1"
  private_key = module.key.private_key_pem
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id         = module.vpc.public_subnet_id
  key_name          = module.key.key_name
  security_group_id = module.security.security_group_id
  instance_type     = "t3.micro"
  associate_public_ip = true
  instance_name     = "terraform-ec2-p"
  user_data         = "${path.module}/user_data.sh"
}