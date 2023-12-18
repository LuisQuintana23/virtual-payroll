--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 30/11/2023
--@Descripción: Creación de sinonimos

-- PENDIENTE

-- sinonimos publicos para de admin para invitado
CREATE OR REPLACE public synonym empleado_nomina_concepto_pago FOR qu_proy_admin.empleado_nomina_concepto_pago;
CREATE OR REPLACE public synonym credencial FOR qu_proy_admin.credencial;
CREATE OR REPLACE public synonym correo FOR qu_proy_admin.empleado_correo;

grant SELECT ON puesto to qu_proy_invitado;
grant SELECT ON becario to qu_proy_invitado;
grant SELECT ON proyecto to qu_proy_invitado;

REVOKE SELECT ON proyecto FROM qu_proy_invitado;

SELECT * FROM QU_PROY_ADMIN.proyecto;
SELECT * FROM QU_PROY_ADMIN.BENEFICIARIO;

-- conectar como invitado
CONNECT qu_proy_invitado
-- sinonimos para invitado


-- Sinomino extra para nombre tabla empleado_nomina_concepto_pago
create or replace synonym empleado_concepto for qu_proy_admin.empleado_nomina_concepto_pago;