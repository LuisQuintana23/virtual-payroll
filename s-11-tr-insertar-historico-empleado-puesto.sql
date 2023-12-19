--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Trigger insertar a historico empleado puesto

create or replace trigger trg_historico_empleado_puesto
after insert or update of puesto_id on empleado
for each row
DECLARE
	v_historico_id number(10,0);
	v_puesto_id number(10,0);
    v_empleado_id NUMBER (10,0);
begin
	select historico_empleado_puesto_seq.nextval into v_historico_id from dual;

	v_puesto_id := :NEW.puesto_id;
    v_empleado_id := :NEW.empleado_id;

	-- inserta en el histórico
	insert into historico_empleado_puesto
	(historico_empleado_puesto_id, puesto_id, empleado_id)
	values(v_historico_id, v_puesto_id, v_empleado_id);
end;
/
show errors

