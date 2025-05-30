# облак
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

# доступ и токен к облаку
provider "yandex" {
  service_account_key_file  =  "/home/igorek/key/ponomarev.json"
  cloud_id                  = "b1gqqar59rcpu01mlfug"
  folder_id                 = "b1gu7dhp2ijq3g7og9ns"
}
