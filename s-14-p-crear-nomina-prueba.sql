--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 06/12/2023
--@Descripción: prueba para procedimiento para crear nomina


set serveroutput on

prompt  Ejecutando pruebas automáticas

declare
  v_nomina_id NUMBER; 
begin
  -- nomina con quincena nueva
  crearNomina(to_date('01-01-2024', 'dd-mm-yyyy'), 2025, 24, v_nomina_id);
  dbms_output.put_line('[✓] nomina - quincena creada'|| v_nomina_id); 
 
  -- nomina con quincena ya existente
  crearNomina(to_date('01-01-2024', 'dd-mm-yyyy'), 2023, 1, v_nomina_id);
  dbms_output.put_line('[✓] nomina - quincena ya existe'|| v_nomina_id);
 
  -- nomina ya creada con quincena ya creada (excepcion -20002)
  crearNomina(to_date('01-01-2024', 'dd-mm-yyyy'), 2023, 1, v_nomina_id);
 
 exception
  when others THEN
  IF sqlcode = -20002 THEN 
    dbms_output.put_line('[✓] nomina - nomina y quincena ya existen'|| v_nomina_id);
    dbms_output.put_line('[FINALIZADO] - Todo Bien');
  ELSE 
    dbms_output.put_line(' ERROR - código no esperado: '|| sqlcode);
    raise;
  END IF;
end;
/