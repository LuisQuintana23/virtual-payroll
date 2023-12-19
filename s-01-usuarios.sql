--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Creación de usuarios para el sistema de virtual payroll

-- Usuarios
CREATE USER qu_proy_admin IDENTIFIED BY qu quota unlimited ON users;
CREATE USER qu_proy_invitado IDENTIFIED BY qu quota unlimited ON users;


-- Roles
CREATE ROLE rol_admin;
GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE, CREATE TRIGGER,
  CREATE VIEW, CREATE SEQUENCE, CREATE synonym, CREATE public synonym
TO rol_admin;

-- acceso al directorio de datos para tablas externas
create or replace directory data_dir as '/unam-bd/proyecto/data';
grant read, write on directory data_dir to rol_admin;

-- acceso para imagenes
create or replace directory picture_dir as '/unam-bd/proyecto/storage/picture';
grant read, write on directory picture_dir to rol_admin;

CREATE ROLE rol_invitado;
GRANT CREATE SESSION, CREATE synonym TO rol_invitado;

-- Asignación de roles
GRANT rol_admin TO qu_proy_admin;
GRANT rol_invitado TO qu_proy_invitado;

