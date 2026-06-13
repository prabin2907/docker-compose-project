# resource "aws_nat_gateway" "main" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.public.id

#   tags = {
#     Name = var.nat_gateway_name
#   }

#   depends_on = [aws_internet_gateway.main]
# }