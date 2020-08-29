--CANCHAS
CREATE TABLE cancha
(
 `id_cancha`   bigint NOT NULL ,
 `id_complejo` bigint NOT NULL ,
 `capacidad`   int NOT NULL ,
 `nombre`      varchar(50) NOT NULL ,


 CONSTRAINT `PK_cancha` PRIMARY KEY (`id_cancha` ASC),
 CONSTRAINT `FK_17` FOREIGN KEY (`id_complejo`)  REFERENCES complejo(`id_complejo`)
);


CREATE NONCLUSTERED INDEX `fkIdx_18` ON [cancha] 
 (
  `id_complejo` ASC
 )

GO

--COMPLEJO
CREATE TABLE complejo
(
 `id_complejo`  bigint NOT NULL ,
 `nombre`       varchar(50) NOT NULL ,
 `geo_latitud`  bigdecimal NOT NULL ,
 `geo_longitud` bigdecimal NOT NULL ,
 `direccion`    nvarchar(50) NOT NULL ,


 CONSTRAINT `PK_complejo` PRIMARY KEY (`id_complejo` ASC)
);

--ENCARGADO
CREATE TABLE encargado
(
 `id_encargado` bigint NOT NULL ,
 `id_complejo`  bigint NOT NULL ,
 `nombre`       varchar(50) NOT NULL ,
 `apellido`     varchar(50) NOT NULL ,
 `password`     varchar(50) NOT NULL ,


 CONSTRAINT `PK_administrador` PRIMARY KEY (`id_encargado` ASC),
 CONSTRAINT `FK_53` FOREIGN KEY (`id_complejo`)  REFERENCES complejo(`id_complejo`)
);


CREATE NONCLUSTERED INDEX `fkIdx_53` ON [encargado] 
 (
  `id_complejo` ASC
 )

GO

--JUGADOR
CREATE TABLE jugador
(
 `id_jugador` bigint NOT NULL ,
 `nombre`     varchar(50) NOT NULL ,
 `apellido`   varchar(50) NOT NULL ,
 `usuario`    varchar(50) NOT NULL ,
 `password`   varchar(50) NOT NULL ,


 CONSTRAINT `PK_jugador` PRIMARY KEY (`id_jugador` ASC)
);

--RESERVA
CREATE TABLE reserva
(
 `id_reserva`   NOT NULL ,
 `id_complejo` bigint NOT NULL ,
 `id_cancha`   bigint NOT NULL ,
 `id_jugador`  bigint NOT NULL ,
 `estado`      varchar(50) NOT NULL ,
 `desde`       datetime(3) NOT NULL ,
 `hasta`       datetime(3) NOT NULL ,


 CONSTRAINT `PK_reserva` PRIMARY KEY (`id_reserva` ASC),
 CONSTRAINT `FK_11` FOREIGN KEY (`id_cancha`)  REFERENCES cancha(`id_cancha`),
 CONSTRAINT `FK_23` FOREIGN KEY (`id_complejo`)  REFERENCES complejo(`id_complejo`),
 CONSTRAINT `FK_68` FOREIGN KEY (`id_jugador`)  REFERENCES jugador(`id_jugador`)
);


CREATE NONCLUSTERED INDEX `fkIdx_12` ON [reserva] 
 (
  `id_cancha` ASC
 )

GO

CREATE NONCLUSTERED INDEX `fkIdx_23` ON [reserva] 
 (
  `id_complejo` ASC
 )

GO

CREATE NONCLUSTERED INDEX `fkIdx_68` ON [reserva] 
 (
  `id_jugador` ASC
 )

GO





