--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Trigger para insertar a historico puesto sueldo

create or replace trigger trg_historico_puesto_sueldo
after insert or update of sueldo_mensual_bruto, vigencia_fecha_inicio,vigencia_fecha_fin on puesto
for each row
DECLARE
	v_historico_id number(10,0);
	v_puesto_id number(10,0);
	v_sueldo_mensual_bruto number(10,2);
	v_vigencia_fecha_inicio date;
	v_vigencia_fecha_fin date;
begin
	select historico_puesto_sueldo_seq.nextval into v_historico_id from dual;

	v_puesto_id := :NEW.puesto_id;
    v_vigencia_fecha_inicio := :NEW.vigencia_fecha_inicio;
    v_vigencia_fecha_fin := :NEW.vigencia_fecha_fin;
	v_sueldo_mensual_bruto := :NEW.sueldo_mensual_bruto;

	-- inserta en el histórico
	insert into historico_puesto_sueldo
	(historico_puesto_sueldo_id,sueldo_mensual_bruto, vigencia_fecha_inicio,
	  vigencia_fecha_fin, puesto_id
	)
	values(v_historico_id, v_sueldo_mensual_bruto, v_vigencia_fecha_inicio,
	  v_vigencia_fecha_fin, v_puesto_id);
end;
/

