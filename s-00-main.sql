--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 05/12/2023
--@Descripción: Invoca a los otros scripts

prompt Ingresa la contraseña para sys

CONNECT sys AS sysdba

DROP USER qu_proy_admin cascade;
DROP USER qu_proy_invitado cascade;
DROP ROLE rol_admin;
DROP ROLE rol_invitado;

COMMIT; 

define p_archivo_usuarios='s-01-usuarios.sql'
define p_archivo_entidades='s-02-entidades.sql'
define p_archivo_tablas_temporales='s-03-tablas-temporales.sql'
define p_archivo_tablas_externas='s-04-tablas-externas.sql'
define p_archivo_secuencias='s-05-secuencias.sql'
define p_archivo_indices='s-06-indices.sql'
define p_archivo_sinonimos='s-07-sinonimos.sql'
define p_archivo_vistas='s-08-vistas.sql'
define p_carga_inicial='s-09-carga-inicial.sql'
define p_consultas='s-10-consultas.sql'
defina p_get_extension='s-15-fx-get-extension.sql'
define p_leer_foto='s-17-lob-leer-foto.sql'


--Invocando validador
whenever sqlerror CONTINUE rollback
set serveroutput on
set verify off
set feedback off
--set echo off

@@&&p_archivo_usuarios

prompt Ingresa la contraseña para qu_proy_admin
CONNECT qu_proy_admin

@@&&p_archivo_entidades
@@&&p_archivo_tablas_temporales
@@&&p_archivo_tablas_externas
@@&&p_archivo_secuencias
@@&&p_archivo_indices
@@&&p_archivo_sinonimos
@@&&p_archivo_vistas
@@&&p_carga_inicial

prompt Creando función get extensión y leer_foto

@@&&p_get_extension
@@&&p_leer_foto



