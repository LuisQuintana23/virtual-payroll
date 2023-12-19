--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Carga de datos

-- Quincena
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 1);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 2);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 3);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 4);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 5);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 6);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 7);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 8);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 9);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 10);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 11);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 12);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 13);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 14);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 15);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 16);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 17);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 18);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 19);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 20);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 21);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 22);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 23);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 24);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 25);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2023, 26);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2024, 1);
INSERT INTO quincena (quincena_id, anio, numero_quincena) VALUES (quincena_seq.nextval, 2024, 2);


-- Nivel de empleado

INSERT INTO NIVEL_EMPLEADO (nivel_empleado_id, clave, DESCRIPCION) 
  VALUES (NIVEL_EMPLEADO_SEQ.NEXTval, 'E123456789', 'Director');
INSERT INTO NIVEL_EMPLEADO (nivel_empleado_id, clave, DESCRIPCION) 
  VALUES (NIVEL_EMPLEADO_SEQ.NEXTval, 'E123456788', 'Sub-Director');
INSERT INTO NIVEL_EMPLEADO (nivel_empleado_id, clave, DESCRIPCION) 
  VALUES (NIVEL_EMPLEADO_SEQ.NEXTval, 'E123456787', 'Operativo');   
  
  
  
-- Puesto
 
INSERT INTO puesto (puesto_id, clave, nombre, descripcion, SUELDO_MENSUAL_BRUTO, VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN)
  VALUES(puesto_seq.nextval, 'P1', 'Líder de Proyecto', 'Organización de proyectos de software', 45000, 
   to_date('01-01-2019', 'dd-mm-yyyy'), to_date('31-12-2019', 'dd-mm-yyyy'));

INSERT INTO puesto (puesto_id, clave, nombre, descripcion, SUELDO_MENSUAL_BRUTO, VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN)
  VALUES(puesto_seq.nextval, 'D1', 'Desarrollador Senior', 'Desarrollo de backend', 28000, 
   to_date('01-01-2019', 'dd-mm-yyyy'), NULL);
  
INSERT INTO puesto (puesto_id, clave, nombre, descripcion, SUELDO_MENSUAL_BRUTO, VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN)
  VALUES(puesto_seq.nextval, 'D2', 'Desarrollador Semi-Senior', 'Desarrollo de backend', 20000, 
   to_date('01-02-2020', 'dd-mm-yyyy'), NULL);
  
INSERT INTO puesto (puesto_id, clave, nombre, descripcion, SUELDO_MENSUAL_BRUTO, VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN)
  VALUES(puesto_seq.nextval, 'D3', 'Desarrollador Junior', 'Desarrollo de frontend', 14000, 
   to_date('03-03-2020', 'dd-mm-yyyy'), to_date('03-06-2020', 'dd-mm-yyyy'));

  
-- Concepto de pago

INSERT INTO CONCEPTO_PAGO (concepto_pago_id, nombre, descripcion, tipo)
VALUES (CONCEPTO_PAGO_Seq.nextval, 'ISR', 'Impuesto Sobre la Renta', 'D');

INSERT INTO CONCEPTO_PAGO (concepto_pago_id, nombre, descripcion, tipo)
VALUES (CONCEPTO_PAGO_Seq.nextval, 'IMMS', 'Seguro Médico', 'D');

INSERT INTO CONCEPTO_PAGO (concepto_pago_id, nombre, descripcion, tipo)
VALUES (CONCEPTO_PAGO_Seq.nextval, 'Sueldo', 'Sueldo Bruto', 'P');

INSERT INTO CONCEPTO_PAGO (concepto_pago_id, nombre, descripcion, tipo)
VALUES (CONCEPTO_PAGO_Seq.nextval, 'Aguinaldo', 
'Ingreso adicional durante la temporada de las festividades de fin de año', 'P');

INSERT INTO CONCEPTO_PAGO (concepto_pago_id, nombre, descripcion, tipo)
VALUES (CONCEPTO_PAGO_Seq.nextval, 'Estimulo', 
'Ingreso adicional', 'P');

INSERT INTO CONCEPTO_PAGO (concepto_pago_id, nombre, descripcion, tipo)
VALUES (CONCEPTO_PAGO_Seq.nextval, 'Bono', 
'Ingreso adicional', 'P');

