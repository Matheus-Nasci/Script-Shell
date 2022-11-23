#!/bin/bash

sudo docker exec -it $(sudo docker ps -aqf "name=containerDB") mysql -u root -p -B -N -e "
	use totembd;

	create table endereco (
	idEndereco int primary key auto_increment,
	cep char(8) not null,
	numero int not null
	);
