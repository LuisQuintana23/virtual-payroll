--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Trigger validación de edad (no se puede por check debido a sysdate)

create or replace trigger trg_empleado_edad_minima
before insert or update of fecha_nacimiento on empleado
for each ROW
DECLARE
  v_edad number(3,0);
BEGIN
	v_edad := trunc(MONTHS_BETWEEN(sysdate, :new.fecha_nacimiento)/12);
	IF v_edad < 15 THEN
	  raise_application_error(-20001,'Un empleado no puede trabajar antes de los 15 años');	
	END IF;
END;


