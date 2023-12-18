
declare
  filename varchar2(40);
  v_foto_blob blob;
  v_bfile bfile;
  
BEGIN
  filename := 'foto.jpg';

  v_bfile := bfilename('PICTURE_DIR', filename);
  IF dbms_lob.fileexists(v_bfile) = 1 AND NOT
    dbms_lob.isopen(v_bfile) = 1 THEN
      dbms_lob.open(v_bfile, dbms_lob.lob_readonly);
  ELSE
    raise_application_error(-20001,'El archivo '
	  ||filename
	  ||' no existe en el directorio PICTURE_DIR'
	  ||' o el archivo esta abierto');
  end if;

  dbms_lob.loadfromfile(v_foto_blob, v_bfile, dbms_lob.getlength(v_bfile));
    
  dbms_lob.close(v_bfile);
 
END;
/
show errors
 
 
 
 
 