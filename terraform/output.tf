output "internal_ip_node1" {
  value = yandex_compute_instance.node-1.network_interface.0.ip_address
}

output "internal_ip_node2" {
  value = yandex_compute_instance.node-2.network_interface.0.ip_address
}

output "internal_ip_node3" {
  value = yandex_compute_instance.node-3.network_interface.0.ip_address
}

output "internal_ip_node4" {
  value = yandex_compute_instance.node-4.network_interface.0.ip_address
}

output "internal_ip_node5" {
  value = yandex_compute_instance.node-5.network_interface.0.ip_address
}

#output "internal_ip_node6" {
#  value = yandex_compute_instance.node-6.network_interface.0.ip_address
#}
#
#output "internal_ip_node7" {
#  value = yandex_compute_instance.node-7.network_interface.0.ip_address
#}
#

###########

output "external_ip_node1" {
  value = yandex_compute_instance.node-1.network_interface.0.nat_ip_address
}

output "external_ip_node2" {
  value = yandex_compute_instance.node-2.network_interface.0.nat_ip_address
}

output "external_ip_node3" {
  value = yandex_compute_instance.node-3.network_interface.0.nat_ip_address
}

output "external_ip_node4" {
  value = yandex_compute_instance.node-4.network_interface.0.nat_ip_address
}

output "external_ip_node5" {
  value = yandex_compute_instance.node-5.network_interface.0.nat_ip_address
}
