-- Consulta validaciones por archivo.
select municipio_nombre as "Nombre Municipio", codigo_gestor as "Codigo gestor", gestor_catastral as "Gestor Catastral", archivo as "Archivo", sum(validaciones_obligatorias_no_satisfechas) as "Validaciones no satisfechas"

  from validaciones_archivo

  group by municipio_nombre, codigo_gestor, archivo, gestor_catastral order by municipio_nombre;


-- Consulta validaciones por municipio
select municipio_nombre as "Nombre Municipio", codigo_gestor as "Codigo gestor", gestor_catastral as "Gestor Catastral", sum(validaciones_obligatorias_no_satisfechas) as "Validaciones no satisfechas"

  from validaciones_archivo

  group by municipio_nombre, codigo_gestor, gestor_catastral order by municipio_nombre;
