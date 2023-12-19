--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 11/12/2023
--@Descripción: prueba para función de obtener importe total de un empleado

SET serveroutput on
DECLARE
  v_importe_esperado number;
  v_importe_obtenido number;
BEGIN
	v_importe_esperado := 13200;

    SELECT calcularImporteTotalEmpleado(10) INTO v_importe_obtenido
    FROM dual;
   
    IF v_importe_esperado != v_importe_obtenido THEN
      raise_application_error(-20001,'no se obtuvo el mismo importe');	
    END IF;
   
    dbms_output.put_line('[✓] importes coinciden');

    dbms_output.put_line('[✓] Todo bien');
   
   EXCEPTION
   WHEN OTHERS THEN
     IF sqlcode = -20001 THEN
       dbms_output.put_line('[✗] no se obtuvo un importe correcto en la función');
     ELSE 
       dbms_output.put_line('[✗] código no esperado: '  || sqlcode);
     END IF;
end;
/
show errors

prompt realizando ROLLBACK a cambios

ROLLBACK;


