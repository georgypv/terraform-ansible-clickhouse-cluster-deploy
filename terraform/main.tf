#### PRODIVER INFO #####
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token       = var.yc_token
  cloud_id    = var.yc_cloud_id
  folder_id   = var.yc_folder_id
  zone        = var.yc_zone
  max_retries = 2
}


###############################
####### GET VMs ###############
###############################


## node-1
resource "yandex_compute_instance" "node-1" {

  name = "click-node-1"

  resources {
    core_fraction = 100
    cores         = 2
    memory        = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h059qvtg37ks9ke9o"
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.click-subnet.id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_cloud.pub")}"
  }
}



## node-2
resource "yandex_compute_instance" "node-2" {

  name = "click-node-2"

  resources {
    core_fraction = 100
    cores         = 2
    memory        = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h059qvtg37ks9ke9o"
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.click-subnet.id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_cloud.pub")}"
  }
}


## node-3
resource "yandex_compute_instance" "node-3" {

  name = "click-node-3"

  resources {
    core_fraction = 100
    cores         = 2
    memory        = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h059qvtg37ks9ke9o"
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.click-subnet.id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_cloud.pub")}"
  }

}


## node-4
resource "yandex_compute_instance" "node-4" {

  name = "click-node-4"

  resources {
    core_fraction = 100
    cores         = 2
    memory        = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h059qvtg37ks9ke9o"
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.click-subnet.id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_cloud.pub")}"
  }

}



## node-5
resource "yandex_compute_instance" "node-5" {

  name = "click-node-5"

  resources {
    core_fraction = 100
    cores         = 2
    memory        = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h059qvtg37ks9ke9o"
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.click-subnet.id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_cloud.pub")}"
  }

}


###############################
####### GET NETWORK ###########
###############################

resource "yandex_vpc_network" "click-network" {
  name = "click-network"
}

resource "yandex_vpc_subnet" "click-subnet" {
  name           = "click-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.click-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}