-- Proyectos
INSERT INTO PROYECTO(proyecto_id, clave, nombre, descripcion, numero_partida_presupuestal)
VALUES(proyecto_seq.nextval, 'P1024H0231', 'Sistema de Nomina', 'Proyecto Sistema de Nomina', '202cb962');

INSERT INTO PROYECTO(proyecto_id, clave, nombre, descripcion, numero_partida_presupuestal)
VALUES(proyecto_seq.nextval, 'P1024H0232', 'Sistema de Honorarios', 'Proyecto Sistema de Honorarios', 'ac59075b');

INSERT INTO PROYECTO(proyecto_id, clave, nombre, descripcion, numero_partida_presupuestal)
VALUES(proyecto_seq.nextval, 'P1024H0233', 'Sistema de Becas', 'Proyecto Sistema de Becas', '964b0715');


-- Beneficiario
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Sharon Martinez', 'Morgan', 'Gonzalez');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Andrew Douglas', 'Case', 'Patel');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Christopher Bauer', 'Sanchez', 'Valencia');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Monique Patton', 'Obrien', 'Hale');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Ryan Farley', 'Wilson', 'Carter');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Leah Smith', 'Hawkins', 'Hernandez');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Robert Galvan', 'Taylor', 'Terry');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Spencer Alvarez', 'Gonzalez', 'Lewis');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Christine Smith', 'Smith', 'Johnson');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Andrew Kennedy', 'Zuniga', 'Johnson');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Kevin Perry', 'Haney', 'Hughes');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Andrew Weber', 'Walsh', 'Sullivan');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Brandon Weber', 'Gutierrez', 'Thompson');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Kristy Johnson', 'Johnson', 'White');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Susan Murray', 'Jordan', 'Boone');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Derrick Vazquez', 'Davis', 'Smith');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Sharon Evans', 'Brown', 'Freeman');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Brandy Cooper', 'Stafford', 'Haney');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'William Sweeney', 'Morales', 'Garza');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Joshua Morales', 'Wood', 'Cox');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Marcus Rose', 'Farmer', 'Phillips');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Alan Ross', 'Thompson', 'Morris');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Erika Morris', 'Russell', 'Russell');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Ashley Knight', 'Nicholson', 'Chang');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Julia Chapman', 'Matthews', 'Jones');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Mrs. Amy Pineda', 'Stanton', 'Sanchez');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Elizabeth Rodriguez', 'Rodriguez', 'Smith');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Stacey Smith', 'Jacobs', 'Kennedy');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Susan Thornton', 'Bryan', 'Myers');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Natalie Douglas', 'Smith', 'Hall');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Dr. Michael Pope', 'Jackson', 'Pittman');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Austin Hanson', 'Swanson', 'Jackson');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Tracy Lowe', 'Smith', 'Tucker');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Samantha White', 'Cruz', 'Faulkner');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Hunter Robinson', 'Davis', 'Romero');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Leslie Smith', 'Robertson', 'Castro');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Terri Allen', 'Brennan', 'Morris');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Tyler Garrett MD', 'Mendoza', 'Willis');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Jessica Miller', 'Parker', 'Riley');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Troy Leach', 'Foster', 'Walker');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Elizabeth Vaughn', 'Schneider', 'Ford');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Christina Martinez', 'Parker', 'Johnston');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Sarah Krause', 'Sullivan', 'Nelson');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Juan Turner', 'Koch', 'Fields');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Paul Carter', 'Jones', 'Mcbride');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Mark Snyder', 'Nichols', 'Harris');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Joyce Carr', 'Anderson', 'Thompson');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Andres Palmer', 'Brown', 'Baldwin');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Charles Taylor', 'White', 'Woods');
INSERT INTO beneficiario (beneficiario_id, nombre, apellido_paterno, apellido_materno) VALUES (beneficiario_seq.nextval, 'Ashley Davis DDS', 'Conley', 'Melton');


-- Empleado

INSERT INTO empleado(empleado_id, nombre, APELLIDO_PATERNO, APELLIDO_MATERNO, curp, 
  rfc, activo, tipo, foto, puesto_id)
