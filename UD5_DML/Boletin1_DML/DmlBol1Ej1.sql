CREATE TABLE PROFESORES
(
	dni VARCHAR2(10),
	nombre VARCHAR2(20),
	apellido1 VARCHAR2(20),
	apellido2 VARCHAR2(20),
	direccion VARCHAR2(30),
	titulo VARCHAR2(20),
	gana NUMBER(5),
	
	CONSTRAINT PK_PROFESORES PRIMARY KEY(dni)
);

CREATE TABLE CURSOS
(
	cod_curso VARCHAR2(5),
	nombre_curso VARCHAR2(20),
	dni_profesor VARCHAR2(20),
	maximo_alumnos NUMBER(5),
	fecha_inicio DATE,
	fecha_fin DATE,
	num_horas NUMBER(5),
	
	CONSTRAINT PK_CURSOS PRIMARY KEY(cod_curso),
	CONSTRAINT FK1_CRUSOS FOREIGN KEY(dni_profesor) REFERENCES PROFESORES(dni)
);

CREATE TABLE ALUMNOS
(
	dni VARCHAR2(10),
	nombre VARCHAR2(20),
	apellido1 VARCHAR2(20),
	apellido2 VARCHAR2(20),
	direccion VARCHAR2(30),
	sexo VARCHAR2(1),
	fecha_nacimiento DATE,
	curso VARCHAR2(3),
	
	CONSTRAINT PK_ALUMNOS PRIMARY KEY (dni),
	CONSTRAINT FK1_ALUMNOS FOREIGN KEY (curso) REFERENCES CURSOS(cod_curso)
);

--Tabla ALUMNOS

ALTER TABLE ALUMNOS ADD CONSTRAINT CHK_SEXO CHECK (sexo IN('H','M'));



--2. Insertar los datos

---Tabla PROFESORES

INSERT INTO PROFESORES (nombre,apellido1,apellido2,dni,direccion,titulo,gana) VALUES('Juan','Arch','López','32432455','Puerta Negra,4','Ing. Informática',7500); 
INSERT INTO PROFESORES (nombre,apellido1,apellido2,dni,direccion,titulo,gana) VALUES('María','Oliva','Rubio','43215643','Juan Alfonso 32','Lda. Fil. Inglesa',5400); 

--Tabla CURSOS

INSERT INTO CURSOS (nombre_curso,cod_curso,dni_profesor,maximo_alumnos,fecha_inicio,fecha_fin,num_horas) VALUES('Inglés Básico',1,'43215643',15,TO_DATE('2000/11/01','YYYY/MM/DD'), TO_DATE('2000/12/22','YYYY/MM/DD'),120);
INSERT INTO CURSOS (nombre_curso,cod_curso,dni_profesor,maximo_alumnos,fecha_inicio,fecha_fin,num_horas) VALUES('Administracion Linux',2,'32432455',NULL,TO_DATE('2000/09/01','YYYY/MM/DD'),NULL,80);

--Tabla ALUMNOS
INSERT INTO ALUMNOS (nombre,apellido1,apellido2,dni,direccion,sexo,fecha_nacimiento,curso) VALUES('Lucas','Manilva','López','123523','Alhamar, 3','H',TO_DATE('1979-11-01','YYYY-MM-DD'),1);
INSERT INTO ALUMNOS (nombre,apellido1,apellido2,dni,direccion,sexo,fecha_nacimiento,curso) VALUES('Antonia','López','Alcantara','2567567','Maniquí, 21','M',NULL,2);
INSERT INTO ALUMNOS (nombre,apellido1,apellido2,dni,direccion,sexo,fecha_nacimiento,curso) VALUES('Manuel','Alcantara','Pedrós','3123689','Julian, 2','2',NULL,1);
--El insert falla por el chk de sexo, que debe ser H o M
INSERT INTO ALUMNOS (nombre,apellido1,apellido2,dni,direccion,sexo,fecha_nacimiento,curso) VALUES('José','Peréz','Caballar','4896765','Jarcha,5 ','H',TO_DATE('1977-02-03','YYYY-MM-DD'),3);
--El insert falla porque el curso 3 no existe


--3. Insertar la siguiente tupla en ALUMNOS:
INSERT INTO ALUMNOS (nombre,apellido1,apellido2,dni,direccion,sexo,fecha_nacimiento,curso) VALUES('Sergio','Navas','Retal','123523',NULL,'P',NULL,2);
--El insert falla por el chk de sexo, que debe ser H o M

--4. Insertar las siguientes tupla en la tabla profesores:
INSERT INTO PROFESORES (nombre,apellido1,apellido2,dni,direccion,titulo,gana)  VALUES('Juan','Arch','López','32432455','Puerta Negra,4','Ing. Informática',NULL);
--El insert falla proque el profesor ya existe

--5. Insertar la siguiente tupla en la tabla estudiante
INSERT INTO ALUMNOS (nombre,apellido1,apellido2,dni,direccion,sexo,fecha_nacimiento) VALUES('María','Jaén','Sevilla',789678,'Martos, 5 ','M',NULL);

--6.- La fecha de nacimiento de Antonia López está equivocada. La verdadera es 23 de diciembre de 1976.
UPDATE ALUMNOS SET fecha_nacimiento=TO_DATE('1976-12-23','YYYY-MM-DD') WHERE nombre='María';

--7.- Cambiar a Antonia López al curso de código 5.
UPDATE ALUMNOS SET curso='5' WHERE nombre='María';
--El insert no funciona porque el dato curso no hay 5 y salta la fk1_curso


--8.- Eliminar la profesora Laura Jiménez
DELETE FROM PROFESORES WHERE dni='';
--El DELETE falla porque no existe esa profesora, se debe añadir previamente

--9. Borrar el curso con codigo 1.
DELETE FROM CURSOS WHERE cod_curso='1';


--10. Añadir un campo llamado numero_alumnos en la tabla curso
ALTER TABLE CURSOS ADD numero_alumnos NUMBER(10);

--11.Modificar la fecha de nacimiento a 01/01/2012 en aquellos alumnos que no tengan fecha de nacimiento.
UPDATE ALUMNOS SET fecha_nacimiento=TO_DATE('2012-01-01','YYYY-MM-DD') WHERE fecha_nacimiento=NULL;

--12.- Borra el campo sexo en la tabla de alumnos.
ALTER TABLE ALUMNOS DROP COLUMN SEXO;

--13.- Modificar la tabla profesores para que los profesores de Informática cobren un 20 pro ciento más de lo que cobran actualmente.
UPDATE PROFESORES SET gana = gana * 1.20 WHERE titulo LIKE '%informática';

--14.- Modifica el dni de Juan Arch a 1234567
UPDATE CURSOS SET dni_profesor= '1234567' WHERE dni_profesor='32432455';

--15.- Modifica el dni de todos los profesores de informática para que tengan el dni 7654321
UPDATE PROFESORES SET DNI='1234567' WHERE TITULO='Informática';

--16.- Cambia el sexo de la alumna María Jaén a F.
UPDATE ALUMNOS SET SEXO='F' WHERE DNI='789678';


SELECT * FROM ALUMNOS;
SELECT * FROM CURSOS;
SELECT * FROM PROFESORES;

