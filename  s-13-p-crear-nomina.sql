--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 05/12/2023
--@Descripción: Creación de procedimiento para crear nomina

set serveroutput on
 
CREATE OR REPLACE PROCEDURE crearNomina(
  p_fecha_pago IN DATE, p_anio IN NUMBER, p_numero_quincena NUMBER,
  p_nomina_id OUT number
) IS
  v_fecha_generacion nomina.fecha_generacion%TYPE;
  v_nomina_id nomina.nomina_id%TYPE;
  v_anio quincena.anio%TYPE;
  v_numero_quincena quincena.numero_quincena%TYPE;
  v_importe_total nomina.importe_total%type;
  v_total_pagos_generados nomina.total_pagos_generados%type;
  v_total_pagos_no_cobrados nomina.total_pagos_no_cobrados%type;

  v_quincena_id number(10,0);
  v_quincena_exists number(1,0);
  v_nomina_exists number(1,0);

BEGIN
  v_fecha_generacion := sysdate;

  -- verificar si existe quincena, si no crearla
  
  SELECT count(*) INTO v_quincena_exists 
  FROM quincena WHERE anio=p_anio 
    AND numero_quincena=p_numero_quincena;
 
  IF v_quincena_exists = 0 THEN
    -- crear nueva quincena
    dbms_output.put_line('Creando nueva quincena: ' || p_anio || '-' || p_numero_quincena);
    
    SELECT quincena_seq.nextval INTO v_quincena_id FROM dual;
   
    INSERT INTO quincena(quincena_id, anio, numero_quincena)
    VALUES(v_quincena_id, p_anio, p_numero_quincena)
    ;
    dbms_output.put_line('Quincena Creada');
  else 
    -- si ya existe obtenemos el id de la quincena
    SELECT quincena_id INTO v_quincena_id 
    FROM quincena WHERE anio=p_anio 
    AND numero_quincena=p_numero_quincena;
  END IF;
  
  -- verificar si existe nomina con esa quincena
  select count(*) into v_nomina_exists
  from nomina where quincena_id=v_quincena_id;
  
  if v_nomina_exists >= 1 then
    raise_application_error(-20002,'La nomina con la quincena dada ya existe');	
  end if;
  
  -- si no existe aun nomina con la quincena dada se continua
  v_nomina_id := nomina_seq.nextval;
  
  -- calcula importe total a partir de todos los sueldos
  select sum(sueldo_mensual_bruto) into v_importe_total
  from puesto p
  JOIN empleado e ON p.PUESTO_ID=e.EMPLEADO_ID 
  where e.activo=1
  ;
  
  -- contar el numero de sueldos a pagar
  select count(*) into v_total_pagos_generados
  from empleado e
  where e.activo=1
  ;
  
  v_total_pagos_no_cobrados := v_total_pagos_generados;
    
  INSERT INTO nomina(nomina_id, fecha_generacion, fecha_pago,
    importe_total, total_pagos_generados, total_pagos_no_cobrados,
    quincena_id
  )
  VALUES (v_nomina_id, v_fecha_generacion, p_fecha_pago,
    v_importe_total, 6, 6, v_quincena_id
  )
  ;
  dbms_output.put_line('Nomina Creada');
  p_nomina_id := v_nomina_id;
 
END;

/  
show erros;
