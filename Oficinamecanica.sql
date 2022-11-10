-- drop database oficinamecanica;
create database oficinamecanica;
use oficinamecanica;

-- Criar a tabela do cliente

CREATE table clients(
	idClient int auto_increment primary key,
    Fname varchar(15),
    Minit char(3),
    Lname varchar(15),
    Address varchar(255),
    CPF char(11) not null,
    email varchar(50),
    constraint unique_cpf_client unique (CPF),
    constraint unique_email_client unique (email)
);

-- select * from  vehicle;
-- Criar cadastros dos veículos

CREATE table vehicle(
	idVehicle int auto_increment primary key,
    plate varchar(9),
    Vmodel varchar(25),
    Brand varchar(25),
    Vyear int(4),
    Vkm int(11),
    color varchar(50),
    constraint unique_plate_client unique (plate)
);
-- ALTER TABLE vehicle ADD column idClient int;
-- ALTER TABLE vehicle ADD constraint fk_client_vehicle foreign key (idClient) references clients(idClient);
CREATE table parts(
	idParts int auto_increment primary key,
    Pname varchar(10) not null,
    Pdescription varchar(255)not null,
    Pprice float not null
);

CREATE table employee(
	idEmployee int auto_increment primary key,
	EFname varchar(15),
    EMinit char(3),
    ELname varchar(15),
    EAddress varchar(255),
    ECPF char(11) not null,
    Especialist varchar(50),
    constraint unique_ECPF_client unique (ECPF)
);

CREATE table services(
	idServices int auto_increment primary key,
	Sdescription varchar(255),
    Sprice float
);
CREATE table serviceorder(
	idServiceOrder int auto_increment primary key,
    idVehicle int,
    idClient int,
	SOstatus enum('Em andamento','concluído') default 'Em andamento',
    SOemissao date,
    SOdescription varchar(255),
    SOprice float,
    SOconclusionpreview datetime,
    SOservice enum('Manutenção','Revisão'),
    constraint fk_vehicle foreign key (idVehicle) references vehicle(idVehicle),
    constraint fk_client foreign key (idClient) references Clients(idClient)
);

CREATE table partcost(
	idPcost int auto_increment primary key,
    idServiceOrder int,
    constraint fk_service_order foreign key (idServiceOrder) references serviceorder(idServiceOrder)
);

ALTER TABLE employee ADD column idServiceOrder int;
ALTER TABLE employee ADD constraint fk_service_order_employee foreign key (idServiceOrder) references serviceorder(idServiceOrder);

INSERT INTO clients (Fname, Minit, Lname, Address, CPF, email) values
					('Fellipo', 'B', 'Caldeira', 'Rua Omega 95 -Jardime América', '12345678933','hfellipo@gmail.com'),
					('Jose', 'B', 'Silva', 'Rua Omega 99 -Jardime América', '6534222321','zeze@gmail.com');
     
INSERT INTO vehicle(idClient, plate, Vmodel, Vyear, Vkm, color) values
			(1, 'XXX-1111', 'Palio','2022','123.000','Preto'),
              (2, 'HHH-9999', 'Ferrari', '1994', '23.000', 'Vermelho');
                    
                