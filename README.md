# Домашнее задание к занятию «Использование Terraform в команде»
### Задание 1

1. Возьмите код:
- из [ДЗ к лекции 4](https://github.com/netology-code/ter-homeworks/tree/main/04/src),
- из [демо к лекции 4](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1).
2. Проверьте код с помощью tflint и checkov. Вам не нужно инициализировать этот проект.
3. Перечислите, какие **типы** ошибок обнаружены в проекте (без дублей).
  
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/e5312167-d37b-49a1-ae01-dd1b50724405)
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/e54646b9-5830-4398-a4fb-843208c230f9)

Обнаружены следующие ошибки:
Не была зафиксирована версия провайдеравсегда будет использоваться послкдняя версия, при ее обновлении могут возникнуть косяки. На самом деле она указана,но не в блоке " yandex = { source = "yandex-cloud/yandex" }".
Есть объявленные, но неиспользуемые переменные.
В модулях  присутствуют ссылки на ветку main из git без указания конкретного коммита. Если ветка main изменится, то после выполнения кода могут возникнуть проблемы. Так же небезобасно использовать ссылку на источник без хеша, который бы обеспечил неизменяемость данных в источнике.

### Задание 2   
main.tf:   

```hcl
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.5"
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
```
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/81c2a655-e81b-498b-b15e-c9c2e7bc150b)   

![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/dc16f476-d62e-4009-8c64-466250d649a7)   
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/bc815cdc-f3c4-4e5a-8b52-18b72343d8b0)   
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/0701a32a-be1b-4b90-be17-c022e515117d)

![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/81711abf-2443-4640-83d5-2667cfb83f89)



