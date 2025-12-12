CREATE TABLE CICLISTA
(
	nombreciclista VARCHAR2(40),
	fnacimiento DATE,
	nacionalidad VARCHAR2(20),
	
	CONSTRAINT PK_CICLISTA PRIMARY KEY (nombreciclista)
);

CREATE TABLE EQUIPO
(
	nombreequipo VARCHAR2(20),
	
	CONSTRAINT PK_EQUIPO PRIMARY KEY (nombreequipo)
);

CREATE TABLE PERTENECE
(
	nombreciclista VARCHAR2(40),
	nombreequipo VARCHAR2(40),

	CONSTRAINT PK_PERTENECE PRIMARY KEY (nombreciclista),
	CONSTRAINT FK1_PERTENECE FOREIGN KEY (nombreciclista) REFERENCES CICLISTA(nombreciclista),
	CONSTRAINT FK2_PERTENECE FOREIGN KEY (nombreequipo) REFERENCES EQUIPO(nombreequipo)

	
);

CREATE TABLE PRUEBA
(
	nombreprueba VARCHAR2(20),
	anio NUMBER(5),
	kmtotales NUMBER(5),
	ciclistaganador VARCHAR2(40),

	CONSTRAINT PK_PRUEBA PRIMARY KEY (nombreprueba),
	CONSTRAINT FK1_PRUEBA FOREIGN KEY  (ciclistaganador) REFERENCES CICLISTA (nombreciclista)
);

--Tabla EQUIPO

--Tabla CICLISTA
INSERT INTO CICLISTA VALUES ('');


--Tabla PERTENECE

--Tabla PRUEBA

INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES();