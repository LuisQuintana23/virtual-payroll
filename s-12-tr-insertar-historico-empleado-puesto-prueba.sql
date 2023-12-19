--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Prueba para trigger de insertar a historico empleado puesto

set serveroutput on

prompt  ejecutando pruebas automáticas

declare
  v_puesto_id number(10,0);
BEGIN
	
  update empleado set puesto_id=10 where empleado_id=10;
  dbms_output.put_line('[✓] puesto - puesto actualizado');

  SELECT puesto_seq.nextval INTO v_puesto_id
  FROM dual;
 
  insert into puesto
  values(v_puesto_id, 'z0', 'prueba', 'prueba', 1, sysdate, sysdate);
  dbms_output.put_line('[✓] puesto - puesto prueba creado');

 
  insert into empleado(empleado_id, nombre, apellido_paterno, apellido_materno, curp, 
  rfc, activo, tipo, foto, puesto_id)
  values(empleado_seq.nextval, 'prueba', 'prueba', 'prueba', 'prpp021206hmcnrsa0',
  'prpp021206ddd', 1, 'B', empty_blob(), v_puesto_id
  );
  
  dbms_output.put_line('[✓] empleado - empleado prueba creado');
  dbms_output.put_line('[✓] todo bien');
 

 exception
  when others then 
      dbms_output.put_line('[✗] - error fuera de lo previsto: '|| sqlcode);
      raise;
end;
/ 
show errors

prompt haciendo rollback para limpiar los datos de prueba

rollback;

