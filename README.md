**Hi!!
This is a Zabbix project in docker compose.**

I wanted to achieve a convenient, easy installation and update.

1. The Zabbix database is stored on the local machine and can be archived.
2. Updating of versions happens through docker compose.
3. Added zabbix-proxy-compose. Updating versions also happens through compose.
4. To monitor the zabbix server, I use a standard client, I allow requests from 12.10.10.3 on it.
   On the server, respectively, I use the ip-address of the server itself and port 10050.
