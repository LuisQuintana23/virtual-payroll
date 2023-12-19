--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 05/12/2023
--@Descripción: Procedimiento para simplificar la creación de un empleado


CREATE OR REPLACE PROCEDURE crearEmpleado(
  p_nombre in varchar2, p_apellido_paterno in varchar2, p_apellido_materno in varchar2 DEFAULT NULL,
  p_curp in varchar2, p_rfc in varchar2, p_tipo in char, p_foto in blob, p_puesto_id in NUMBER,
  p_correo IN varchar2, 
  p_empleado_id OUT NUMBER
) IS
  
  v_nombre varchar2(40);
  v_apellido_paterno varchar2(40);
  v_apellido_materno varchar2(40);
  v_curp varchar2(18);
  v_rfc varchar2(13);
  v_tipo char(1);
  v_foto blob;
  v_puesto_id NUMBER(10,0);
  v_empleado_id number(10,0);
  v_correo varchar2(100);

BEGIN
  -- convertir a mayusculas
  v_nombre := upper(p_nombre);
  v_apellido_paterno := upper(p_apellido_paterno);
  v_apellido_materno := upper(p_apellido_materno);
  v_curp := upper(p_curp);
  v_rfc := upper(p_rfc);
  v_tipo := upper(p_tipo);
 
  v_correo := lower(p_correo);
 
  SELECT empleado_seq.nextval INTO v_empleado_id
  FROM dual;
   
  -- insertar empleado
  INSERT INTO empleado(empleado_id, nombre, apellido_paterno, apellido_materno,
    curp, rfc, activo, tipo, foto, puesto_id
  )
  values(
    v_empleado_id, v_nombre, v_apellido_paterno, v_apellido_materno,
    p_curp, p_rfc, 1, v_tipo, p_foto, p_puesto_id 
  );
 
 
  -- insertar correo
 
  INSERT INTO empleado_correo(empleado_correo_id, correo, empleado_id)
  values(empleado_correo_seq.nextval, v_correo, v_empleado_id);
 
 
  -- insertar credencial
 
  INSERT INTO CREDENCIAL(credencial_id, numero_emision, fecha_emision, es_vigente,
    empleado_id, credencial_reemplazada_id
  )
  VALUES(
    credencial_seq.nextval, 1, sysdate, 1, v_empleado_id, null
  );
  
 
  p_empleado_id := v_empleado_id;
END;
/
show errors




