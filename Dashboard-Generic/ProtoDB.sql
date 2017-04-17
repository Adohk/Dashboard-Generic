use master
select * from AuraInventarioProtoDB.INFORMATION_SCHEMA.COLUMNS
drop database AuraInventarioProtoDB;

Create database AuraInventarioProtoDB;
use AuraInventarioProtoDB;

create table UNE(
ID int identity(1,1) primary key not null,
OBRA varchar(10) UNIQUE not null,
DESCRIPCION varchar(50),
ESTADO varchar(20)
);

create table INV_PC(
ID int identity(1,1) primary key not null,
SERIAL varchar(30) UNIQUE not null,
MODELO varchar(30) not null,
MARCA varchar(30) not null,
TIPO varchar(10) not null,
ESTADO varchar(30) not null,
OBS varchar(255),
FECHA_ADQ datetime not null,
EST_TW  Bit not null,
EST_CC  Bit not null,
EST_AV  Bit not null,
EST_PD  Bit not null,
EST_OF  Bit not null,
EST_WN  Bit not null,
EST_REG Bit not null,
SGI_SW  Bit not null,
SGI_RES Bit not null,
F_UL_MAN datetime not null,
DEVU varchar(10),
ASIGN varchar(30),
OBRA varchar(10),
CONSTRAINT [FK_INV_PC_UNE] foreign key(OBRA) references UNE(OBRA)
);

create table USUARIOS(
ID int identity(1,1) primary key not null,
RUT varchar(12) UNIQUE not null,
NOMBRE_C varchar(40) not null,
CORREO varchar(30) UNIQUE not null,
UNE varchar(10),
ESTADO varchar(20),
CONSTRAINT [FK_USUARIOS_UNE] foreign key(UNE) references UNE(OBRA)
);

create table MOVIMIENTOS_PC(
ID int identity(1,1) primary key not null,
RUT_USUARIO varchar(12) not null,
ID_PC varchar(30) not null,
TIPO_MOV varchar(30) not null,
FECHA_MOV datetime not null,
OBS varchar(255),
CONSTRAINT [FK_MOVIMIENTOS_PC_USUARIOS] foreign key(RUT_USUARIO) references USUARIOS(RUT),
CONSTRAINT [FK_MOVIMIENTOS_PC_INV_PC] foreign key(ID_PC) references INV_PC(SERIAL)
);

create table LOGIN(
ID int identity(1,1) primary key not null,
NOMBRE varchar(30) not null,
PASS nvarchar(128) not null,
SALT nvarchar(128)  not null,
ROL varchar(20),
ESTADO varchar(20)
);

create table DETMAN(
ID int identity(1,1) primary key not null,
SERIAL varchar(30) not null,
MODELO varchar(30) not null,
MARCA varchar(30) not null,
TIPO varchar(10) not null,
ESTADO varchar(30) not null,
OBS varchar(255),
FECHA_ADQ datetime not null,
EST_TW  Bit not null,
EST_CC  Bit not null,
EST_AV  Bit not null,
EST_PD  Bit not null,
EST_OF  Bit not null,
EST_WN  Bit not null,
EST_REG Bit not null,
SGI_SW  Bit not null,
SGI_RES Bit not null,
F_UL_MAN datetime not null,
DEVU varchar(10),
ASIGN varchar(30),
OBRA varchar(10),
CONSTRAINT [FK_DETMAN_INV_PC] foreign key(SERIAL) references INV_PC(SERIAL)
);

insert into UNE values('OF','Oficina Central', 'Activo');
insert into UNE values('O166','', 'Activo');
insert into UNE values('O172','Peñon', 'Activo');
insert into UNE values('O175','Los Andes', 'Activo');

insert into USUARIOS values('11111111-1','IVAN GUZMAN CAVIERES','correo@aura.cl','OF', 'Activo');
insert into USUARIOS values('00000000-0','Informatica','admin@aura.cl','OF', 'Activo');
insert into USUARIOS values('22222222-2','FREDDY MARQUEZ','correo2@aura.cl','O175', 'Activo');
insert into USUARIOS values('33333333-3','HERNAN OPAZO','correo3@aura.cl','OF', 'Activo');

insert into LOGIN values('Admin','fa042c452bda6483cf4cfbb01d2b9df7bbc916903075612afa9a499f27820297','bOb5KyDlxHzbKz3j6EzoesS3mVtSyCGN2Niwxo9s2Rw=', 'Admin', 'Activo');
insert into LOGIN values('Informatica','eb65f4ea944f73683434d9ce606bac2b1ae100a17e5eb238d1424eb5b6805018','h4Q1vHLcplQjILcDoZu7yQJG+ZaoCCH4g56rfMepjyU==', 'Admin', 'Activo');
insert into LOGIN values('RRHH','60c920b7bb63dcc53a2d690cf37bd688ae3e0d48efde2ca2608dc951e3d8227c','AhwsPQI9NY1welnTpfKTFg6xBjuWuunMg7fzRzazJ2U=', 'User', 'Activo');
insert into LOGIN values('SGI','141d945fee0d78aceee3c6cf5d6c072a799572ebdebe9308f911487ecb65589b','LnSqbkSTV6VVcwm9a/2xaLuxUlrWAH710Ugq9zVUR6g=', 'ReadOnly', 'Activo');


insert into INV_PC values('XXX12345','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','11-1-2017','NO','IVAN GUZMAN CAVIERES','OF');
insert into INV_PC values('XXX67890','ModeloX','MarcaX','NOTEBOOK','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','true','true','false','true','true','11-1-2017','SI','Informatica','OF');
insert into INV_PC values('XXX67891','ModeloX','MarcaX','NOTEBOOK','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','true','true','false','true','true','11-1-2017','SI','Informatica','OF');

insert into DETMAN values('XXX12345','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','10-1-2017','NO','IVAN GUZMAN CAVIERES','OF');
insert into DETMAN values('XXX12345','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','10-2-2017','NO','IVAN GUZMAN CAVIERES','OF');
insert into DETMAN values('XXX12345','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','10-3-2017','NO','IVAN GUZMAN CAVIERES','OF');
insert into DETMAN values('XXX12345','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','10-4-2017','NO','IVAN GUZMAN CAVIERES','OF');
insert into DETMAN values('XXX12345','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','11-6-2017','NO','IVAN GUZMAN CAVIERES','OF');
insert into DETMAN values('XXX12345','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','9-7-2017','NO','IVAN GUZMAN CAVIERES','OF');

insert into DETMAN values('XXX67891','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','10-5-2017','NO','IVAN GUZMAN CAVIERES','OF');
insert into DETMAN values('XXX67891','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','10-6-2017','NO','IVAN GUZMAN CAVIERES','OF');
insert into DETMAN values('XXX67890','ModeloX','MarcaX','AIO','OPERATIVO','Con cargador.','11-1-2017','true','true','true','true','false','true','true','true','false','10-3-2017','NO','IVAN GUZMAN CAVIERES','OF');


drop table INV_PC
update INV_PC set DEVU='Si' where SERIAL='XXX67890'
select * from USUARIOS
select * from LOGIN
delete from INV_PC where SERIAL='XXX67890'