#!/bin/sh

dbName="ngbnms"
host="192.168.88.2"
user="nms"
passwd="nms!@#"

#generate sql source file
pg_dump --host $host --port 5432 --username $user --password $passwd --format plain --schema-only --no-owner --verbose --file ${PWD}/setup/init_db_structure.sql $dbName

pg_dump --host $host --port 5432 --username $user --password $passwd --format plain --data-only --disable-triggers --verbose --file ${PWD}/setup/data/init_sys_dict_data.sql --table public.sys_dict $dbName

pg_dump --host $host --port 5432 --username $user --password $passwd --format plain --data-only --disable-triggers --verbose --file ${PWD}/setup/data/init_sys_function_data.sql --table public.sys_function $dbName

pg_dump --host $host --port 5432 --username $user --password $passwd --format plain --data-only --disable-triggers --verbose --file ${PWD}/setup/data/init_sys_role_data.sql --table public.sys_role $dbName

pg_dump --host $host --port 5432 --username $user --password $passwd --format plain --data-only --disable-triggers --verbose --file ${PWD}/setup/data/init_sys_role_function_data.sql --table public.sys_role_function $dbName

pg_dump --host $host --port 5432 --username $user --password $passwd --format plain --data-only --disable-triggers --verbose --file ${PWD}/setup/data/init_sys_operator_data.sql --table public.sys_operator $dbName

pg_dump --host $host --port 5432 --username $user --password $passwd --format plain --data-only --disable-triggers --verbose --file ${PWD}/setup/data/init_sys_operator_role_data.sql --table public.sys_role_operator $dbName
