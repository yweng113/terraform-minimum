resource "null_resource" "random" { # reusing the name just to confirm some unrelated behavior
  triggers = {
    username = "hardcoder"
  }
}
