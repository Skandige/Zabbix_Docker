#!/bin/bash

getDate() {
	date '+%d.%m.%Y_%H:%M:%S'
}

a="/home/zabbix/zabbix.log"


echo "Начало архивирования базы $(getDate)" >> $a
echo "Остановка контейнера $(getDate)" >> $a
docker-compose down 
echo "Архивирование базы Zabbix $(getDate)" >> $a
tar -cvf ./backups/zabbix_mysql_$(getDate).tar ./mysql
echo "Запуск контейнера Zabbix $(getDate)" >> $a
docker-compose up -d 
echo "Удаление стаых бекапов $(getDate)" >> $a
/usr/bin/find /home/zabbix/backups -mtime +4 -type f -exec rm -rf {} \;
echo "Смена привелегий каталога $(getDate)" >> $a
chown -R  support:support /home/zabbix/backups/ 
echo "_______________________________" >> $a
