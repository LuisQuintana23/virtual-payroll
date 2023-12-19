--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Prueba para trigger de insertar a historico puesto sueldo

set serveroutput on

prompt  Ejecutando pruebas automáticas

DECLARE
  v_historico_id number(10,0);
  v_update_count number(1,0);
  v_insert_count number(1,0);
  v_puesto_id number(10,0);
BEGIN	
 
  UPDATE puesto SET SUELDO_MENSUAL_BRUTO=58000, VIGENCIA_FECHA_INICIO=sysdate, VIGENCIA_FECHA_FIN=null
  WHERE clave='P1';
  dbms_output.put_line('[✓] puesto - sueldo actualizado');
  
  SELECT historico_puesto_sueldo_seq.currval INTO v_historico_id
  FROM dual;
 
  SELECT count(*) INTO v_update_count
  FROM historico_puesto_sueldo
  WHERE SUELDO_MENSUAL_BRUTO=58000 
    AND historico_puesto_sueldo_id=v_historico_id;
 
  IF v_update_count != 1 THEN
    raise_application_error(-20001,'[✗] historico - no se inserto el historico correctamente al actualizar');	
  END IF;
 
 
  -- Prueba insert
 
  SELECT puesto_seq.nextval INTO v_puesto_id
  FROM dual;
 
  SELECT historico_puesto_sueldo_seq.currval INTO v_historico_id
  FROM dual;
 
  INSERT INTO puesto
  VALUES(v_puesto_id, 'Z0', 'Prueba', 'Prueba', 1, sysdate, sysdate);
  dbms_output.put_line('[✓] puesto - puesto creado');

  SELECT count(*) INTO v_insert_count
  FROM historico_puesto_sueldo
  WHERE puesto_id=v_puesto_id
    AND historico_puesto_sueldo_id=v_historico_id;
   
  IF v_update_count != 1 THEN
    raise_application_error(-20002,'[✗] historico - no se inserto el historico correctamente al crear registro');	
  END IF;
 
  dbms_output.put_line('[✓] Todo bien');

 exception
  when others then 
      dbms_output.put_line('[✗] - error fuera de lo previsto: '|| sqlcode);
      raise;
end;
/
show errors

prompt Haciendo rollback para limpiar los datos de prueba

rollback;

