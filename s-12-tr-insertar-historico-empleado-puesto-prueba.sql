--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Prueba para trigger de insertar a historico empleado puesto

set serveroutput on

prompt  Ejecutando pruebas automáticas

DECLARE
  v_puesto_id number(10,0);
BEGIN
  UPDATE empleado SET puesto_id=510 WHERE EMPLEADO_ID=10;
 
  INSERT INTO puesto
  VALUES(puesto_seq.nextval, 'Z0', 'Prueba', 'Prueba', 1, sysdate, sysdate);
 
  SELECT puesto_id INTO v_puesto_id
  FROM puesto WHERE clave='Z0'
  OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;
 
  INSERT INTO empleado(empleado_id, nombre, APELLIDO_PATERNO, APELLIDO_MATERNO, curp, 
  rfc, activo, tipo, foto, puesto_id)
  VALUES(empleado_seq.nextval, 'prueba', 'prueba', 'prueba', 'PRPP021206HMCNRSA0',
  'PRPP021206', 1, 'B', empty_blob(), v_puesto_id
  );

  dbms_output.put_line('[CHECK] Se concreto la prueba, se inserto en el' ||
  ' historico cuando se actualiza o inserta un empleado'
  );

 exception
  when others then 
      dbms_output.put_line('[ERROR] - error fuera de lo previsto: '|| sqlcode);
      raise;
end;

/ 



prompt Haciendo rollback para limpiar los datos de Prueba

rollback;

SELECT * FROM empleado;