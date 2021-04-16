provider "google" {
    credentials = file("cloud_credentials.json")

    project     = "${var.project_id}"

    region      = "europe-west2"
    zone        = "europe-west2-c"
}
