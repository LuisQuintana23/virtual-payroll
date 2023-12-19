--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Prueba para trigger de validación de edad

set serveroutput on

prompt  Ejecutando pruebas automáticas
 
BEGIN
  INSERT INTO empleado(empleado_id, nombre, APELLIDO_PATERNO, APELLIDO_MATERNO, curp, 
	 rfc, activo, tipo, foto, puesto_id)
  VALUES(7777777, 'Raul', 'López', 'López', 'RUJU030906HMCNRSA0',
	  'RUJU030906DM0', 1, 'B', empty_blob(), 10
  );
  dbms_output.put_line('[✓] empleado - se inserto a un mayor de 15 años');

 
  INSERT INTO empleado(empleado_id, nombre, APELLIDO_PATERNO, APELLIDO_MATERNO, curp, 
	 rfc, activo, tipo, foto, puesto_id)
  VALUES(88888888, 'Raul', 'López', 'López', 'TUJU230906HMCNRSA0',
	  'TUJU230906DM0', 1, 'B', empty_blob(), 10
  );


  dbms_output.put_line('[✗] Ocurrio un error: ');
  dbms_output.put_line('[✗] no se tuvo que insertar a una persona con edad menor a 15 años');
 exception
  when others then 
    if sqlcode = -20001 THEN
      dbms_output.put_line('[✓] empleado - no deja insertar a persona menor de 15 años');
      dbms_output.put_line('[✓] Todo bien');
    else
      dbms_output.put_line('[✗] - error fuera de lo previsto: '|| sqlcode);
      raise;
    end if;
end;
/ 
show errors

prompt Haciendo rollback para limpiar los datos de prueba

rollback;
