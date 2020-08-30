CREATE TABLE complejo
(
 `id_complejo`  int NOT NULL ,
 `nombre`       varchar(50) NOT NULL ,
 `geo_latitud`  varchar(100) NOT NULL ,
 `geo_longitud` varchar(100) NOT NULL ,
 `direccion`    nvarchar(50) NOT NULL ,


 PRIMARY KEY AUTO_INCREMENT (`id_complejo`)
);

ALTER TABLE complejo MODIFY id_complejo int NOT NULL AUTO_INCREMENT;

INSERT INTO complejo (nombre, geo_latitud, geo_longitud, direccion)
values("Los amigos", "12321412S", "12421515W", "Otamendi 3241, Villa Carlos Paz");

DROP TABLE complejo;

ALTER TABLE complejo
ADD COLUMN geo_latitud varchar(100) NOT NULL;
ALTER TABLE complejo
ADD COLUMN geo_longitud varchar(100) NOT NULL;

ALTER TABLE complejo
CHANGE id_complejo id_complejo INT(10) AUTO_INCREMENT;
DESC ALLITEMS;

CREATE TABLE cancha
(
 `id_cancha`   bigint NOT NULL ,
 `id_complejo` bigint NOT NULL ,
 `capacidad`   int NOT NULL ,
 `nombre`      varchar(50) NOT NULL ,


 CONSTRAINT `PK_cancha` PRIMARY KEY AUTO_INCREMENT (`id_cancha` ASC),
 CONSTRAINT `FK_17` FOREIGN KEY (`id_complejo`)  REFERENCES complejo(`id_complejo`)
);

CREATE TABLE encargado
(
 `id_encargado` bigint NOT NULL ,
 `id_complejo`  bigint NOT NULL ,
 `nombre`       varchar(50) NOT NULL ,
 `apellido`     varchar(50) NOT NULL ,
 `password`     varchar(50) NOT NULL ,


 CONSTRAINT `PK_administrador` PRIMARY KEY AUTO_INCREMENT (`id_encargado` ASC),
 CONSTRAINT `FK_53` FOREIGN KEY (`id_complejo`)  REFERENCES complejo(`id_complejo`)
);

CREATE TABLE jugador
(
 `id_jugador` bigint NOT NULL ,
 `nombre`     varchar(50) NOT NULL ,
 `apellido`   varchar(50) NOT NULL ,
 `usuario`    varchar(50) NOT NULL ,
 `password`   varchar(50) NOT NULL ,


 CONSTRAINT `PK_jugador` PRIMARY KEY AUTO_INCREMENT (`id_jugador` ASC)
);

CREATE TABLE reserva
(
 `id_reserva`  bigint NOT NULL ,
 `id_complejo` bigint NOT NULL ,
 `id_cancha`   bigint NOT NULL ,
 `id_jugador`  bigint NOT NULL ,
 `estado`      varchar(50) NOT NULL ,
 `desde`       datetime(3) NOT NULL ,
 `hasta`       datetime(3) NOT NULL ,


 CONSTRAINT `PK_reserva` PRIMARY KEY  AUTO_INCREMENT(`id_reserva` ASC),
 CONSTRAINT `FK_11` FOREIGN KEY (`id_cancha`)  REFERENCES cancha(`id_cancha`),
 CONSTRAINT `FK_23` FOREIGN KEY (`id_complejo`)  REFERENCES complejo(`id_complejo`),
 CONSTRAINT `FK_68` FOREIGN KEY (`id_jugador`)  REFERENCES jugador(`id_jugador`)
);