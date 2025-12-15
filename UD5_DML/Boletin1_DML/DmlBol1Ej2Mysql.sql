CREATE TABLE CICLISTA
(
	nombreciclista VARCHAR(40),
	fnacimiento DATE,
	nacionalidad VARCHAR(20),
	
	CONSTRAINT PK_CICLISTA PRIMARY KEY (nombreciclista)
);

CREATE TABLE EQUIPO
(
	nombreequipo VARCHAR(40),
	
	CONSTRAINT PK_EQUIPO PRIMARY KEY (nombreequipo)
);

CREATE TABLE PERTENECE
(
	nombreciclista VARCHAR(40),
	nombreequipo VARCHAR(40),

	CONSTRAINT PK_PERTENECE PRIMARY KEY (nombreciclista),
	CONSTRAINT FK1_PERTENECE FOREIGN KEY (nombreciclista) REFERENCES CICLISTA(nombreciclista),
	CONSTRAINT FK2_PERTENECE FOREIGN KEY (nombreequipo) REFERENCES EQUIPO(nombreequipo)

	
);

CREATE TABLE PRUEBA
(
	nombreprueba VARCHAR(20),
	anio DATE,
	kmtotales INT (5),
	ciclistaganador VARCHAR(40),

	CONSTRAINT PK_PRUEBA PRIMARY KEY (nombreprueba),
	CONSTRAINT FK1_PRUEBA FOREIGN KEY  (ciclistaganador) REFERENCES CICLISTA (nombreciclista)
);

/*INSERTS*/


/*Tabla EQUIPO*/
INSERT INTO EQUIPO (nombreequipo) VALUES('Movistar');
INSERT INTO EQUIPO (nombreequipo) VALUES('Jumbo');
INSERT INTO EQUIPO (nombreequipo) VALUES('Bora');
INSERT INTO EQUIPO (nombreequipo) VALUES('UAE Team');


/*Tabla CICLISTA*/
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('Alejandro Valverde',STR_TO_DATE ('1980/04/25','%Y/%m/%d'),'Español');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('Alejandra Valverde',STR_TO_DATE ('1980/04/25','%Y/%m/%d'),'Español');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('Mathias Norsgaard',STR_TO_DATE ('1997/05/01','%Y/%m/%d'),'Danés');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('Primox Roglic',STR_TO_DATE ('1997/01/01','%Y/%m/%d'),'Esloveno');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('R. Gesink',STR_TO_DATE ('2003/05/01','%Y/%m/%d'),'Holandés');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('S. Bennett',STR_TO_DATE ('2000/08/03','%Y/%m/%d'),'Irlandés');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('M. Soler',STR_TO_DATE ('2003/11/09','%Y/%m/%d'),'Español');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('JM. Muñoz',STR_TO_DATE ('1996/05/12','%Y/%m/%d'),'San Jose de la Rda');


/*Tabla PERTENECE*/
INSERT INTO PERTENECE (nombreciclista,nombreequipo) VALUES ('Alejandro Valverde','Movistar');
INSERT INTO PERTENECE (nombreciclista,nombreequipo) VALUES ('Alejandra Valverde','Movistar');
INSERT INTO PERTENECE (nombreciclista,nombreequipo) VALUES ('Mathias Norsgaard','Movistar');
INSERT INTO PERTENECE (nombreciclista,nombreequipo) VALUES ('Primox Roglic','Jumbo');
INSERT INTO PERTENECE (nombreciclista,nombreequipo) VALUES ('R. Gesink','Jumbo');
INSERT INTO PERTENECE (nombreciclista,nombreequipo) VALUES ('S. Bennett','Bora');
INSERT INTO PERTENECE (nombreciclista,nombreequipo) VALUES ('M. Soler','UAE Team');
INSERT INTO PERTENECE (nombreciclista,nombreequipo) VALUES ('JM. Muñoz','UAE Team');


/*Tabla PRUEBA*/

INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E1_2022',STR_TO_DATE('2022/01/01','%Y/%m/%d'),23,'R. Gesink');
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E2_2022',STR_TO_DATE('2022/01/01','%Y/%m/%d'),175,'Primox Roglic');
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E3_2022',STR_TO_DATE('2022/01/01','%Y/%m/%d'),193,'S. Bennett');
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E1_2021',STR_TO_DATE('2021/01/01','%Y/%m/%d'),154,'S. Bennett');
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E2_2021_2',STR_TO_DATE('2021/01/01','%Y/%m/%d'),189,'M. Soler');
/*El nombre de prueba de este ultimo insert es igual que el anterior, por lo que fallaria y se modifica levemente para que no de error*/
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E1_2020',STR_TO_DATE('202/01/01','%Y/%m/%d'),40,'Alejandro Valverde');


/*UPDATES*/

/*Tabla PRUEBA*/

UPDATE PRUEBA SET nombreprueba= CONCAT ('Contra_', DATE_FORMAT (anio,'%Y')) WHERE kmtotales<100;


/*3.*/

CREATE TABLE ciclistasEspanoles
(
	nombreciclista VARCHAR(40),
	nombreequipo VARCHAR(40),

	CONSTRAINT PK_CICLISTAS_ESP PRIMARY KEY (nombreciclista),
	CONSTRAINT FK1_CICLISTAS_ESP FOREIGN KEY (nombreciclista) REFERENCES CICLISTA(nombreciclista),
	CONSTRAINT FK2_CICLISTAS_ESP FOREIGN KEY (nombreequipo) REFERENCES EQUIPO(nombreequipo)
);

/*INSERTS*/

/*Tabla ciclistasEspanoles*/

INSERT INTO ciclistasEspanoles (nombreciclista,nombreequipo)
SELECT P.nombreciclista, P.nombreequipo FROM PERTENECE P
JOIN CICLISTA C ON P.NOMBRECICLISTA = C.NOMBRECICLISTA
WHERE C.nacionalidad='Español';


/*
SELECT * FROM PERTENECE;
SELECT * FROM CICLISTA;
SELECT * FROM EQUIPO;
SELECT * FROM PRUEBA;
SELECT * FROM ciclistasEspanoles;
*/