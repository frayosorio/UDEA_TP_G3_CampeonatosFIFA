SELECT * FROM pais
		WHERE pais = 'Colombia'

SELECT * FROM campeonato
SELECT * FROM campeonatopais

SELECT idcampeonato, campeonato, pais
	FROM campeonato
	JOIN campeonatopais ON campeonato.id = campeonatopais.idcampeonato
	JOIN pais ON pais.id = campeonatopais.idpais

--Agregar grupo K del campeonato 2026--

INSERT INTO grupo
	(grupo, idcampeonato)
	VALUES ('K', 12)

SELECT campeonato, grupo, G.id
	FROM grupo G
	JOIN campeonato C ON C.id = G.idcampeonato
	ORDER BY 1, 2

INSERT INTO grupopais
	(idgrupo, idpais)
	VALUES (19, 1)

--Actualización de las FASES
SELECT * FROM fase

DELETE FROM fase
	WHERE id > 1

INSERT INTO Fase (Id, Fase) VALUES(   2, 'Dieciseisavos de Final');
INSERT INTO Fase (Id, Fase) VALUES(   3, 'Octavos de Final');
INSERT INTO Fase (Id, Fase) VALUES(   4, 'Cuartos de Final');
INSERT INTO Fase (Id, Fase) VALUES(   5, 'Semifinal');
INSERT INTO Fase (Id, Fase) VALUES(   6, 'Final');


--Resetar secuencias
SELECT setval(
    pg_get_serial_sequence('pais', 'id'),
    (SELECT MAX(id) FROM pais)
);