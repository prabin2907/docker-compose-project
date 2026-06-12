resource "aws_key_pair" "lab_key" {
  key_name   = "lab_key"
  public_key = file("${path.module}/lab_key.pub")
}