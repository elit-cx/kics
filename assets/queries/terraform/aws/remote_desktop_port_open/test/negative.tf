#this code is a correct code for which the query should not find any result
resource "aws_security_group" "negative_rdp_1" {
  name        = "Dont open remote desktop port"
  description = "Doesn't enable the remote desktop port"

}

resource "aws_security_group" "negative_rdp_2" {

  ingress {
    description = "Remote desktop open private"
    from_port   = 3380
    to_port     = 3450
    protocol    = "tcp"
  }
}

resource "aws_security_group" "negative_rdp_2" {

  ingress {
    description = "Remote desktop open private"
    from_port   = 3380
    to_port     = 3450
    protocol    = "tcp"
    cidr_blocks = ["0.1.0.0/0"]
  }
}