--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 02/01/2023
--@Descripción: Creación de consultas

-- Obtener todos los empleados con sus respectivos puesto y roles

-- Obtener el promedio por tipo de empleado al igual el numero total por cada tipo
-- solo mostrar aquellos con sueldo promedio mayor a 12,000
SELECT e.tipo, count(*) total, avg(p.SUELDO_MENSUAL_BRUTO) sueldo_promedio
FROM empleado e
  JOIN puesto p ON e.PUESTO_ID=p.PUESTO_ID 
  GROUP BY e.tipo
  HAVING avg(p.SUELDO_MENSUAL_BRUTO) > 12000
  ORDER BY sueldo_promedio
;

-- mostra el rfc y tipo de los empleados de base y honorarios al igual que
-- la clave del nivel del empleado y numero de contrato segun sea el caso
SELECT e.rfc, e.tipo, ne.CLAVE nivel, c.NUMERO_CONTRATO
FROM EMPLEADO e
LEFT JOIN EMPLEADO_BASE eb ON e.EMPLEADO_ID=eb.EMPLEADO_ID
LEFT JOIN EMPLEADO_HONORARIOS eh ON e.EMPLEADO_ID=eh.EMPLEADO_ID
LEFT JOIN NIVEL_EMPLEADO ne ON eb.NIVEL_EMPLEADO_ID=ne.NIVEL_EMPLEADO_ID
LEFT JOIN CONTRATO c ON c.EMPLEADO_ID=eh.EMPLEADO_ID
WHERE e.TIPO IN ('H', 'B')
;

-- Mostrar el identificador del empleado y la descripcion de sus incidencias 
-- (si es que tiene)
SELECT empleado_id, i.DESCRIPCION
FROM EMPLEADO e
NATURAL JOIN INCIDENCIA I;


-- mostrar los datos de los empleados excepto los que cuenten con 
-- correo con dominio *@gmail.com*
-- y tengan un dominio de correo invalido; tambien mostrar correo

SELECT e.*, q1.correo FROM EMPLEADO e, 
(
	(SELECT empleado_id, correo FROM CORREO ec
	MINUS
	SELECT empleado_id, correo FROM CORREO ec2
	WHERE ec2.CORREO LIKE '%@gmail.com%')
	INTERSECT
	(
	SELECT ec.EMPLEADO_ID, correo 
	FROM dominio_invalido_ext di
	JOIN CORREO ec ON (ec.CORREO LIKE '%@'||di.DOMINIO||'%')
	)
) q1
WHERE e.EMPLEADO_ID=q1.empleado_id
;


INSERT INTO puesto_temp_estadisticas(
  clave_puesto,
  fecha_inicio,
  fecha_fin,
  sueldo_mensual_promedio,
  sueldo_mensual_maximo,
  sueldo_mensual_minimo
)
SELECT clave clave_puesto, 
  min(hps.VIGENCIA_FECHA_INICIO) fecha_inicio, 
  max(hps.VIGENCIA_FECHA_FIN) fecha_fin,
  trunc(avg(hps.SUELDO_MENSUAL_BRUTO), 3) sueldo_mensual_promedio,
  trunc(max(hps.SUELDO_MENSUAL_BRUTO), 3) sueldo_mensual_maximo,
  trunc(min(hps.SUELDO_MENSUAL_BRUTO), 3) sueldo_mensual_minimo
FROM v_empleado_puesto ve
JOIN HISTORICO_PUESTO_SUELDO hps ON ve.puesto_id=hps.puesto_id
GROUP BY clave
ORDER BY clave DESC
;

SELECT * FROM puesto_temp_estadisticas;

