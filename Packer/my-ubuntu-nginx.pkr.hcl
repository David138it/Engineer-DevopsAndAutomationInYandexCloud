source "yandex" "ubuntu-nginx" {
   token               = "y0_AgAAAABk37oLAATuwQAAAADQHQt0BDkxnuByQ0u6AQZYOkKFsQJsOBI"
   folder_id           = "fhmql8bhca7pvlq35r3q"
   source_image_family = "ubuntu-2004-lts"
   ssh_username        = "ubuntu"
   use_ipv4_nat        = "true"
   image_description   = "my custom ubuntu with nginx"
   image_family        = "ubuntu-2004-lts"
   image_name          = "my-ubuntu-nginx"
   subnet_id           = "enpboucd6803lg6jspnh"
   disk_type           = "network-ssd"
   zone                = "ru-central1-a"
}
build {
   sources = ["source.yandex.ubuntu-nginx"]
   provisioner "shell" {
     inline = ["sudo apt-get update -y",
           "sudo apt-get install -y nginx",
           "sudo systemctl enable nginx.service"]
	}
}
