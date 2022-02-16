#candadpo A:
#posicion:
#Muestre cuántas veces los jugadores lograron tener más o la misma cantidad de
#asistencias por partido, que el máximo de asistencias por partido.

#clave 
#Muestre la suma total del peso de los jugadores, donde la conferencia sea Este y la posición
#sea centro o esté comprendida en otras posiciones.

#query A:

select * from jugadores;
select * from estadisticas;
select * from partidos;

#---------------------------posicion---------------------------

select count(Asistencias_por_partido) from estadisticas
where Asistencias_por_partido >= (select max(Asistencias_por_partido) from estadisticas);   #posicion a: 2

SELECT * from estadisticas ORDER BY Asistencias_por_partido DESC ;                          #verificacion

SELECT * FROM estadisticas WHERE Asistencias_por_partido = 34;                               #verificacion

#---------------------------clave---------------------------

select sum(peso) from jugadores inner join equipos on jugadores.Nombre_equipo = equipos.Nombre     #clave 14043
where Conferencia = 'east'and Posicion  like '%C%';

#candado b 
#posicion
#Muestre la cantidad de jugadores que poseen más asistencias por partidos, que el numero
#de jugadores que tiene el equipo Heat. 

#clave
#La clave será igual al conteo de partidos jugados durante las temporadas del año 1999

#---------------------------posicion b---------------------------


select count(jugador) from estadisticas 
where Asistencias_por_partido > (select count(Nombre_equipo) from jugadores         #posicion b: 3
where Nombre_equipo like 'Heat');

#---------------------------clave  b---------------------------

select count(temporada) from partidos            #clave b 3480
where temporada like '%99%';

#candado c
#posicion c:
#La posición del código será igual a la cantidad de jugadores que proceden de Michigan y
#forman parte de equipos de la conferencia oeste. 

#Al resultado obtenido lo dividiremos por la cantidad de jugadores cuyo peso es mayor o igual
#a 195, y a eso le vamos a sumar 0.9945

select (select count(Codigo) from jugadores inner join equipos on equipos.Nombre=jugadores.Nombre_equipo
where procedencia like 'Michigan' and equipos.Conferencia like 'west') /(select count(codigo) from jugadores  
where peso >= 195) + 0.9945;              
                                                  #posicion c: 1

#clave c:
#Para obtener el siguiente código deberás redondear hacia abajo el resultado que se
#devuelve de sumar: el promedio de puntos por partido, el conteo de asistencias por partido,
#y la suma de tapones por partido. Además, este resultado debe ser, donde la división sea
#central.
select distinct floor((select avg(Puntos_por_partido) from estadisticas)
 + (select sum(Asistencias_por_partido) from estadisticas) 
 + (select sum(Tapones_por_partido) from estadisticas) )                            #clave c: 6742
 from jugadores inner join estadisticas on estadisticas.jugador=jugadores.codigo 
inner join equipos on jugadores.Nombre_equipo=equipos.Nombre
 where Division = 'central';
 
 select floor((select avg(Puntos_por_partido) )
 + (select sum(Asistencias_por_partido) )                                            #clave c: 1038
 + (select sum(Tapones_por_partido))) 
 from estadisticas inner join jugadores on estadisticas.jugador=jugadores.codigo inner join equipos on jugadores.Nombre_equipo=equipos.Nombre 
 where Division = 'central';

 
#candado d
#Muestre los tapones por partido del jugador Corey Maggette durante la temporada 00/01.
#Este resultado debe ser redondeado. Nota: el resultado debe estar redondeado


select round(Tapones_por_partido) from estadisticas inner join jugadores on jugadores.codigo=estadisticas.jugador   #posicion d: 4
where temporada like '00/01' and jugadores.nombre like 'Corey Maggette';

#clave d:
#Para obtener el siguiente código deberás redondear hacia abajo, la suma de puntos por
#partido de todos los jugadores de procedencia argentina.

select floor( sum(Puntos_por_partido)) from estadisticas inner join jugadores on jugadores.codigo=estadisticas.jugador    #clave d: 191
where Procedencia like 'Argentina';