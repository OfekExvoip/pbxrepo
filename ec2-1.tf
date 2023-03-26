resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}





resource "aws_instance" "PBX2" {
    ami = "ami-0d1ddd83282187d18"
    instance_type = "t2.micro"
    key_name = "terraform-key"
    count = 2
    vpc_security_group_ids = ["${aws_security_group.pbxsg.id}"]
    subnet_id = "${aws_subnet.pbxsub1.id}"
     depends_on = [
    aws_vpc.pbxvpc
  ]
    tags = {
        Name = "PBX-${count.index}"
    }


}

variable "pbx22" {
  default = "aws_instance.PBX2[count.index].public_ip"
}

resource null_resource "ansible_install2" {

 provisioner "local-exec" {
command = "sleep 180; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key /home/ubuntu/Terraform/terrakey -i '${var.pbx22}', ansible-script.yaml"
}

}