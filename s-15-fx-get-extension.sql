--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 05/12/2023
--@Descripción: Creación de funcion para obtener extensión del archivo

CREATE OR REPLACE FUNCTION getExtension(
  p_filename varchar2
) RETURN varchar2 IS

v_extension varchar2(3); 
BEGIN
	select substr(regexp_substr(filename, '\.[^\.]*$'), 2)
	into v_extension
	from
	    (select p_filename filename from dual);
	   
	RETURN v_extension;
END;
/
show errors



