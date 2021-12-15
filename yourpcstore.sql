-- creacion base de datos

CREATE DATABASE yourpcstore;

-- seleccionar la base de datos creada

USE yourpcstore;

-- creacion de las tablas

CREATE TABLE Tienda(
id_tienda INT NOT NULL,
nom_tienda VARCHAR(45) NOT NULL,
dirrecion VARCHAR(45) NOT NULL,
telefono INT NOT NULL,
 PRIMARY KEY(id_tienda));

CREATE TABLE Distribuidor(
id_distribuidor INT NOT NULL,
nombres VARCHAR(45) NOT NULL,
id_tienda INT NOT NULL,
 PRIMARY KEY (id_distribuidor),
 CONSTRAINT fk_idtienda_distribuidor FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda));
 
CREATE TABLE Producto(
id_producto INT NOT NULL,
nom_producto VARCHAR(45) NOT NULL,
precio DECIMAL(10,3) NOT NULL,
id_distribuidor INT NOT NULL,
 PRIMARY KEY(id_producto),
 CONSTRAINT fk_iddistribuidor_producto FOREIGN KEY (id_distribuidor) REFERENCES Distribuidor(id_distribuidor));

CREATE TABLE Rol(
id_rol INT NOT NULL,
rol VARCHAR(45) NOT NULL,
 PRIMARY KEY(id_rol));

CREATE TABLE Combos(
id_combo INT NOT NULL,
precio DECIMAL(10,3) NOT NULL,
id_producto INT NOT NULL, 
PRIMARY KEY(id_combo),
 CONSTRAINT fk_idproducto_combos FOREIGN KEY (id_producto) REFERENCES producto(id_producto));
  
CREATE TABLE Promociones(
id_promociones INT NOT NULL,
fecha_ini DATETIME(6) NOT NULL,
fecha_fin DATETIME(6) NOT NULL,
precio DECIMAL(10,3) NOT NULL,
id_producto INT NOT NULL,
PRIMARY KEY(id_promociones),
 CONSTRAINT fk_idproducto_promociones FOREIGN KEY (id_producto) REFERENCES producto(id_producto));
 
 CREATE TABLE Usuario(
id_usuario INT NOT NULL,
nombres VARCHAR(45) NOT NULL,
apellidos VARCHAR(45) NOT NULL,
correo VARCHAR(45) NOT NULL,
`contraseña` VARCHAR(45) NOT NULL,
telefono INT NOT NULL,
celular INT NOT NULL,
fecha_nac DATETIME(6) NOT NULL,
dirrecion VARCHAR(45) NOT NULL,
fk_id_rol INT NOT NULL,
PRIMARY KEY(id_usuario),
 CONSTRAINT fk_idrol_usuario FOREIGN KEY (fk_id_rol) REFERENCES rol(id_rol));
  
 CREATE	TABLE Consultas(
 id_consulta INT NOT NULL,
 precio DECIMAL(10,3) NOT NULL,
 fecha DATETIME(6) NOT NULL,
 id_producto INT NOT NULL,
 id_usuario INT NOT NULL,
 PRIMARY KEY(id_consulta),
  CONSTRAINT fk_idproducto_consultas FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  CONSTRAINT fk_idusuario_consultas FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario));
  
CREATE TABLE Venta(
id_venta INT NOT NULL,
fecha_venta DATETIME(6) NOT NULL,
valor_venta DECIMAL(10,3) NOT NULL,
id_usuario INT NOT NULL,
id_tienda INT NOT NULL,
id_producto INT NOT NULL,
PRIMARY KEY(id_venta),
 CONSTRAINT fk_idusuario_venta FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
 CONSTRAINT fk_idtienda_venta FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
 CONSTRAINT fk_idproducto_venta FOREIGN KEY (id_producto) REFERENCES producto(id_producto));
 
-- ingresar datos a las tablas

INSERT INTO Rol(id_rol,rol) VALUES 
('1','usuario'),
('2','administrador'),
('3','empleado');

