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
Не был инициализирован проект, соответственно нет установленного Terraform провайдера, есть объявленные, но неиспользуемые переменные, в модуле test-vm присутствует ссылка на ветку main без указания конкретного коммита. Если ветка main изменится, то после выполнения кода может быть непредсказуемый результат.
