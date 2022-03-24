#!/bin/bash

getDate() {
	date '+%d-%m-%Y_%H-%M-%S'
}

a="/home/zabbix/zabbix.log"


echo "Начало архивирования базы $(getDate)" >> $a
echo "Остановка контейнера Zabbix" >> $a
docker-compose down 
echo "Архивирование базы Zabbix" >> $a
tar -cvf ./backups/zabbix_mysql_$(getDate).tar ./mysql
echo "Запуск контейнера Zabbix" >> $a
docker-compose up -d 
echo "Удаление стаых бекапов" >> $a
/usr/bin/find /home/zabbix/backups -mtime +4 -type f -exec rm -rf {} \;
echo "Смена привелегий каталога" >> $a
chown -R  support:support /home/zabbix/backups/ 
echo "_______________________________" >> $a
