--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Prueba para trigger de insertar a historico puesto sueldo

set serveroutput on

prompt  Ejecutando pruebas automáticas
 
BEGIN
 
  UPDATE puesto SET SUELDO_MENSUAL_BRUTO=58000, VIGENCIA_FECHA_INICIO=sysdate, VIGENCIA_FECHA_FIN=null
  WHERE clave='P1';
 
  INSERT INTO puesto
  VALUES(puesto_seq.nextval, 'Z0', 'Prueba', 'Prueba', 1, sysdate, sysdate);

  dbms_output.put_line('[CHECK] Se concreto la prueba, se inserto en el' ||
  ' historico cuando se actualiza o inserta un puesto'
  );

 exception
  when others then 
      dbms_output.put_line('[ERROR] - error fuera de lo previsto: '|| sqlcode);
      raise;
end;

/ 

prompt Haciendo rollback para limpiar los datos de Prueba

rollback;