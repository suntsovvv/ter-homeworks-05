terraform {
  required_version = ">= 0.13"
}
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.13"
    }
    template = { 
      source =  "hashicorp/template"
      version = ">= 2.1"}
  }
 # required_version = ">=0.13"
}

terraform {
backend "s3" {
endpoint = "storage.yandexcloud.net"
bucket = "svv-bucket"
region = "ru-central1"
key = "terraform.tfstate"
skip_region_validation = true
skip_credentials_validation = true
dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g6dgftb02k9esf1nmu/etn8cb19l9o40jt4k6kd"
dynamodb_table = "state-table"
}
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
  service_account_key_file = file("~/key.json")
}