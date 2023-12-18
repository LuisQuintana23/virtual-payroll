--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Creación de tablas, con sus respectivas restricciones para el sistema de Virtual Payroll 


CREATE TABLE puesto(
  puesto_id number(10,0) CONSTRAINT puesto_pk PRIMARY KEY,
  clave varchar2(2) NOT NULL,
  nombre varchar2(40) NOT NULL,
  descripcion varchar2(400) NOT NULL,
  sueldo_mensual_bruto number(10,2) NOT NULL,
  vigencia_fecha_inicio DATE DEFAULT sysdate NOT NULL,
  vigencia_fecha_fin DATE NULL,
  CONSTRAINT puesto_sueldo_mensual_bruto_chk
    CHECK ( sueldo_mensual_bruto >= 0 )
);

CREATE TABLE historico_puesto_sueldo(
  historico_puesto_sueldo_id number(10,0) CONSTRAINT historico_puesto_sueldo_pk PRIMARY KEY,
  sueldo_mensual_bruto number(10,2) NOT NULL,
  vigencia_fecha_inicio DATE NOT NULL,
  vigencia_fecha_fin DATE NULL,
  puesto_id number(10,0) NOT NULL,
  CONSTRAINT historico_puesto_sueldo_puesto_id_fk FOREIGN KEY(puesto_id)
    REFERENCES puesto(puesto_id),
  CONSTRAINT historico_puesto_sueldo_sueldo_mensual_bruto_chk
    CHECK ( sueldo_mensual_bruto >= 0 )
);


CREATE TABLE empleado(
  empleado_id number(10,0) CONSTRAINT empleado_pk PRIMARY KEY,
  nombre varchar2(40) NOT NULL,
  apellido_paterno varchar2(40) NOT NULL,
  apellido_materno varchar2(40) NOT NULL,
  curp varchar2(18) NOT NULL CONSTRAINT empleado_curp_uk UNIQUE,
  rfc varchar2(13) NOT NULL,
  fecha_nacimiento AS (
    to_date(
      substr(curp, 5, 2) || '-' ||
      substr(curp, 7, 2) || '-' ||
      substr(curp, 9, 2),
      'rr-mm-dd'
    )
  ),
  activo number(1,0) NOT NULL,
  tipo char(1) NOT NULL,
  foto blob,
  puesto_id number(10,0) NOT NULL,
  CONSTRAINT empleado_puesto_id_fk FOREIGN KEY(puesto_id)
    REFERENCES puesto(puesto_id),
  CONSTRAINT empleado_activo_chk CHECK( activo IN (0, 1) ),
  CONSTRAINT empleado_tipo_chk CHECK( tipo IN ('B', 'H', 'E') ),
  CONSTRAINT empleado_curp_chk CHECK(substr(curp, 1, 10) = substr(rfc, 1,10))
);

CREATE TABLE empleado_datos_biometricos(
  empleado_id number(10,0) CONSTRAINT empleado_datos_biometricos_pk PRIMARY KEY,
  huella_izquierda_menique blob NULL,
  huella_izquierda_anular blob NULL,
  huella_izquierda_medio blob NULL,
  huella_izquierda_indice blob NULL,
  huella_izquierda_pulgar blob NULL,
  huella_derecha_pulgar blob NULL,
  huella_derecha_indice blob NULL,
  huella_derecha_medio blob NULL,
  huella_derecha_anular blob NULL,
  huella_derecha_menique blob NULL,
  CONSTRAINT empleado_datos_biometricos_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado(empleado_id)
);

CREATE TABLE historico_empleado_puesto(
  historico_empleado_puesto_id number(10,0) CONSTRAINT historico_empleado_puesto_pk PRIMARY KEY,
  puesto_id number(10,0) NOT NULL,
  empleado_id number(10,0) NOT NULL,
  CONSTRAINT historico_empleado_puesto_puesto_id_fk FOREIGN KEY(puesto_id)
    REFERENCES puesto(puesto_id),
  CONSTRAINT historico_empleado_puesto_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado(empleado_id)
);


CREATE TABLE empleado_correo(
  empleado_correo_id number(10,0) CONSTRAINT empleado_correo_pk PRIMARY KEY,
  correo varchar2(100) NOT NULL CONSTRAINT empleado_correo_uk UNIQUE,
  empleado_id number(10,0) NOT NULL,
  CONSTRAINT empleado_correo_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado(empleado_id)
);


