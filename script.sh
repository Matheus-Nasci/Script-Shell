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

docker --version
if [ $? -eq 0 ];
then
	echo "Docker já está instalado"
else
	echo "Gostaria de instalar o Docker? (s/n)"
	read inst
	if [ \"$inst\" == \"s\" ];
	then
		sudo apt install docker.io -y
	fi
fi

sudo systemctl start docker
sudo sysstemctl enable docker
cd ~/docker-mysql
sudo docker-compose up -d
sudo docker start CONTAINER_TOTEMDB
sudo docker exec -it $(sudo docker ps -aqf "name=CONTAINER_TOTEMDB") mysql -u root -p

cd ~/Desktop
git clone https://github.com/Grupo8-2ADSB-TotemSystem/Java_Totem_System.git
cd Java_Totem_System/Totem_System/target
java -jar Totem_System-1.0-SNAPSHOT-jar-with-dependencies.jar
