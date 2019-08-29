variable "username" {}

provider "random" {} # an empty for destroying old resources

resource "null_resource" "random" {
  triggers = {
    username = "${var.username}"
  }
  # only changes when configuration edited, or when username changes.
}

output "random" {
  value = "Changed to: ${null_resource.random.id}"
}

output "username" {
  value = "Username is ${var.username}. Extra text."
}

data "terraform_remote_state" "dev" {
  backend = "remote"
  config = {
    organization = "nicktech"
    workspaces = {
      name = "minimum-dev"
    }
  }
}

output "username-dev" {
  value = "${data.terraform_remote_state.dev.username}"
}
