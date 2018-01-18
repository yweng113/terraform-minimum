variable "username" {}
variable "prior_workspace" {
  default = ""
}

provider "random" {} # an empty for destroying old resources

data "terraform_remote_state" "prior_workspace" {
  backend = "atlas"
  config {
    name = "${var.prior_workspace}"
  }
  defaults {
    username = "default"
  }
}

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

output "prior_username" {
  value = "Prior username: ${data.terraform_remote_state.prior_workspace.username}"
}
