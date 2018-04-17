variable "username" {}

provider "random" {} # an empty for destroying old resources

resource "null_resource" "random" {
  triggers = {
    username = "${var.username}"
  }
  # only changes when configuration edited, or when username changes.
  provisioner "local-exec" {
    command = "sleep 20"
  }
}

output "random" {
  value = "Changed to: ${null_resource.random.id}"
}

output "username" {
  value = "Username is ${var.username}. Extra text."
}
