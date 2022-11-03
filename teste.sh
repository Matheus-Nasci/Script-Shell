#!/bin/bash
sudo docker ps -aqf "name=containerDB"
if [ $? -eq 0 ];
  then
	echo "Banco já existente"
  else
  echo "CRIAR"
fi
