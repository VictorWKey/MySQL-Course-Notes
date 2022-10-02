-- Curso de MySQL

-- SQL (Structure Query Language)

-- MySQL es un interpretador de SQL y administra bases de datos

-- Creamos la base de datos "administracion"
create database administracion;

-- Creamos la base de datos "biblioteca"
create database biblioteca;

-- Mostramos las bases de datos que existen
show databases;

-- Indicamos que base de datos vamos a utilizar
use administracion;

-- Creamos una tabla
create table usuarios(
    nombre varchar(50), --Varchar es lo mismo que string
    edad int()
);

create table personas(
    nombre varchar(50), --El 50 es la cantidas maxima de caracteres
    apellido varchar(50)
);



-- Eliminar una tabla
drop table personas;

-- Mostramos todas las tablas
show tables;

-- Describir el tipo de columnas que hay y otra informacion
describe usuarios;

-- Funciona igual que "describe", muestra las columnas
show columns from usuarios;

-- Eliminar tabla solo si esta creada, para que no tire un error y mejor tire una advertencia
drop table if exists personas;

-- Insertamos a tabla usuarios, solo en algunas columnas, no en todas
insert into usuarios(nombre, edad) values("Victor Lopez", 14);
insert into usuarios(nombre, edad) values("Elvia Gutierrez", 17);
insert into usuarios(nombre, edad) values("Alonso Juarez", 16);
insert into usuarios(nombre, edad) values("Arturo Mercado", 28);

-- Basicamente lo que hace select es seleccionar las columnas que vamos a consultar y mostrar
select nombre, edad from usuarios;

-- Hacemos una inserccion en todas las columnas de acuerdo al orden en que aparecen
insert into libros values("Roberto Mtz", "Creativo", 370.5, 150);
insert into libros values("Leonardo Davincci", "El sol es vida", 980.7, 600);

-- Mostrar  y consultar todos las las columnas
select * from libros;

-- Mostrar filas que cumplan con la condicion de una columna por medio del "where" 
select * from empleados where nombre = "Victor Lopez"; -- En vez de usar el "=" podemos utilizar tambie el <, >, >=, etc.
select nombre from empleados where id = 4;

-- <> ditinto, equivale al != de javascript

-- Esta es la forma en la que se deberia poder eliminar un registro pero una opcion de MySQL no lo permite para evitar equivocaciones, a fuerza tenemos que pedirle que borre un registro pero en la condicion del where debe ir el id, no otra columna
delete from libros where cantidad = 600;

-- Osea asi 
delete from libros where id = 3;

-- Cuidado con poner lo siguiente porque te eliminaria todos los registros de la tabla
delete from libros;

-- En teoria de la manera siguiente es como se deberia actualizar el valor de un registro, pero no se hace asi porque si el modo seguro esta activado, nos evitara cometer grandes errores, tendriamos que pasar el valor del id despues del where para que si nos de chance
update empleados set nombre = "Jorge Andres", apellido = "Lopez Romero" where nombre = "Esperanza Monica";

-- Evita poner lo siguiente porque actualizaras toda la columna
update empleados set nombre = "Jorge Andres";

-- La primary key es la columna y caracteristica de cada registro que sera unica y diferente para cada uno de los registros
-- Podemos elegir como primary key cualquier propiedad pero por lo general es el id

create table usuarios(
    nombre varchar(50),
    id integer,
    primary key(id)
);