#!/bin/bash
sudo apt update && sudo apt upgrade -y
java --version
if [ $? -eq 0 ];
then
	echo "Java já está instalado"
else
	echo "Gostaria de instalar o Java? (s/n)"
	read inst
	if [ \"$inst\" == \"s\" ];
	then
		sudo apt install default-jre -y
	fi
fi

cd /home/ubuntu/Desktop
git clone https://github.com/Grupo8-2ADSB-TotemSystem/Java_Totem_System.git
cd Java_Totem_System/Totem_System/target
java -jar Totem_System-1.0-SNAPSHOT-jar-with-dependencies.jar
cd ..
docker --version
if [ $? -eq 0 ];
then
	echo "Docker já está instalado"
else
	echo "Gostaria de instalar o Docker? (s/n)"
	read inst
	if [ \"$inst\" == \"s\" ];
	then
		sudo apt install docker.io
	fi
fi
sudo su
systemctl start docker
docker pull mysql:5.7
docker run -d -p 3306:3306 --name containerDB -e "MYSQL-DATABASE-totembd" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
docker ps -a
docker exec -it containerDB bash
mysql -u root -p
