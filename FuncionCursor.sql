Drop function registrar_validacion();
drop table a;

create table validaciones_archivo ( departamento_nombre varchar(128) NULL,
	divipola_municipio bpchar(5) NULL,
	municipio_nombre varchar(128) NULL,
	codigo_gestor int4 NULL,
	gestor_catastral varchar(512) NULL,
	periodo_reporte_id int4 NULL,
	archivo varchar(100) NULL,
	entrega varchar(8) NULL,
	validaciones_obligatorias_no_satisfechas int4 NULL
);


CREATE OR REPLACE FUNCTION registrar_validacion() RETURNS void AS
$$
DECLARE

  cur_val_datos CURSOR FOR SELECT * FROM valida_integridad_datos; 
  registro valida_integridad_datos%ROWTYPE;

BEGIN
  FOR r IN cur_val_datos LOOP
    if not exists (select * from validaciones_archivo where (archivo = r.archivo and entrega = r.entrega)) then
      
      insert into validaciones_archivo values (r.departamento_nombre,r.divipola_municipio,r.municipio_nombre,r.codigo_gestor,r.gestor_catastral,r.periodo_reporte_id,r.archivo,r.entrega,0);
    end if;
    --if exists (select * from a where a.segunda = registro.entrega) then
      --update a set segunda = segunda ||'a' where primera = 1;
    --end if;
      

  END LOOP;

  RETURN;
   
END $$ LANGUAGE 'plpgsql';

select registrar_validacion();


