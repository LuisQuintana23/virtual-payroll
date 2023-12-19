--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 05/12/2023
--@Descripción: Creación de funcion para 

CREATE OR REPLACE FUNCTION getFechaNacimiento(
  rfc varchar2
) RETURN DATE IS

v_fecha_nacimiento DATE;

BEGIN
    -- guardar fecha de nacimiento
    select to_date(
      substr(rfc, 5, 2) || '-' ||
      substr(rfc, 7, 2) || '-' ||
      substr(rfc, 9, 2),
      'rr-mm-dd'
    )
    into v_fecha_nacimiento
    from dual;
    
    return v_fecha_nacimiento;
END;
/
show errors;
