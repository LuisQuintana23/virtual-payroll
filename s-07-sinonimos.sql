--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Creación de sinonimos

-- sinonimos publicos para de admin para invitado
CREATE OR REPLACE public synonym concepto FOR qu_proy_admin.concepto_pago;
CREATE OR REPLACE public synonym nivel FOR qu_proy_admin.nivel_empleado;
CREATE OR REPLACE public synonym proyecto FOR qu_proy_admin.proyecto;

grant SELECT ON puesto to qu_proy_invitado;
grant SELECT ON becario to qu_proy_invitado;
grant SELECT ON quincena to qu_proy_invitado;

prompt Ingresa la contraseña de qu_proy_invitado

CONNECT qu_proy_invitado

CREATE OR REPLACE synonym puesto FOR qu_proy_admin.puesto;
CREATE OR REPLACE synonym becario FOR qu_proy_admin.becario;
CREATE OR REPLACE synonym quincena FOR qu_proy_admin.quincena;

prompt Ingresa la contraseña de qu_proy_admin

CONNECT qu_proy_admin

set serveroutput ON

DECLARE
	-- obtener todos los nombre de las tablas
	CURSOR cur_tabla_nombre IS 
	SELECT table_name FROM all_tables
	WHERE OWNER='QU_PROY_ADMIN';

BEGIN
	FOR p IN cur_tabla_nombre LOOP        
		execute immediate 
          'CREATE OR REPLACE public synonym QM_'||p.table_name||' FOR QU_PROY_ADMIN.'||p.table_name;
    
		dbms_output.put_line('Sinonimo QM_' || p.table_name || ' creado');	
	END LOOP;
END;
/
show errors

