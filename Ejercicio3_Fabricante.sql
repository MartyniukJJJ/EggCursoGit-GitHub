-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
Select nombre from producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto
SELECT nombre,precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto
SELECT * FROM producto;

-- 4. Lista los nombres y los precios de todos los productos de la tabla producto,
-- redondeando el valor del precio.
SELECT nombre , round(precio) from producto;

-- 5. Lista el código de los fabricantes que tienen productos en la tabla producto
SELECT producto.codigo_fabricante , fabricante.nombre 
FROM fabricante  inner join producto  ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.codigo_fabricante IS NOT null;

-- 10. Lista el código de los fabricantes que tienen productos en la tabla producto, sin
-- mostrar los repetidos.

SELECT DISTINCT producto.codigo_fabricante , fabricante.nombre 
FROM fabricante  inner join producto  ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.codigo_fabricante IS NOT null;



-- 11. Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre asc;
-- 12. Lista los nombres de los productos ordenados en primer lugar por el nombre de
-- forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre from producto order by nombre asc;
select nombre, precio from producto order by precio desc;
-- 13. Devuelve una lista con las 5 primeras filas de la tabla fabricante
select nombre,codigo from fabricante order by precio desc limit 5;

-- 14. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas
-- ORDER BY y LIMIT)
select nombre,precio from producto order by precio asc limit 1;
-- 15. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas
-- ORDER BY y LIMIT)
select nombre,precio from producto order by precio desc limit 1;
-- 16. Lista el nombre de los productos que tienen un precio menor o igual a $120.
select nombre,precio from producto where precio >=120 order by precio desc ;
-- 17. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el
-- operador BETWEEN.
select * from producto where precio between 60 and 200;
-- 18. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el
-- operador IN.
select * from producto where codigo_fabricante in (1,3,5);
-- 23. Devuelve una lista con el nombre de todos los productos que contienen la cadena
-- Portátil en el nombre.
select * from producto where nombre like '&Portatil%';

-- Consultas Multitabla

-- 1. Devuelve una lista con el código del producto, nombre del producto, código del
-- fabricante y nombre del fabricante, de todos los productos de la base de datos.
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre 
from producto inner join fabricante ON producto.codigo = fabricante.codigo;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de
-- todos los productos de la base de datos. Ordene el resultado por el nombre del
-- fabricante, por orden alfabético.
select p.nombre,p.precio,f.nombre 
from fabricante f inner join producto p ON p.codigo_fabricante = f.codigo order by f.nombre asc;

-- 3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del
-- producto más barato.
select p.nombre,p.precio,f.codigo
from fabricante f inner join producto p on p.codigo_fabricante = f.codigo order by p.precio limit 1 ;

-- 4. Devuelve una lista de todos los productos del fabricante Lenovo.
select f.nombre,p.nombre as 'Modelo',p.precio,f.codigo
from fabricante f inner join producto p on p.codigo_fabricante = f.codigo where f.nombre like '%lenovo%' ;

-- 5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un
-- precio mayor que $200.
select f.nombre,p.nombre as 'Modelo',p.precio
from fabricante f inner join producto p on p.codigo_fabricante = f.codigo where p.precio > 200 and p.codigo_fabricante = 6 ;

-- 6. Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackard. Utilizando el operador IN.
SELECT f.nombre,p.nombre as 'Modelo'
FROM fabricante f inner join producto p ON p.codigo_fabricante = f.codigo where f.nombre IN ('Asus','Hewlett-Packard');

-- 7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de
-- todos los productos que tengan un precio mayor o igual a $180. Ordene el resultado
-- en primer lugar por el precio (en orden descendente) y en segundo lugar por el
-- nombre (en orden ascendente)

SELECT f.nombre,p.nombre as 'Modelo', p.precio
FROM fabricante f inner join producto p ON p.codigo_fabricante = f.codigo where p.precio >= 180 ORDER BY p.precio desc,p.nombre asc ;

SELECT f.nombre,p.nombre as 'Modelo', p.precio
FROM fabricante f inner join producto p ON p.codigo_fabricante = f.codigo where p.precio >= 180 ORDER BY p.nombre asc,p.precio desc;

--                        Consultas Multitabla
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.


-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto
-- con los productos que tiene cada uno de ellos. El listado deberá mostrar también
-- aquellos fabricantes que no tienen productos asociados.
SELECT f.nombre, f.codigo, p.nombre as 'modelo'
FROM fabricante f 
left outer join producto p 
    ON f.codigo = p.codigo_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen
-- ningún producto asociado
select f.codigo, f.nombre
FROM producto p
right outer join fabricante f 
	on p.codigo_fabricante = f.codigo
    where p.codigo_fabricante IS null;
    
-- Subconsultas (En la cláusula WHERE)
 -- Con operadores básicos de comparación
-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select nombre
from  producto 
where codigo_fabricante = (select codigo from fabricante where nombre like 'lenovo');


--  2. Devuelve todos los datos de los productos que tienen el mismo precio que el
-- producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * 
from producto 
where precio >= (select max(precio) 
from producto 
where codigo = (Select codigo 
from fabricante 
where nombre like 'Lenovo')   ); -- no terminado
-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre,MAX(precio),codigo_fabricante
FROM producto
where codigo_fabricante = (Select codigo
from fabricante 
where nombre like 'Lenovo');
-- 4. Lista todos los productos del fabricante Asus que tienen un precio superior al precio
-- medio de todos sus productos.
SELECT nombre,MAX(precio),codigo_fabricante
FROM producto
where codigo_fabricante = (Select codigo
from fabricante 
where nombre like 'Lenovo');
-- Subconsultas con IN y NOT IN

-- 1. Devuelve los nombres de 
-- los fabricantes que tienen productos asociados.
-- (Utilizando IN o NOT IN).
SELECT nombre 
from fabricante 
where codigo 
in (Select codigo_fabricante from producto);
-- 2. Devuelve los nombres de los fabricantes que no tienen productos asociados.
-- (Utilizando IN o NOT IN).
SELECT nombre 
from fabricante 
where codigo 
not in (Select codigo_fabricante from producto);
-- Subconsultas (En la cláusula HAVING)

-- 1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo
-- número de productos que el fabricante Lenovo.
SELECT nombre, count(*) as 'cantidad'
FROM fabricante,producto
WHERE fabricante.codigo = producto.codigo_fabricante 