VALUES(empleado_seq.nextval, 'Luis', 'Quintana', 'Juarez', 'QUJU011206HMCNRSA0',
  'QUJU011206DM0', 1, 'B', empty_blob(), 10
);
INSERT INTO empleado(empleado_id, nombre, APELLIDO_PATERNO, APELLIDO_MATERNO, curp, 
  rfc, activo, tipo, foto, puesto_id)
VALUES(empleado_seq.nextval, 'Angel', 'López', 'Juarez', 'QUJU021206HMCNRSA0',
  'QUJU021206DM1', 1, 'H', empty_blob(), 110
);
INSERT INTO empleado(empleado_id, nombre, APELLIDO_PATERNO, APELLIDO_MATERNO, curp, 
  rfc, activo, tipo, foto, puesto_id)
VALUES(empleado_seq.nextval, 'Juan', 'Ramirez', 'Ramirez', 'QUJU031206HMCNRSA0',
  'QUJU031206DM0', 1, 'B', empty_blob(), 210
);
INSERT INTO empleado(empleado_id, nombre, APELLIDO_PATERNO, APELLIDO_MATERNO, curp, 
  rfc, activo, tipo, foto, puesto_id)
VALUES(empleado_seq.nextval, 'José', 'Mora', 'Martinez', 'QUJU041206HMCNRSA0',
  'QUJU041206DM0', 1, 'E', empty_blob(), 310
);

-- Correos

INSERT INTO empleado_correo(empleado_correo_id, correo, empleado_id)
VALUES(empleado_correo_seq.nextval, 'luis.quintana@gmail.com', 10);
INSERT INTO empleado_correo(empleado_correo_id, correo, empleado_id)
VALUES(empleado_correo_seq.nextval, 'angel.lopez@live.com', 20);
INSERT INTO empleado_correo(empleado_correo_id, correo, empleado_id)
VALUES(empleado_correo_seq.nextval, 'juan.ramirez@hotmail.com', 30);
INSERT INTO empleado_correo(empleado_correo_id, correo, empleado_id)
VALUES(empleado_correo_seq.nextval, 'jose.mora@outlook.com', 40);
INSERT INTO empleado_correo(empleado_correo_id, correo, empleado_id)
VALUES(empleado_correo_seq.nextval, 'luis.quintana@gmail.com.mx', 10);


-- Incidencias

INSERT INTO INCIDENCIA (num_incidencia, EMPLEADO_ID, folio, FECHA_REGISTRO, descripcion)
VALUES(1, 10, 'EI00000001', sysdate, 'Llego 10 min tarde');

INSERT INTO INCIDENCIA (num_incidencia, EMPLEADO_ID, folio, FECHA_REGISTRO, descripcion)
VALUES(1, 20, 'EI00000002', sysdate, 'Insulto al jefe');

INSERT INTO INCIDENCIA (num_incidencia, EMPLEADO_ID, folio, FECHA_REGISTRO, descripcion)
VALUES(1, 40, 'EI00000003', sysdate, 'No fue un dia');

INSERT INTO INCIDENCIA (num_incidencia, EMPLEADO_ID, folio, FECHA_REGISTRO, descripcion)
VALUES(2, 20, 'EI00000004', sysdate, 'No fue un dia');


-- Credenciales

INSERT INTO CREDENCIAL(credencial_id, numero_emision, FECHA_EMISION, es_vigente, empleado_id)
VALUES(credencial_seq.nextval, 1, sysdate, 0, 10);

INSERT INTO CREDENCIAL(credencial_id, numero_emision, FECHA_EMISION, es_vigente, empleado_id)
VALUES(credencial_seq.nextval, 1, sysdate, 1, 20);

INSERT INTO CREDENCIAL(credencial_id, numero_emision, FECHA_EMISION, es_vigente, empleado_id)
VALUES(credencial_seq.nextval, 1, sysdate, 1, 30);

INSERT INTO CREDENCIAL(credencial_id, numero_emision, FECHA_EMISION, es_vigente, empleado_id)
VALUES(credencial_seq.nextval, 1, sysdate, 1, 40);

INSERT INTO CREDENCIAL(credencial_id, numero_emision, FECHA_EMISION, es_vigente, empleado_id, CREDENCIAL_REEMPLAZADA_ID)
VALUES(credencial_seq.nextval, 2, sysdate, 1, 10, 10);

