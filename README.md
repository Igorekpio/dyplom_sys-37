<div align="center">
<h2 style="font-size: 28px;">Дипломная работа по профессии «Системный администратор»</h2>
<h3 style="font-size: 24px;">Группа SYS-37</h3>
<h3 style="font-size: 24px;">Пономарев Игорь</h3>
</div>

[Задание к дипломной работе](https://github.com/netology-code/sys-diplom/tree/diplom-zabbix)

Ключевая задача — разработать отказоустойчивую инфраструктуру для сайта, включающую мониторинг, сбор логов и резервное копирование основных данных. Инфраструктура должна размещаться в Yandex Cloud и отвечать минимальным стандартам безопасности: запрещается выкладывать токен от облака в git.  

Для выполнения дипломной работы по созданию инфраструктуры в Yandex Cloud использовалась подсистема Windows для Linux на Ubuntu 24.04.1 LTS

Основные узлы в Yandex Cloud для выполнения дипломной работы:
- Создаем 6 виртуальных машин 
- Создаем балансировщик,  HTTP-роутер, группы целевые и бэкэндов.
- Создаем VPC-ресурс.
- Создаем snapshot дисков всех ВМ.

# выполнение дипломной работы
Установка и инициализация Terraform:
- Скачиваем последню версию Terraform с [зеркала](https://hashicorp-releases.yandexcloud.net/terraform/) Яндекс, разархивируем файл terraform_1.12.0_linux_amd64.zip командой zcat terraform_1.12.0_linux_amd64.zip > terraform, назначаем права на исполнение командой chmod 755 terraform, перенесим файл в системную директорию командой sudo mv terraform /usr/local/bin/, проверяем работу программы командой terraform -v. Создаем конфигурационный файл .terraformrc командой nano ~/.terraformrc, вносим настройки зеркала YandexCloud и установим права доступа командой chmod 644 ~/.terraformrc.

- Создаем файл main.tf в папке terraform для доступа в Yandex Cloud, инициализируем terrform.
![image](https://github.com/user-attachments/assets/8a271132-abb4-4ff1-a46f-79a3fdda2d27)

- Создаем ssh-ключ коммандой ssh-keygen для доступа к ВМ, в meta.yaml указываем авторизационные данные для ВМ,  доделываем оставшиеся *.tm конфиги для создания полноценной инфраструктуры в YandexCloud.

- Запускаем terraform
![image](https://github.com/user-attachments/assets/c15664ec-a900-4271-9707-d32cd591385e)

- просмотр результата созданной инфраструктуры в Yandex Cloud
![image](https://github.com/user-attachments/assets/da39291e-8d2d-4988-8ca5-ee9d6d88cd50)

- виртуальные машины
![image](https://github.com/user-attachments/assets/00d036fa-5a8e-4085-89f1-3faf909f9752)

- группы безопасности
![image](https://github.com/user-attachments/assets/4533b9e5-a36b-4837-94fe-87bc025bd1d9)

- ежедневные снимки по расписанию
![image](https://github.com/user-attachments/assets/7e2a8e72-39bc-473a-802a-864164a010ff)

- Устанавливаем Ansible с помощью команды apt install ansible, скачиваем используемые версии пакетов  elasticsearch, filebeat, kibana из зеркала Яндекс,
после создания ansible.cgf проверям работоспособность,  доустанавливаем необходимые роли согласно создаваемой конфигурации. 

- проверяем пинг всех хостов, а также подключение по ssh
![image](https://github.com/user-attachments/assets/3bb18fc8-caa6-4004-b56d-7d4a380c8aae)

- запускаем плейбук 1
![image](https://github.com/user-attachments/assets/8207e1d0-1bf3-4464-8f0c-adf90066613d)

- запускаем плейбук 2
![image](https://github.com/user-attachments/assets/64197d0f-2d0a-4527-a27c-ac71c4108cdb)

- проверяем работу балансировщика ip 158.160.166.238.
![image](https://github.com/user-attachments/assets/0176c3dd-6dde-4e12-a8ab-a360c450e961)

![image](https://github.com/user-attachments/assets/3f09561f-a109-4884-b6a6-f50f5b0a3a3f)

![image](https://github.com/user-attachments/assets/c1da28e4-2aa4-45eb-be6e-13582c1e5789)

![image](https://github.com/user-attachments/assets/b62aa821-aa8e-4df3-abb8-d4101fd2a858)

- проверка zabbix ip 89.169.159.216 Логин: Admin  Пароль: zabbix
![image](https://github.com/user-attachments/assets/4c36c273-71fd-4f54-957c-aa9ff9ec1d5d)

![image](https://github.com/user-attachments/assets/59f6f76a-8ff2-40db-a26b-07e427a0c923)

- проверяем elastic + kibana ip 158.160.40.17
![image](https://github.com/user-attachments/assets/567a948d-759d-49bb-b27b-09d8d5eabd38)

- проверяем failbeat
![image](https://github.com/user-attachments/assets/fb4beadf-e0d0-4e38-b63d-4386e7757784)

- просмотр дашбордов
![image](https://github.com/user-attachments/assets/5140b40f-e281-4ac1-bc14-f4d7c7a5fdc1)
