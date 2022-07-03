Drop function registrar_validacion();

drop table a;

create table a (primera integer, segunda varchar);

insert into a values(1,'a')

CREATE OR REPLACE FUNCTION registrar_validacion() RETURNS void AS

$$

DECLARE

    cur_val_datos CURSOR FOR SELECT * FROM valida_integridad_datos; 

    registro valida_integridad_datos%ROWTYPE;

BEGIN

   FOR registro IN cur_val_datos LOOP

      if exists (select * from a where a.segunda = registro.entrega) then

       update a set segunda = segunda ||'a' where primera = 1;

      end if;

      

   END LOOP;

   RETURN;

   

END $$ LANGUAGE 'plpgsql';

select registrar_validacion();