CREATE TABLE credencial(
  credencial_id number(10,0) CONSTRAINT credencial_pk PRIMARY KEY,
  folio AS (
    'E' ||
    to_char(fecha_emision, 'dd') ||
    substr(empleado_id, 1, 1) ||
    numero_emision
  ),
  numero_emision number(10,0) NOT NULL,
  fecha_emision DATE NOT NULL,
  es_vigente number(1,0) NOT NULL,
  empleado_id number(10,0) NOT NULL,
  credencial_reemplazada_id number(10,0) NULL,
  CONSTRAINT credencial_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado(empleado_id),
  CONSTRAINT credencial_credencial_reemplazada_id_fk FOREIGN KEY(credencial_reemplazada_id)
    REFERENCES credencial(credencial_id),
  CONSTRAINT credencial_es_vigente_chk CHECK( es_vigente IN (0,1) )
);


CREATE TABLE incidencia(
  num_incidencia number(10,0),
  empleado_id number(10,0), 
  folio varchar2(10) NOT NULL CONSTRAINT incidencia_folio_uk UNIQUE,
  fecha_registro DATE NOT NULL,
  descripcion varchar2(400) NOT NULL,
  CONSTRAINT incidencia_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado(empleado_id),
  CONSTRAINT incidencia_pk PRIMARY KEY(num_incidencia, empleado_id)
);


CREATE TABLE nivel_empleado(
  nivel_empleado_id number(10,0) CONSTRAINT nivel_empleado_pk PRIMARY KEY,
  clave varchar2(10) NOT NULL,
  descripcion varchar2(400) NOT NULL
);

CREATE TABLE empleado_base(
  empleado_id NUMBER,
  numero_empleado_base number(10,0) NOT NULL CONSTRAINT empleado_base_uk UNIQUE,
  fecha_inicio DATE NOT NULL,
  protesta_firmada blob NOT NULL,
  nivel_empleado_id number(10,0) NOT NULL,
  CONSTRAINT empleado_base_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado(empleado_id),
  CONSTRAINT empleado_base_pk PRIMARY KEY(empleado_id),
  CONSTRAINT empleado_base_nivel_empleado_id_fk FOREIGN KEY(nivel_empleado_id)
    REFERENCES nivel_empleado(nivel_empleado_id)
);


CREATE TABLE becario(
  empleado_id NUMBER,
  universidad_nombre varchar2(80) NOT NULL,
  carrera_nombre varchar2(80) NOT NULL,
  fecha_estimada_titulacion DATE NOT NULL,
  promedio number(4,2) NOT NULL,
  CONSTRAINT becario_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado(empleado_id),
  CONSTRAINT becario_pk PRIMARY KEY(empleado_id),
  CONSTRAINT becario_promedio_chk CHECK(promedio >= 0 AND promedio <= 10)
);


CREATE TABLE quincena(
  quincena_id number(10,0) CONSTRAINT quincena_pk PRIMARY KEY,
  anio number(4,0) NOT NULL,
  numero_quincena number(2,0) NOT NULL,
  CONSTRAINT quincena_numero_quincena_chk
    CHECK( numero_quincena <= 26 ),
  CONSTRAINT quincena_anio_chk
    CHECK ( anio > 1970 )
);

CREATE TABLE concepto_pago(
  concepto_pago_id number(10,0) CONSTRAINT concepto_pago_pk PRIMARY KEY,
  clave AS (
    tipo ||
    upper(substr(nombre, 1, 2)) ||
    substr(CONCEPTO_PAGO_id, -1, 1)
  ),
  nombre varchar2(40) NOT NULL,
  descripcion varchar2(400) NOT NULL,
  tipo char(1) NOT NULL,
  CONSTRAINT concepto_pago_tipo_chk CHECK( tipo IN ('P', 'D') ),
  CONSTRAINT concepto_pago_nombre CHECK( LENGTH(nombre) >= 2 )
);


CREATE TABLE beneficiario(
  beneficiario_id number(10,0) CONSTRAINT beneficiario_pk PRIMARY KEY,
  nombre varchar2(40) NOT NULL,
  apellido_paterno varchar2(40) NOT NULL,
  apellido_materno varchar2(40) NULL
);

CREATE TABLE empleado_beneficiario(
  empleado_beneficiario_id number(10,0) CONSTRAINT empleado_beneficiario_pk PRIMARY KEY,
  porcentaje number(5,2) NOT NULL,
  empleado_id NUMBER NOT NULL,
  beneficiario_id NUMBER NOT NULL,
  CONSTRAINT empleado_beneficiario_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado(empleado_id),
  CONSTRAINT empleado_beneficiario_beneficiario_id_fk FOREIGN KEY(beneficiario_id)
    REFERENCES beneficiario(beneficiario_id),
  CONSTRAINT empleado_beneficiario_porcentaje_chk CHECK( porcentaje <= 100 AND porcentaje >= 0)
);



