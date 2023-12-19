--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 01/01/2023
--@Descripción: Creación de secuencias, todos incian con 10

CREATE SEQUENCE empleado_seq
  START WITH 10
  INCREMENT BY 10
  nomaxvalue
  nominvalue 
  nocycle
  cache 10;
  
CREATE SEQUENCE puesto_seq
  START WITH 10
  INCREMENT BY 100
  nomaxvalue
  nominvalue
  nocycle
  cache 5;
  
 CREATE SEQUENCE historico_empleado_puesto_seq
  START WITH 10
  INCREMENT BY 1
  nomaxvalue
  nominvalue
  nocycle
  cache 50;
  
 CREATE SEQUENCE historico_puesto_sueldo_seq
  START WITH 10
  INCREMENT BY 1
  nomaxvalue
  nominvalue
  nocycle
  cache 50;
  
 CREATE SEQUENCE empleado_correo_seq
  START WITH 10
  INCREMENT BY 50
  nomaxvalue
  nominvalue
  nocycle
  cache 5;
  
 CREATE SEQUENCE credencial_seq
  START WITH 10
  INCREMENT BY 1
  nomaxvalue
  nominvalue
  nocycle
  cache 2;

  
CREATE SEQUENCE empleado_nomina_seq
  START WITH 10
  INCREMENT BY 1
  nomaxvalue
  nominvalue
  nocycle
  cache 20;
  
 CREATE SEQUENCE nomina_seq
  START WITH 10
  INCREMENT BY 1
  nomaxvalue
  nominvalue
  nocycle
  cache 20;
  
 CREATE SEQUENCE quincena_seq
  START WITH 10
  INCREMENT BY 10
  nomaxvalue
  nominvalue
  nocycle
  cache 2;
  
 CREATE SEQUENCE empleado_nomina_concepto_pago_seq
  START WITH 10
  INCREMENT BY 1
  nomaxvalue
  nominvalue
  nocycle
  cache 20;
  
 CREATE SEQUENCE concepto_pago_seq
  START WITH 10
  INCREMENT BY 2
  nomaxvalue
  nominvalue
  nocycle
  cache 2;
  
 CREATE SEQUENCE proyecto_seq
  START WITH 10
  INCREMENT BY 1
  nomaxvalue
  nominvalue
  nocycle
  cache 2;
  
 CREATE SEQUENCE contrato_seq
  START WITH 10
  INCREMENT BY 3
  nomaxvalue
  nominvalue
  nocycle
  cache 2;
  
CREATE SEQUENCE nivel_empleado_seq
  START WITH 10
  INCREMENT BY 1
  nomaxvalue
  nominvalue
  nocycle
  cache 2;
  
 
CREATE SEQUENCE empleado_beneficiario_seq
  START WITH 10
  INCREMENT BY 1
  nomaxvalue
  nominvalue
  nocycle
  cache 3;
 
 
CREATE SEQUENCE beneficiario_seq
  START WITH 10
  INCREMENT BY 5
  nomaxvalue
  nominvalue
  nocycle
  cache 3;
 

 
 