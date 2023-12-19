--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 13/12/2023
--@Descripción: prueba para función de leer fotos

SET serveroutput on

DECLARE
  v_longitud_esperada integer;
  v_longitud_obtenida integer;
BEGIN
	v_longitud_esperada := 18213;
	  
    SELECT dbms_lob.getlength(leer_foto('10.jpg')) INTO v_longitud_obtenida
    FROM dual;
   
    IF v_longitud_esperada != v_longitud_obtenida THEN
      raise_application_error(-20001,'no se obtuvo la misma longitud');	
    END IF;
   
    dbms_output.put_line('[✓] longitudes coinciden');

    dbms_output.put_line('[✓] Todo bien');
   
   EXCEPTION
   WHEN OTHERS THEN
     IF sqlcode = -20001 THEN
       dbms_output.put_line('[✗] no se obtuvo las longitudes correctas en la función');
     ELSE 
       dbms_output.put_line('[✗] código no esperado: '  || sqlcode);
     END IF;
end;
/
show errors

prompt realizando ROLLBACK a cambios

ROLLBACK;


