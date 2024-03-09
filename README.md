# Домашнее задание к занятию «Использование Terraform в команде»
### Задание 1

Выполнил необходимые проверки. Инструмены запускал из docker-контейнеров.
  
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/e5312167-d37b-49a1-ae01-dd1b50724405)
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/e54646b9-5830-4398-a4fb-843208c230f9)

Обнаружены следующие ошибки:
Не была зафиксирована версия провайдеравсегда будет использоваться послкдняя версия, при ее обновлении могут возникнуть косяки. На самом деле она указана,но не в блоке " yandex = { source = "yandex-cloud/yandex" }".
Есть объявленные, но неиспользуемые переменные.
В модулях  присутствуют ссылки на ветку main из git без указания конкретного коммита. Если ветка main изменится, то после выполнения кода могут возникнуть проблемы. Так же небезобасно использовать ссылку на источник без хеша, который бы обеспечил неизменяемость данных в источнике.

### Задание 2   
Создал бакет, YDB и таблицу. Сервисный аккайнт с правами:
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/81c2a655-e81b-498b-b15e-c9c2e7bc150b)    

Сконфигурировал provaiders.tf:   

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
Выполнил миграцию:   
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/dc16f476-d62e-4009-8c64-466250d649a7)   
В результате выполнения кода, в бакете появился state-файл:
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/bc815cdc-f3c4-4e5a-8b52-18b72343d8b0)  
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/0701a32a-be1b-4b90-be17-c022e515117d)   

В одном терминале открыл terraform console, во втором выполнил terrafotm apply:
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/81711abf-2443-4640-83d5-2667cfb83f89)   

### Задание 3   
Выполнил проверки и исправил ошибки.
Ссылка на pull request :  https://github.com/suntsovvv/ter-homeworks-05/pull/1   

### Задание 4   
Написал переменные:
```
variable "ip_address" {
  description = "ip-address"
  type        = string
  default = "1920.1680.0.1"
  validation {
    condition     = can(regex("^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$", var.ip_address))
    error_message = "wronng ip-address"
  }
}

variable "ip_address_list" {
  description = "list of IP addresses"
  type        = list(string)
  default     = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]
  validation {
    condition = alltrue([for ip in var.ip_address_list: can(regex("^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$", ip))])
    error_message = "incorrect list of IP addresses"
  }
}
```

Если заполнить default некорректными значениями , при вызове terraform console выдает ошибки:   
![image](https://github.com/suntsovvv/ter-homeworks-05/assets/154943765/063060bc-c636-482d-a1d2-2d1410834c85)   




