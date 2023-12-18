--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Creación de tablas, con sus respectivas restricciones para el sistema de Virtual Payroll 

drop table empleado_nomina_concepto_pago;
drop table empleado_nomina;
drop table nomina;
drop table contrato;
drop table empleado_honorarios;
drop table proyecto;
drop table empleado_beneficiario;
drop table beneficiario;
drop table concepto_pago;
drop table quincena;
drop table becario;
drop table empleado_base;
drop table nivel_empleado;
drop table incidencia;
drop table credencial;
drop table empleado_correo;
drop table historico_empleado_puesto;
drop table empleado_datos_biometricos;
drop table empleado;
drop table historico_puesto_sueldo;
drop table puesto;

--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 01/01/2023
--@Descripción: Creación de secuencias, todos incian con 10

drop sequence empleado_seq;
  
drop sequence historico_puesto_sueldo_seq;
  
drop sequence puesto_seq;

drop sequence historico_empleado_puesto_seq;
  
drop sequence historico_puesto_sueldo_seq;
  
drop sequence empleado_correo_seq;
  
drop sequence credencial_seq;
  
drop sequence empleado_nomina_seq;
  
drop sequence nomina_seq;
  
drop sequence quincena_seq;
  
drop sequence empleado_nomina_concepto_pago_seq;
  
drop sequence concepto_pago_seq;
  
drop sequence proyecto_seq;
  
drop sequence contrato_seq;
  
drop sequence nivel_empleado_seq;
  
 
drop sequence empleado_beneficiario_seq;
 
 
drop sequence beneficiario_seq;
