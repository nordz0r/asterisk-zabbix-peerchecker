# asterisk-zabbix-peerchecker
 Проверка зарегистрированных номеров в заббиксе


Установка:
 1. ast-peers.sh - в /usr/sbin (chmod +x)
 2. В /etc/sudoers (visudo)
zabbix ALL = NOPASSWD: /usr/sbin/asterisk
zabbix ALL = NOPASSWD: /usr/sbin/ast-peers
 3. В /etc/zabbix/zabbix_agentd.conf
UserParameter=asterisk.peers,/usr/sbin/ast-peers discovery
UserParameter=asterisk.peer[*],sudo /usr/sbin/ast-peers $1
 4. Импортировать в заббикс Telephones_check.xml


