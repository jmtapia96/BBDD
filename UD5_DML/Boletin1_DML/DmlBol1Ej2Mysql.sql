CREATE TABLE CICLISTA
(
	nombreciclista VARCHAR(40),
	fnacimiento DATE,
	nacionalidad VARCHAR(20),
	
	CONSTRAINT PK_CICLISTA PRIMARY KEY (nombreciclista)
);

CREATE TABLE EQUIPO
(
	nombreequipo VARCHAR(20),
	
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
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('Alejandro Valverde',STR_TO_DATE ('1980/04/25','%y/%m/%d'),'Español');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('Alejandra Valverde',TO_DATE ('1980/04/25','YYYY/MM/DD'),'Español');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('Mathias Norsgaard',TO_DATE ('1997/05/01','YYYY/MM/DD'),'Danés');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('Primox Roglic',TO_DATE ('1997/01/01','YYYY/MM/DD'),'Esloveno');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('R. Gesink',TO_DATE ('2003/05/01','YYYY/MM/DD'),'Holandés');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('S. Bennett',TO_DATE ('2000/08/03','YYYY/MM/DD'),'Irlandés');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('M. Soler',TO_DATE ('2003/11/09','YYYY/MM/DD'),'Español');
INSERT INTO CICLISTA (nombreciclista,fnacimiento,nacionalidad) VALUES ('JM. Muñoz',TO_DATE ('1996/05/12','YYYY/MM/DD'),'San Jose de la Rda');


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

INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E1_2022',TO_DATE('2022','YYYY'),23,'R. Gesink');
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E2_2022',TO_DATE('2022','YYYY'),175,'Primox Roglic');
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E3_2022',TO_DATE('2022','YYYY'),193,'S. Bennett');
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E1_2021',TO_DATE('2021','YYYY'),154,'S. Bennett');
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E2_2021_2',TO_DATE('2021','YYYY'),189,'M. Soler');
/*El nombre de prueba de este ultimo insert es igual que el anterior, por lo que fallaria y se modifica levemente para que no de error*/
INSERT INTO PRUEBA (nombreprueba,anio,kmtotales,ciclistaganador) VALUES('E1_2020',TO_DATE('2020','YYYY'),40,'Alejandro Valverde');


/*UPDATES*/

/*Tabla PRUEBA*/

UPDATE PRUEBA SET nombreprueba='Contra_'||TO_CHAR(anio,'YYYY') WHERE kmtotales<100;


/*3.*/

CREATE TABLE ciclistasEspanoles
(
	nombreciclista VARCHAR(40),
	nombreequipo VARCHAR(20),

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



SELECT * FROM PERTENECE;
SELECT * FROM CICLISTA;
SELECT * FROM EQUIPO;
SELECT * FROM PRUEBA;
SELECT * FROM ciclistasEspanoles;
