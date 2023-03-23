resource "aws_instance" "pbxec2" {
    ami = "ami-0d1ddd83282187d18"
    instance_type = "t2.micro"
    key_name = "terraform-key"
    vpc_security_group_ids = ["${aws_security_group.pbxsg.id}"]
    subnet_id = "${aws_subnet.pbxsub1.id}"
    tags = {
        Name = "Pbx-testform"
    }
}






/*
//Creating private key
resource "tls_private_key" "tlskey" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "infr_exr_key" {
  
  key_name = "mykey"
  public_key = tls_private_key.tlskey.public_key_openssh
  
  provisioner "local-exec" {
    command = "echo '${tls_private_key.tlskey.private_key_pem}' > ~/.ssh/${aws_key_pair.infr_exr_key.key_name}.pem"
  }
}

*/
