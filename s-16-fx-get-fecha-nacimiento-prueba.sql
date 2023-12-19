--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 11/12/2023
--@Descripción: prueba para función de obtener fecha de nacimiento

SET serveroutput on
DECLARE
  v_fecha_esperada date;
  v_fecha_obtenida date;
BEGIN
	v_fecha_esperada := to_date('04-03-1970', 'dd-mm-yyyy');

    SELECT getFechaNacimiento('QUML700304DDD') INTO v_fecha_obtenida
    FROM dual;
   
    IF v_fecha_esperada != v_fecha_obtenida THEN
      raise_application_error(-20001,'no se obtuvo la misma fecha');	
    END IF;
   
    dbms_output.put_line('[✓] fechas coinciden');

    dbms_output.put_line('[✓] Todo bien');
   
   EXCEPTION
   WHEN OTHERS THEN
     IF sqlcode = -20001 THEN
       dbms_output.put_line('[✗] no se obtuvo una fecha correcta con la función');
     ELSE 
       dbms_output.put_line('[✗] código no esperado: '  || sqlcode);
     END IF;
end;
/
show errors

prompt realizando ROLLBACK a cambios

ROLLBACK;
