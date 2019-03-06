#!/bin/bash

NEW_DB_PASSWORD=$1

DB_PASSWORD=$(sudo grep "A temporary password is generated" /var/log/mysqld.log | sed -s 's/.*root@localhost: //')

mysql -uroot -p${DB_PASSWORD} --connect-expired-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${NEW_DB_PASSWORD}'; flush privileges;"

echo "${NEW_DB_PASSWORD}" > DB_PASSWORD.txt
