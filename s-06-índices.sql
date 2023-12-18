--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 01/01/2023
--@Descripción: Creación de indices

-- evitar quincenas duplicadas
create unique index quincena_anio_numero_quincena_iuk 
  on quincena(anio,numero_quincena);
  

-- indice unique para rfc
CREATE UNIQUE INDEX empleado_rfc_iuk
  ON empleado(rfc)  
;

-- indice non unique para folio incidencia
CREATE INDEX nivel_empleado_clave_ix
  ON nivel_empleado(clave);

 
-- consultar a un empleado por honorarios que este
-- apunto de vencer su contrato para ver si se renueva

CREATE INDEX contrato_fecha_fin_ifx
  ON contrato(trunc(to_date(fecha_fin, 'dd-mm-yyyy') - sysdate));
 

 
 
 
 
 