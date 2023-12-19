--@Autor: Luis Ángel Quintana Mora
--@Fecha creación: 05/12/2023
--@Descripción: Creación de funcion leer foto a partir de su nombre, retorna un blob

CONNECT sys AS sysdba

grant read, write on directory picture_dir to qu_proy_admin;

CONNECT qu_proy_admin

CREATE OR REPLACE FUNCTION leer_foto(
  p_filename varchar2
) RETURN blob IS

  v_foto_blob blob;
  v_bfile bfile;
  v_amount integer;
  v_dest_offset integer := 1;
  v_src_offset integer := 1;
  v_ext varchar(3);
  
BEGIN
	
  -- verificar extension del archivo
  -- solo se acepta jpg y png
  SELECT getExtension(p_filename) INTO v_ext
  FROM dual;
  
  if lower(v_ext) not in ('jpg', 'png') then
   raise_application_error(-20002,'extensión no valida: ' || v_ext);
  end if;
	
  -- asignar valor temporal blob a blob a retornar
  -- permite hacer operaciones y que no de un error aritmetico
  dbms_lob.createtemporary(v_foto_blob, true);
 
  -- cerrar archivos blob abiertos
  --dbms_lob.filecloseall();
  
  -- abrir archivo
  v_bfile := bfilename('PICTURE_DIR', p_filename);
  -- tamaño en bytes
  v_amount := dbms_lob.getlength(v_bfile);
  
  dbms_output.put_line('Amount: ' || v_amount || ' Nombre Foto: ' || p_filename);

  -- verifica que exista y que no este abierto
  IF dbms_lob.fileexists(v_bfile) = 1 AND NOT
    dbms_lob.isopen(v_bfile) = 1 THEN
    dbms_lob.open(v_bfile, dbms_lob.lob_readonly);
  ELSE
    raise_application_error(-20001,'El archivo '
	  || p_filename
	  ||' no existe en el directorio PICTURE_DIR'
	  ||' o el archivo esta abierto');
  end if;

  
  -- cargar info de foto a blob del primer parametro
  dbms_lob.loadfromfile(
    v_foto_blob,
    v_bfile,
    v_amount,
    v_dest_offset,
    v_src_offset);
    
  -- cerrar archivo bfile
  dbms_lob.close(v_bfile);
 
  RETURN v_foto_blob;
  
END;
/
show errors