CREATE TABLE proyecto(
  proyecto_id NUMBER(10,0) CONSTRAINT proyecto_pk PRIMARY KEY,
  clave varchar2(10) NOT NULL,
  nombre varchar2(40) NOT NULL,
  descripcion varchar2(400) NOT NULL,
  numero_partida_presupuestal varchar2(8) NOT NULL,
  CONSTRAINT proyecto_numero_partida_presupuestal_chk 
    CHECK( LENGTH(numero_partida_presupuestal) = 8 )
);


CREATE TABLE empleado_honorarios(
  empleado_id NUMBER CONSTRAINT empleado_honorarios_pk PRIMARY KEY,
  empleado_base_autorizador_id NUMBER NOT NULL,
  proyecto_id NUMBER NOT NULL,
  CONSTRAINT empleado_honorarios_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado(empleado_id),
  CONSTRAINT empleado_honorarios_empleado_base_autorizador_id_fk FOREIGN KEY(empleado_base_autorizador_id)
    REFERENCES empleado_base(empleado_id),
  CONSTRAINT empleado_honorarios_proyecto_id_fk FOREIGN KEY(proyecto_id)
    REFERENCES proyecto(proyecto_id)
);

CREATE TABLE contrato(
  contrato_id number(10,0) CONSTRAINT contrato_pk PRIMARY KEY,
  numero_contrato number(10,0) NOT NULL CONSTRAINT contrato_numero_contrato_uk UNIQUE,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  contrato_firmado blob NOT NULL,
  empleado_id NUMBER NOT NULL,
  CONSTRAINT contrato_empleado_id_fk FOREIGN KEY(empleado_id)
    REFERENCES empleado_honorarios(empleado_id),
  CONSTRAINT contrato_vigencia_check CHECK(
  	trunc(MONTHS_BETWEEN(fecha_fin, fecha_inicio)) <= 3
  )
);


CREATE TABLE nomina(
  nomina_id number(10,0) CONSTRAINT nomina_pk PRIMARY KEY,
  fecha_generacion DATE DEFAULT sysdate NOT NULL,
  fecha_pago DATE NOT NULL,
  importe_total number(10,2) NOT NULL,
  total_pagos_generados number(10,0) NOT NULL,
  total_pagos_no_cobrados number(10,0) NOT NULL,
  quincena_id NUMBER NOT NULL CONSTRAINT nomina_quincena_id_uk UNIQUE,
  CONSTRAINT nomina_quincena_id_fk FOREIGN KEY(quincena_id)
    REFERENCES quincena(quincena_id),
  CONSTRAINT nomina_importe_total_chk
    CHECK ( importe_total >= 0 )
);

CREATE TABLE empleado_nomina(
  empleado_nomina_id number(10,0) CONSTRAINT empleado_nomina_pk PRIMARY KEY,
  importe_pago number(10,2) NOT NULL,
  empleado_id NUMBER NOT NULL,
  nomina_id NUMBER NOT NULL,
  CONSTRAINT empleado_nomina_empleado_id_fk FOREIGN KEY (empleado_id)
    REFERENCES empleado(empleado_id),
  CONSTRAINT empleado_nomina_nomina_id_fk FOREIGN KEY(nomina_id)
    REFERENCES nomina(nomina_id),
  CONSTRAINT empleado_nomina_importe_pago_chk
    CHECK ( importe_pago >= 0 )
);


CREATE TABLE empleado_nomina_concepto_pago(
  empleado_nomina_concepto_pago_id number(10,0) 
    CONSTRAINT empleado_nomina_concepto_pago_pk PRIMARY KEY,
  importe number(10,2) NOT NULL,
  empleado_nomina_id NUMBER NOT NULL,
  concepto_pago_id NUMBER NOT NULL,
  CONSTRAINT empleado_nomina_concepto_pago_empleado_nomina_id_fk
    FOREIGN KEY(empleado_nomina_id)
    REFERENCES empleado_nomina(empleado_nomina_id),
  CONSTRAINT empleado_nomina_concepto_pago_concepto_pago_id_fk
    FOREIGN KEY(concepto_pago_id)
    REFERENCES concepto_pago(concepto_pago_id)
);