-- Empleado beneficiario

INSERT INTO EMPLEADO_BENEFICIARIO(empleado_beneficiario_id, PORCENTAJe, EMPLEADO_ID, BENEFICIARIO_ID)
VALUES (EMPLEADO_BENEFICIARIO_seq.nextval, 100, 10, 10);

INSERT INTO EMPLEADO_BENEFICIARIO(empleado_beneficiario_id, PORCENTAJe, EMPLEADO_ID, BENEFICIARIO_ID)
VALUES (EMPLEADO_BENEFICIARIO_seq.nextval, 50, 20, 15);
INSERT INTO EMPLEADO_BENEFICIARIO(empleado_beneficiario_id, PORCENTAJe, EMPLEADO_ID, BENEFICIARIO_ID)
VALUES (EMPLEADO_BENEFICIARIO_seq.nextval, 50, 20, 20);

INSERT INTO EMPLEADO_BENEFICIARIO(empleado_beneficiario_id, PORCENTAJe, EMPLEADO_ID, BENEFICIARIO_ID)
VALUES (EMPLEADO_BENEFICIARIO_seq.nextval, 100, 30, 25);

INSERT INTO EMPLEADO_BENEFICIARIO(empleado_beneficiario_id, PORCENTAJe, EMPLEADO_ID, BENEFICIARIO_ID)
VALUES (EMPLEADO_BENEFICIARIO_seq.nextval, 100, 40, 30);



-- NOMINA

INSERT INTO nomina(NOMINA_ID, FECHA_GENERACION, FECHA_PAGO, IMPORTE_TOTAL,
  TOTAL_PAGOS_GENERADOS, TOTAL_PAGOS_NO_COBRADOS, QUINCENA_ID
)
VALUES (nomina_seq.nextval, DEFAULT, sysdate, 1000000,
  6, 1, 10
);

-- EMPLEADO NOMINA

INSERT INTO empleado_nomina(empleado_nomina_id, importe_pago, empleado_id, nomina_id)
VALUES(empleado_nomina_seq.nextval, 30000, 10, 10);
INSERT INTO empleado_nomina(empleado_nomina_id, importe_pago, empleado_id, nomina_id)
VALUES(empleado_nomina_seq.nextval, 40000, 20, 10);
INSERT INTO empleado_nomina(empleado_nomina_id, importe_pago, empleado_id, nomina_id)
VALUES(empleado_nomina_seq.nextval, 20000, 30, 10);
INSERT INTO empleado_nomina(empleado_nomina_id, importe_pago, empleado_id, nomina_id)
VALUES(empleado_nomina_seq.nextval, 12000, 40, 10);

-- Empleado nomina concepto pago

INSERT INTO EMPLEADO_NOMINA_CONCEPTO_PAGO(empleado_nomina_concepto_pago_id, importe,
  empleado_nomina_id, concepto_pago_id
)
VALUES(EMPLEADO_NOMINA_CONCEPTO_PAGO_seq.nextval, -800,
  10, 14
);

INSERT INTO EMPLEADO_NOMINA_CONCEPTO_PAGO(empleado_nomina_concepto_pago_id, importe,
  empleado_nomina_id, concepto_pago_id
)
VALUES(EMPLEADO_NOMINA_CONCEPTO_PAGO_seq.nextval, 14000,
  10, 12
);


-- Empleado base

INSERT INTO empleado_base(empleado_id, NUMERO_EMPLEADO_BASE, FECHA_INICIO, PROTESTA_FIRMADA, NIVEL_EMPLEADO_ID)
VALUES(10, 1000000001, sysdate, empty_blob(), 10);

INSERT INTO empleado_base(empleado_id, NUMERO_EMPLEADO_BASE, FECHA_INICIO, PROTESTA_FIRMADA, NIVEL_EMPLEADO_ID)
VALUES(30, 1000000002, sysdate, empty_blob(), 11);


-- Empleado Honorarios

INSERT INTO EMPLEADO_HONORARIOS(empleado_id, EMPLEADO_BASE_AUTORIZADOR_ID, PROYECTO_ID)
VALUES(20, 10, 10);

-- Contrato

