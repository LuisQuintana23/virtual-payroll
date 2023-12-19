--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Creación de vistas

CREATE OR REPLACE VIEW v_empleado_honorarios (
  nombre, apellido_paterno, apellido_materno,
  rfc, activo,
  empleado_autorizador_id,
  proyecto_clave, proyecto_nombre,
  numero_contrato, fecha_inicio, fecha_fin
) AS SELECT e.nombre, e.apellido_paterno, e.apellido_materno,
  e.rfc, e.activo, 
  eh.empleado_base_autorizador_id,
  p.clave, p.nombre,
  c.numero_contrato, c.fecha_inicio, c.fecha_fin
  FROM empleado e
  JOIN EMPLEADO_HONORARIOS eh ON e.EMPLEADO_ID=eh.EMPLEADO_ID
  JOIN PROYECTO p ON eh.PROYECTO_ID=p.PROYECTO_ID
  JOIN CONTRATO c ON c.EMPLEADO_ID=eh.EMPLEADO_ID
;


CREATE OR REPLACE VIEW v_empleado_puesto(
  nombre, apellido_paterno, apellido_materno,
  rfc, activo, tipo, foto,
  puesto_id, nombre_puesto, clave, sueldo_mensual_bruto
) AS SELECT e.nombre, e.apellido_paterno, e.apellido_materno,
  e.rfc, e.activo, e.tipo, e.foto,
  p.puesto_id, p.nombre, p.clave, p.sueldo_mensual_bruto
  FROM empleado e
  JOIN puesto p ON e.puesto_id=p.puesto_id
;



CREATE OR REPLACE VIEW v_empleado_base(
  numero_empleado_base, nombre, apellido_paterno, apellido_materno,
  rfc, activo, foto, fecha_inicio, protesta_firmada,
  clave_nivel, descripcion_nivel
) AS SELECT eb.numero_empleado_base, 
  e.nombre, e.apellido_paterno, e.apellido_materno,
  e.rfc, e.activo, e.foto, eb.fecha_inicio, eb.protesta_firmada,
  ne.clave, ne.descripcion
  FROM EMPLEADO e
  JOIN EMPLEADO_BASE eb ON eb.EMPLEADO_ID=e.EMPLEADO_ID
  JOIN NIVEL_EMPLEADO ne ON eb.NIVEL_EMPLEADO_ID=ne.NIVEL_EMPLEADO_ID
;



CREATE OR REPLACE VIEW v_empleado_tipo(
  nombre, apellido_paterno, apellido_materno,
  tipo
) AS SELECT e.nombre, e.apellido_paterno, e.apellido_materno,
  e.tipo FROM empleado e;

grant SELECT ON v_empleado_tipo to qu_proy_invitado;

COMMIT;

