#!/bin/sh

mssh_home="/usr/local/mssh"
bin_home="/usr/local/bin"

if [ ! -d "$mssh_home" ]
then
	mkdir "$mssh_home"
fi

cp -r db template LICENSE README.md table.rb $mssh_home

if [ -d "$bin_home" ]
then
	cp mssh $bin_home
fi

echo "MSSH_HOME=$mssh_home" >> /etc/profile
source /etc/profile
