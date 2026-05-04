--Listar los paises participantes
SELECT * FROM pais
	WHERE pais IN 
	('Australia',
	'Irán',
	'Irak',
	'Japón',
	'Jordania',
	'Catar',
	'Arabia Saudita',
	'Corea del Sur',
	'Uzbekistán',
	'Argelia',
	'Cabo Verde',
	'República Democrática del Congo',
	'Egipto',
	'Ghana',
	'Costa de Marfil',
	'Marruecos',
	'Senegal',
	'Sudáfrica',
	'Túnez',
	'Canadá',
	'Curaçao',
	'Haití',
	'México',
	'Panamá',
	'Estados Unidos',
	'Argentina',
	'Brasil',
	'Colombia',
	'Ecuador',
	'Paraguay',
	'Uruguay',
	'Nueva Zelanda',
	'Austria',
	'Bélgica',
	'Bosnia y Herzegovina',
	'Croacia',
	'República Checa',
	'Inglaterra',
	'Francia',
	'Alemania',
	'Países Bajos',
	'Noruega',
	'Portugal',
	'Escocia',
	'España',
	'Suecia',
	'Suiza',
	'Turquía');

--Eliminar los paises organizadores del campeonato con ID=12 (MUNDIAL FIFA 2026)
DELETE FROM campeonatopais
	WHERE idcampeonato=12

--Eliminar los grupos del campeonato con ID=12 (MUNDIAL FIFA 2026)
DELETE FROM grupo
	WHERE idcampeonato=12

--Listar los paises organizadores
SELECT C.id, C.campeonato, C.año, P.pais
	FROM campeonato C
		LEFT JOIN campeonatopais CP ON C.id = CP.idcampeonato
		LEFT JOIN pais P ON CP.idpais =P.id
	WHERE campeonato='FIFA World Cup 2026'

SELECT C.campeonato, C.año, STRING_AGG(P.pais, ', ') paises
	FROM campeonato C
		LEFT JOIN campeonatopais CP ON C.id = CP.idcampeonato
		LEFT JOIN pais P ON CP.idpais =P.id
	WHERE campeonato='FIFA World Cup 2026'
	GROUP BY C.campeonato, C.año
	
--Listar los grupos con sus paises del campeonato
SELECT C.campeonato, G.grupo, G.id, STRING_AGG(P.Pais, ', ') paises
	FROM campeonato C
		JOIN Grupo G ON C.Id=G.IdCampeonato
		LEFT JOIN GrupoPais GP ON GP.IdGrupo=G.Id
		LEFT JOIN Pais P ON P.Id=GP.IdPais
	WHERE Campeonato='FIFA World Cup 2026'
	GROUP BY C.campeonato, G.grupo, G.id;

--Listar los estadios y sus ciudades
SELECT P.pais, C.ciudad, E.estadio, E.capacidad
	FROM pais P
		JOIN ciudad C ON P.id = C.idpais
		LEFT JOIN estadio E ON E.idciudad = C.id
	WHERE P.pais IN ('México', 'Estados Unidos', 'Canadá');

--Listar las fases
SELECT *
	FROM fase;

--Listar los encuentros

