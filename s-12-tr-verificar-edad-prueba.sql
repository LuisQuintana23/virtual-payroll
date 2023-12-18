--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Prueba para trigger de validación de edad

set serveroutput on

prompt  Ejecutando pruebas automáticas
 
BEGIN
  INSERT INTO empleado(empleado_id, nombre, APELLIDO_PATERNO, APELLIDO_MATERNO, curp, 
	 rfc, activo, tipo, foto, puesto_id)
  VALUES(9999999, 'Raul', 'López', 'López', 'QUJU210906HMCNRSA0',
	  'QUJU210906DM0', 1, 'B', empty_blob(), 10
  );
 
  INSERT INTO empleado(empleado_id, nombre, APELLIDO_PATERNO, APELLIDO_MATERNO, curp, 
	 rfc, activo, tipo, foto, puesto_id)
  VALUES(99999999, 'Raul', 'López', 'López', 'QUJU240906HMCNRSA0',
	  'QUJU240906DM0', 1, 'B', empty_blob(), 10
  );


  dbms_output.put_line('[ERROR] Ocurrio un error: ');
  dbms_output.put_line('[ERROR] no se tuvo que insertar a una persona con edad menor a 15 años');
 exception
  when others then 
    if sqlcode = -20001 then
      dbms_output.put_line('[CHECK] Se concreto la prueba, no se ingreso a menor de 15 años');
    else
      dbms_output.put_line('[ERROR] - error fuera de lo previsto: '|| sqlcode);
      raise;
    end if;
end;

/ 

prompt Haciendo rollback para limpiar los datos de Prueba

rollback;
