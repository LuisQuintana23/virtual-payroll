--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 01/01/2023
--@Descripción: Creación de tablas temporales

-- muestra datos estadisticos de cierto puesto a lo largo del tiempo
-- pudiendose insertar los datos desde historico_puesto_sueldo
-- estos datos cambiaran por lo que nos interesa analizarlos al momento
-- y ver que acciones tomará la compañia con respecto al presupuesto
CREATE GLOBAL TEMPORARY TABLE puesto_temp_estadisticas(
  clave_puesto varchar2(40),
  fecha_inicio DATE,
  fecha_fin DATE,
  sueldo_mensual_promedio number(10,2),
  sueldo_mensual_maximo number(10,2),
  sueldo_mensual_minimo number(10,2)
) ON COMMIT PRESERVE ROWS;

-- se busca obtener el presupuesto de un proyecto
-- destinado a los empleados por honorarios que trabajan 
-- en el en un cierto periodo de tiempo, ya sea que el proyecto
-- este finalizado o en alguna otra fase, esto con el objetivo
-- de saber que parte del presupuesto se destina a ciertos proyectos
CREATE GLOBAL TEMPORARY TABLE proyecto_temp_estadisticas(
  clave_proyecto varchar2(40),
  nombre_proyecto varchar2(40),
  descripcion_proyecto varchar2(40),
  fecha_inicio DATE,
  fecha_fin DATE,
  sueldo_mensual_bruto_maximo number(10,2),
  sueldo_mensual_bruto_minimo number(10,2),
  total_gastado number(10,2)
) ON COMMIT PRESERVE ROWS;