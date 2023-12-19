--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 05/12/2023
--@Descripción: prueba para procedimiento para simplificar la creación de un empleado

SET serveroutput ON
declare
v_empleado_id number;
v_count_credencial NUMBER(1,0);
v_count_correo number(1,0);
BEGIN
	v_empleado_id := NULL;
	
    crearEmpleado('Luis', 'Quintana', 'Mora', 'QUML030126HMCNRSA0', 'QUML030126DDD', 'B',
      leer_foto('10.jpg'), 10, 'luis@gmail.com',
      v_empleado_id
     );
    
    IF v_empleado_id IS NULL THEN
      raise_application_error(-20001,'no se genero empleado');	
    END IF;
   
    dbms_output.put_line('[✓] empleado - creado');

   
    SELECT count(*) INTO v_count_credencial
    FROM credencial
    WHERE empleado_id=EMPLEADO_ID;
   
    IF v_count_credencial = 0 THEN 
      raise_application_error(-20002,'no se genero credencial');	
    END IF;
   
    dbms_output.put_line('[✓] credencial - credencial generada' );

    SELECT count(*) INTO v_count_correo
    FROM empleado_correo
    WHERE empleado_id=EMPLEADO_ID;
   
     
    IF v_count_correo = 0 THEN 
      raise_application_error(-20003,'no se genero correo');	
    END IF;
    
    dbms_output.put_line('[✓] empleado correo - correo registrado');
    dbms_output.put_line('[✓] Todo bien');
   
   EXCEPTION
   WHEN OTHERS THEN
     IF sqlcode = -20001 THEN
       dbms_output.put_line('[✗] empelado - no se creo al empleado');
     ELSIF sqlcode = -20002 THEN
       dbms_output.put_line('[✗] credencial - no se creo la credencial para el empleado');
     ELSIF sqlcode = -20003 THEN 
       dbms_output.put_line('[✗] empleado correo - no se registro algun correo para el empleado');
     ELSE 
       dbms_output.put_line('[✗] código no esperado: ' || sqlcode);
     END IF;

end;
/
show errors

prompt realizando ROLLBACK a cambios

ROLLBACK;
