--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 05/12/2023
--@Descripción: Creación de funcion para calcular el importe de pago a partir de los conceptos de pago de un empleado

CREATE OR REPLACE FUNCTION calcularImporteTotalEmpleado(
  p_empleado_nomina_id number
) RETURN number IS

v_importe_total number;

BEGIN
    -- para este punto el registro de empleado_nomina
    -- ya debe estar creado con un importe de 0
    -- posterior a esto se empezara el calculo de importe pago
    -- a partir de las deducciones que marco el software
    select sum(importe) into v_importe_total 
    from empleado_nomina_concepto_pago 
    group by empleado_nomina_id
    having empleado_nomina_id = p_empleado_nomina_id
    ;
    
    return v_importe_total;
END;
/
show errors;