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

create table libros (
    id int auto_increment not null, -- Auto incrementa
    titulo varchar(40) not null, -- Nunca puede ser null
    autor varchar(30) null, -- Es el valor por defecto, si no trae nada, por defecto es null,
    primary key (id)
);

create table libros (
    id int unsigned auto_increment not null primary key, -- Otra forma de poner el primary key
    autor varchar(50) not null,
    titulo varchar(50) not null,
    precio int unsigned, -- unsigned permite que la propiedad no pueda tener un valor negativo, solo pueden ser numeros, y en caso de que pongamos un negativo tirara un error
    cantidad int unsigned
);

-- Operadores logicos
select * from libros where id > 2 and id > 5; -- Solo seleccionara los que  cumplan con las dos condiciones
select * from libros where id > 2 or id > 5; -- Al menos debe cumplirse una condicion, pero si se cumplen las dos, ejecuta las dos
select * from libros where id > 2 xor titulo = "Creativo"; -- Solo ejecutara una y sera la que si se cumpla, si se cumplen las dos, solo ejecutara la primera
select * from libros where not(titulo = "Creativo"); -- Seleccionara a todos, excepto a los que cumplan con la condicion, ojo que el not lleva parentesis ()

-- Order by
select * from libros order by price; -- Valor por defecto: asc
select * from libros order by titulo desc; -- Ordena de mayor a menor
select * from libros order by cantidad asc; -- Equivale a lo primero 
select * from libros order by titulo desc, cantidad asc; -- Aqui lo que hace es primero ordenar con base a la primera indicacion, luego, cuando ya esten ordenados, si hay registros con el mismo valor, agarra ese grupo de registros con esa propiedad en comun igual y lo que hace es ordenar ese grupito con base a su cantidad de menor a mayor (asc)

-- Like, not like
SELECT * FROM libros where titulo like "%Crea%"; -- Seleccionara los que que en el titulo contengan esa cadena de caracteres dentro de su valor
SELECT * FROM libros where titulo like "Creativo"; -- Seleccionara los que que en el titulo tengan ese valor como valor total
SELECT * FROM libros where titulo like "Crea%"; -- Seleccionara los que que en el titulo empiecen con esa cadena de caracteres
SELECT * FROM libros where titulo like "%tivo"; -- Seleccionara los que que en el titulo terminen con esa cadena de caracteres
SELECT * FROM libros where titulo like "_______"; -- Seleccionara los que que en el titulo contengan la cantidad de caracteres igual a la cantidad de guiones
SELECT * FROM libros where titulo like "C_e_____"; -- Seleccionara los que se tengan como valor exactamente esas letras y esa cantidad de caracteres y en esas posiciones
-- Es lo mismo con not like, pero va a seleccionar los que no cumplan con la condicion

-- In, between
select * from libros where titulo in("Creativo", "Chistazos", "Humor nigga", "El libro que no existe", "Otro libro"); -- Va seleccionar los que tengan en esa propiedad un valor igual a cualquiera de los que estan dentro, si esta lo selecciona, si no existe, simplemente no lo selecciona porque no existe
select * from libros where titulo between "C" and "hz"; -- Lo que va hacer internamente aqui es ordenar los titulos en orden alfabetico y va seleccionar los que se encuentren en ese rango. Lo que hace internamente es hacer como si esos valores estuvieran en la tabla en la columna "titulo" pero en realidad no lo estan pero si forman parte del ordenamiento en orden alfabetico. De hecho si los valores pasados son iguales a valores que si existen, si los seleccionara incluyendolos a ellos.
select * from libros where precio between 200 and 300; -- Simplemente seleccionara los que tengan un precio dentro de ese rango