--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Creación de usuarios para el sistema de virtual payroll

-- Usuarios
CREATE USER qu_proy_admin IDENTIFIED BY qu quota unlimited ON users;
CREATE USER qu_proy_invitado IDENTIFIED BY qu quota unlimited ON users;

-- Roles
CREATE ROLE rol_admin;
GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE, CREATE TRIGGER,
  CREATE VIEW, CREATE SEQUENCE, CREATE synonym 
TO rol_admin;

CREATE ROLE rol_invitado;
GRANT CREATE SESSION TO rol_invitado;

-- Asignación de roles
GRANT rol_admin TO qu_proy_admin;
GRANT rol_invitado TO qu_proy_invitado;




 
