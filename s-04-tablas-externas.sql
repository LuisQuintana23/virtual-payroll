--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 01/01/2023
--@Descripción: Creación de tablas externas

CREATE TABLE dominio_invalido_ext (
  dominio_invalido_ext_id number(10,0),
  dominio varchar2(400)
)
organization external (
	type oracle_loader
	default directory data_dir
	access parameters (
		records delimited by newline
		badfile data_dir:'domains_ext_bad.log'
		logfile data_dir:'domains_ext.log'
		fields terminated by ','
		lrtrim
		missing field values are null
	)
	location ('domains.csv')
)
reject limit unlimited;





