#!/bin/sh
#db_init users database_port target_database_name 
#plz assign the parameters in order,no permission be null
dbName="ngbnms"
host="192.168.88.2"
user="nms"

#create db
#psql -U $user -h $host -p 5432 <${PWD}/setup/init_db.sql

#create language pgpsql
echo "create language pgpsql"
createlang plpgsql -U $user -h $host -p 5432 -d $dbName

#create database objects
echo "create database objects"
psql -U $user -h $host -p 5432 -d $dbName<${PWD}/setup/init_db_structure.sql

echo "init_sys_dict_data"
psql -U $user -h $host -p 5432 -d $dbName<${PWD}/setup/data/init_sys_dict_data.sql

#init init_sys_function_data
echo "init_sys_function_data"
psql -U $user -h $host -p 5432 -d $dbName<${PWD}/setup/data/init_sys_function_data.sql

#init init_sys_operator_data
echo "init init_sys_operator_data"
psql -U $user -h $host -p 5432 -d $dbName<${PWD}/setup/data/init_sys_operator_data.sql

#init init_sys_role_data
echo "init init_sys_role_data"
psql -U $user -h $host -p 5432 -d $dbName<${PWD}/setup/data/init_sys_role_data.sql

#init init_sys_role_function_data
echo "init init_sys_role_function_data"
psql -U $user -h $host -p 5432 -d $dbName<${PWD}/setup/data/init_sys_role_function_data.sql

#init init_sys_operator_role_data
echo "init init_sys_operator_role_data"
psql -U $user -h $host -p 5432 -d $dbName<${PWD}/setup/data/init_sys_operator_role_data.sql