INSERT INTO Usuario(id_usuario,nombres,apellidos,correo,`contraseña`,telefono,celular,fecha_nac,dirrecion,fk_id_rol) VALUES
('1','Paula Andrea','Camacho Ortega','Paulajh12@gmail.com','paulakkk98','775698441','313658746',CURRENT_TIMESTAMP(),'AV CLL89 CR78-A','1'),
('2','Carlos Andres','Martinez Sanabria','carlos5521@gmail.com','p22451775','313547896','369857455',CURRENT_TIMESTAMP(),'AV CLL69 CR7-b','1'),
('3','Maicol Eduardo','Rodriguez Garnica','Maill551@gmail.com','ml87984sds','258746985','145587446',CURRENT_TIMESTAMP(),'AV CLL32 CR9-2b','1'),
('4','Lydia Buendia','Tovar Soria','YTT45881@gmail.com','2154polll','112547896','589667485',CURRENT_TIMESTAMP(),'AV CLL11 CR7b-56','2'),
('5','Eva Camara','Rebeca Olivera','Olivera561@gmail.com','256974551','832547896','458875693',CURRENT_TIMESTAMP(),'AV CLL25 CR89b-45','2'),
('6','Eneko Lucena','Enrique Tovar','ENTO444@gmail.com','tovarppooo22','321444584','589663231',CURRENT_TIMESTAMP(),'AV CLL9 CR8-74','2'),
('7','Ariadna Chico','Eulalia Pedrosa','Eulalias456@gmail.com','as5d4as564d6','125694753','458967485',CURRENT_TIMESTAMP(),'AV CLL45 CR98-C','3'),
('8','Guillem Camacho','Salvadora Bravo','Guille8797@gmail.com','54545sds','547896222','45289456',CURRENT_TIMESTAMP(),'AV CLL45 CR98-C','1'),
('9','Carmelo Barroso','Irune Barroso','Barroso5467@gmail.com','5245487wewewe','587496523','231546520',CURRENT_TIMESTAMP(),'AV CLL85 CR98-C','2'),
('10','Matilde Ibarra','Fatima Romero','Matilde5465@gmail.com','sdasdwacxv','254669835','123654247',CURRENT_TIMESTAMP(),'AV CLL45 CR98-C','3'),
('11','Vasile Dueñas','Clemente Grau','Vasile54648@gmail.com','546787121','120025478','123325648',CURRENT_TIMESTAMP(),'AV CLL12 CR98-C','2'),
('12','Cristobal Caro','Ariana Chico','Cristo666@gmail.com','trtr45444','363988965','568876547',CURRENT_TIMESTAMP(),'AV CLL65 CR98-C','2'),
('13','Paula Prat','Maximino Escobar','Paula457@gmail.com','sdsfd445787','454714859','632125648',CURRENT_TIMESTAMP(),'AV CLL78 CR98-C','3'),
('14','Concepcio Manso','Guillermo Cabezas','Concepcio7412@gmail.com','369865784','569874123','564897531',CURRENT_TIMESTAMP(),'AV CLL98 CR98-C','3'),
('15','Elena Lara','Alexander Mir','Alexander9898@gmail.com','s5545d47d','236985639','356156478',CURRENT_TIMESTAMP(),'AV CLL28 CR98-C','1'),
('16','Hamid Encinas','Gines Machado','Hamid4578@gmail.com','57f87f845d','265896358','125698743',CURRENT_TIMESTAMP(),'AV CLL49 CR98-C','2'),
('17','Francesc Castaño','Amalia Exposito','Fras4545@gmail.com','57894212','325698741','563388945',CURRENT_TIMESTAMP(),'AV CLL78 CR98-C','1'),
('18','Jesús Lara','Benedicta Miranda','ssssewe@gmail.com','5021231456','326541258','568793541',CURRENT_TIMESTAMP(),'AV CLL65 CR98-C','2'),
('19','Naia Boix','Natividad Gamero','Bo7ss@gmail.com','fdfdghfgf','236562489','658794538',CURRENT_TIMESTAMP(),'AV CLL45 CR37-C','2'),
('20','Igor Carrero','Dina Novoa','asd4589wa@gmail.com','241548dsdsds','369857456','687995432',CURRENT_TIMESTAMP(),'AV CLL42 CR98-C','3');


INSERT INTO Tienda(id_tienda,nom_tienda,dirrecion,telefono) VALUES
('1','Cleveland Compu Cell','18237 Halvorson Garden Suite 397 - Beloit, TX','548697454'),
('2','CXo PC','46934 Annamarie Curve Suite 483 - Honolulu, MT','546542315'),
('3','The Compu House','05773 Crist Crossing Suite 606 - Kansas City,','258857497'),
('4','Litelight Computers','4492 Zelma Springs Suite 976 - Fargo, DE','259844789'),
('5','PC Plus Tuche','73203 West Divide Apt. 606 - Bremerton, MA','548859642'),
('6','Cleveland Cell','18237 Halvorson Garden Suite 397 - Beloit, TX','658975463'),
('7','CXo','46934 Annamarie Curve Suite 483 - Honolulu, MT','653211235'),
('8','The House','05773 Crist Crossing Suite 606 - Kansas City,','648678954'),
('9','Computers','4492 Zelma Springs Suite 976 - Fargo, DE','457896425'),
('10','Plus Tuche','73203 West Divide Apt. 606 - Bremerton, MA','412578965');

