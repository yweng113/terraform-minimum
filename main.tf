variable "username" {}

resource "null_resource" "random" {
  # nothing; only changes when configuration edited.
}

output "random" {
  value = "Changed to: ${null_resource.random.id}"
}

output "username" {
  value = "Username is ${var.username}. Extra text."
}
