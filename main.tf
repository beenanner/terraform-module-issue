provider "google" {
  project     = "${var.project}"
  region      = "us-central1"
}


module "instances" {
  source = "git::https://github.com/beenanner/terraform-module-issue-module.git//instances/?ref=master"

  image                 = "${var.image}"
  instance_count        = "${var.instance_count}"
}


output "results" {
  value = <<RESULTS

  Instances:
  ${join("\n  ", module.instances.instance_private_ips)}

  RESULTS
}
