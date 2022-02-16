/*1. Obtener los datos completos de los empleados.*/
SELECT*FROM empleados;
/*2. Obtener los datos completos de los departamentos.*/
SELECT*FROM departamentos;
/*3. Listar el nombre de los departamentos.*/
SELECT nombre from departamentos; 
/*4. Obtener el nombre y salario de todos los empleados.*/
SELECT nombre,sal_emp from empleados; 
/*5. Listar todas las comisiones*/
SELECT comision_emp from empleados; 
/*7. Obtener los datos de los empleados vendedores, ordenados por nombre
alfabéticamente*/
SELECT*FROM empleados WHERE cargo_emp ='secretaria';
/*8. Obtener el nombre y cargo de todos los empleados, ordenados por salario de
menor a mayor..*/
SELECT*FROM empleados WHERE cargo_emp ='vendedor' ORDER BY nombre asc ;
/*9. Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para
las respectivas tablas de empleados*/
SELECT nombre AS 'Nombre Alumno' ,cargo_emp  FROM empleados;
/*10. Listar los salarios y comisiones de los empleados del departamento 2000,
ordenado por comisión de menor a mayor*/
SELECT sal_emp,comision_emp FROM empleados where id_depto = '2000'ORDER BY comision_emp desc;
/*11. Obtener el valor total a pagar que resulta de sumar el salario y la comisión de los
empleados del departamento 3000 una bonificación de 500, en orden alfabético
del empleado.*/
SELECT nombre,(sal_emp+comision_emp+500) from empleados WHERE id_depto = '3000' ORDER BY nombre desc;
/*12. Muestra los empleados cuyo nombre empiece con la letra J.*/
SELECT nombre from empleados where nombre like 'j%';
/*13. Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de
aquellos empleados que tienen comisión superior a 1000.*/
SELECT nombre,sal_emp,comision_emp,(sal_emp+comision_emp) as salario_total from empleados where comision_emp>250000;
/*14. Obtener un listado similar al anterior, pero de aquellos empleados que NO
tienen comisión*/
SELECT nombre,sal_emp,comision_emp,(sal_emp+comision_emp) as salario_total from empleados where comision_emp=0;
/*15. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.*/
SELECT*from empleados where comision_emp > sal_emp;
/*16. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.*/
SELECT*FROM empleados where  comision_emp<= (sal_emp*0.30);
/*17. Hallar los empleados cuyo nombre no contiene la cadena “MA”*/
SELECT nombre from empleados where nombre  not like  '%MA%';
/*18. Obtener los nombres de los departamentos que sean “Ventas” ni “Investigación”
ni ‘Mantenimiento.*/
SELECT nombre_depto from departamentos where nombre_depto in ( 'Ventas', 'Investigacion' ,'Mantenimiento');
/*19. Ahora obtener los nombres de los departamentos que no sean “Ventas” ni
“Investigación” ni ‘Mantenimiento*/
SELECT nombre_depto from departamentos where nombre_depto not in ( 'Ventas', 'Investigacion' ,'Mantenimiento');
/*20. Mostrar el salario más alto de la empresa.*/
SELECT MAX(sal_emp),nombre FROM empleados;
/*21. Mostrar el nombre del último empleado de la lista por orden alfabético*/
SELECT MAX(nombre) FROM empleados;
/*22. Hallar el salario más alto, el más bajo y la diferencia entre ellos.*/
SELECT MAX(sal_emp),MIN(sal_emp),(MAX(sal_emp)-MIN(sal_emp)) as Salario_Diferencia from empleados;
/*23. Hallar el salario promedio por departamento.*/
SELECT cargo_emp,avg(sal_emp) FROM empleados GROUP BY cargo_emp ORDER BY AVG(sal_emp) ASC;
/*HAVING*/
/*HAVING*/
/*HAVING*/
/*HAVING*/
/*HAVING*/
/*HAVING*/
/*24. Hallar los departamentos que tienen más de tres empleados. Mostrar el número
de empleados de esos departamentos.*/
SELECT cod_director, nombre_depto, COUNT(cod_director) from departamentos group by cod_director having COUNT(cod_director)>=3;
select d.nombre_depto, count(*) as 'Num empleados'
from departamentos d, empleados e 
where d.cod_director=e.cod_jefe 
group by d.id_depto
having count(*) > 3;


/*25. Mostrar el código y nombre de cada jefe, junto al número de empleados que
dirige. Solo los que tengan más de dos empleados (2 incluido) */
SELECT cod_jefe, nombre, COUNT(cod_jefe) from empleados group by  cod_jefe having (cod_jefe)>=2;
/*26. Hallar los departamentos que no tienen empleados*/
SELECT nombre_depto FROM departamentos GROUP BY ciudad HAVING COUNT(id_depto) =0;
/*27. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio
de la empresa. Ordenarlo por departamento.*/
SELECT*FROM empleados WHERE sal_emp >=(SELECT avg(sal_emp) from empleados) order by cargo_emp DESC;