INSERT INTO Distribuidor(id_distribuidor,nombres,id_tienda) VALUES
('1','Escape 2 Your Slider','1'),
('2','CherryBerryPC','1'),
('3','Elite PC Company','2'),
('4','CompoCell','2'),
('5','PC Guru Tack Shed','3'),
('6','Sumitomo Computers','4'),
('7','CJL Electronics','4'),
('8','Glu Mobile Windows','5');

INSERT INTO Producto(id_producto,nom_producto,precio,id_distribuidor) VALUES
('1','Audifonos','10.000','1'),
('2','Disco Duro','85.000','1'),
('3','Raton','74.000','2'),
('4','Alfombra','8.000','3'),
('5','Audifonos','65.500','4'),
('6','Alfombra','7.500','5'),
('7','Teclado','98.451','2');

INSERT INTO Consultas(id_consulta,precio,fecha,id_producto,id_usuario) VALUES
('1','10,000',CURRENT_TIMESTAMP(),'1','3'),
('2','85,000',CURRENT_TIMESTAMP(),'2','15'),
('3','85,000',CURRENT_TIMESTAMP(),'2','8'),
('4','74,000',CURRENT_TIMESTAMP(),'3','6'),
('5','8,000',CURRENT_TIMESTAMP(),'4','13'),
('6','65,000',CURRENT_TIMESTAMP(),'5','9'),
('7','65,000',CURRENT_TIMESTAMP(),'7','10'),
('8','7,500',CURRENT_TIMESTAMP(),'6','2');


INSERT INTO Venta(id_venta,fecha_venta,valor_venta,id_usuario,id_tienda,id_producto) VALUES
('1',CURRENT_TIMESTAMP(),'10.000','1','3','1'),
('2',CURRENT_TIMESTAMP(),'148.000','1','3','3'),
('3',CURRENT_TIMESTAMP(),'16.000','7','2','4'),
('4',CURRENT_TIMESTAMP(),'8.000','2','2','4'),
('5',CURRENT_TIMESTAMP(),'7.500','4','1','5'),
('6',CURRENT_TIMESTAMP(),'13.000','3','4','5'),
('7',CURRENT_TIMESTAMP(),'85.000','5','4','2'),
('8',CURRENT_TIMESTAMP(),'85.200','6','5','2');

INSERT INTO Combos(id_combo,precio,id_producto) VALUES
('1','100,000','1'),
('2','500,000','1'),
('3','600,000','3'),
('4','750,000','4'),
('5','417,000','5'),
('6','325,000','6'),
('7','547,000','7'),
('8','325,000','7'),
('9','387,000','2');

INSERT INTO Promociones(id_promociones,fecha_ini,fecha_fin,precio,id_producto) VALUES
('1',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP(),'9.500','1'),
('2',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP(),'9.000','1'),
('3',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP(),'80.000','2'),
('4',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP(),'70.000','3'),
('5',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP(),'7.000','4'),
('6',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP(),'7.500','4'),
('7',CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP(),'6.500','4');

-- ejecutar colsultas

SELECT pro.id_producto, pro.precio, pro.id_distribuidor, ven.fecha_venta, ven.id_venta, ven.valor_venta, ven.id_usuario
 FROM producto pro, venta ven
 WHERE pro.id_producto = ven.id_producto;
 
SELECT usu.id_usuario, usu.nombres, usu.apellidos, usu.telefono, ro.rol
 FROM usuario usu, rol ro
 WHERE usu.fk_id_rol = ro.id_rol;

SELECT usu.id_usuario, usu.nombres, usu.apellidos, usu.telefono, ro.rol
 FROM usuario usu, rol ro
 WHERE usu.fk_id_rol = ro.id_rol
 AND ro.id_rol = 2;

SELECT tien.id_tienda, tien.dirrecion, tien.telefono,dis.id_distribuidor, dis.nombres
 FROM tienda tien 
 JOIN distribuidor dis
 ON (tien.id_tienda = dis.id_tienda);
 
SELECT pro.id_producto, pro.precio, prom.fecha_ini, prom.fecha_fin, prom.precio
 FROM producto pro 
 JOIN promociones prom
 ON (pro.id_producto = prom.id_producto);
 
 SELECT usu.id_usuario, usu.nombres, usu.apellidos, usu.fecha_nac, con.id_consulta, con.precio, con.fecha
 FROM usuario usu
 JOIN consultas con
 ON (usu.id_usuario = con.id_usuario);
 