INSERT INTO contrato(contrato_id, NUMERO_CONTRATO, FECHA_INICIO, fecha_fin, 
CONTRATO_FIRMADO, EMPLEADO_ID) 
VALUES (CONTRATO_seq.nextval, 2000000001, sysdate, sysdate+2*30,
  empty_blob(), 20
);


INSERT INTO BECARIO(empleado_id, UNIVERSIDAD_NOMBRE, CARRERA_NOMBRE, FECHA_ESTIMADA_TITULACION, PROMEDIO)
VALUES(30, 'UNAM', 'Ingeniería en Computación', sysdate+30*12*2, 9.0);



-- Historico Puesto Sueldo


-- P1
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 40000, 
  to_date('2016-01-01', 'yyyy-mm-dd'), to_date('2016-12-31', 'yyyy-mm-dd'),
  10
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 42000, 
  to_date('2017-01-01', 'yyyy-mm-dd'), to_date('2017-12-31', 'yyyy-mm-dd'),
  10
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 43500, 
  to_date('2018-01-01', 'yyyy-mm-dd'), to_date('2018-12-31', 'yyyy-mm-dd'),
  10
);

-- D1
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 20000, 
  to_date('2016-01-01', 'yyyy-mm-dd'), to_date('2016-12-31', 'yyyy-mm-dd'),
  110
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 20000, 
  to_date('2017-01-01', 'yyyy-mm-dd'), to_date('2017-12-31', 'yyyy-mm-dd'),
  110
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 22500, 
  to_date('2018-01-01', 'yyyy-mm-dd'), to_date('2018-12-31', 'yyyy-mm-dd'),
  110
);

-- D2
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 20000, 
  to_date('2016-01-01', 'yyyy-mm-dd'), to_date('2016-12-31', 'yyyy-mm-dd'),
  110
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 20000, 
  to_date('2017-01-01', 'yyyy-mm-dd'), to_date('2017-12-31', 'yyyy-mm-dd'),
  110
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 22500, 
  to_date('2018-01-01', 'yyyy-mm-dd'), to_date('2018-12-31', 'yyyy-mm-dd'),
  110
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 20000, 
  to_date('2016-01-01', 'yyyy-mm-dd'), to_date('2016-12-31', 'yyyy-mm-dd'),
  110
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 20000, 
  to_date('2017-01-01', 'yyyy-mm-dd'), to_date('2017-12-31', 'yyyy-mm-dd'),
  110
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 22500, 
  to_date('2018-01-01', 'yyyy-mm-dd'), to_date('2018-12-31', 'yyyy-mm-dd'),
  110
);

-- D2
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 20000, 
  to_date('2017-01-01', 'yyyy-mm-dd'), to_date('2017-12-31', 'yyyy-mm-dd'),
  210
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 18000, 
  to_date('2018-01-01', 'yyyy-mm-dd'), to_date('2018-12-31', 'yyyy-mm-dd'),
  210
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 19000, 
  to_date('2019-01-01', 'yyyy-mm-dd'), to_date('2019-12-31', 'yyyy-mm-dd'),
  210
);

-- D3

INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 10000, 
  to_date('2018-01-01', 'yyyy-mm-dd'), to_date('2018-12-31', 'yyyy-mm-dd'),
  310
);
INSERT INTO HISTORICO_PUESTO_SUELDO hps(HISTORICO_PUESTO_SUELDO_ID, SUELDO_MENSUAL_BRUTO,
  VIGENCIA_FECHA_INICIO, VIGENCIA_FECHA_FIN, PUESTO_ID
)
VALUES(
  HISTORICO_PUESTO_SUELDO_SEQ.nextval, 12000, 
  to_date('2019-01-01', 'yyyy-mm-dd'), to_date('2019-12-31', 'yyyy-mm-dd'),
  310
);

-- Datos biometricos
INSERT INTO EMPLEADO_DATOS_BIOMETRICOS
VALUES(10, 
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob()
);

INSERT INTO EMPLEADO_DATOS_BIOMETRICOS
VALUES(20, 
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob()
);

INSERT INTO EMPLEADO_DATOS_BIOMETRICOS
VALUES(30, 
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob()
);

INSERT INTO EMPLEADO_DATOS_BIOMETRICOS
VALUES(40, 
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob(),
  empty_blob()
);


