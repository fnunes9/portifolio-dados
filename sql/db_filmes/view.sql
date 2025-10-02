/*
Crie uma view com o nome vw_filmes para listar todos os filmes com descrição, 
gênero e quantidade de votos 
*/
CREATE VIEW vw_filmes
	AS 
	SELECT f.dsc_filme, g.dsc_genero , f.qtd_votos
	FROM filmes f 
	JOIN filmes_genero fg on fg.id_filme = f.id_filme
	JOIN generos g ON g.id_genero = fg.id_genero

/*Utilize a view criada para listar:

a) 3 gêneros mais votados
*/
SELECT TOP (3) dsc_genero, 
       sum(qtd_votos) AS qtd_votos
FROM vw_filmes
GROUP BY dsc_genero
ORDER BY 2 DESC

-- 3 gêneros mais votados entre aqueles com menos de 600 mil votos
SELECT TOP (3) dsc_genero, 
       sum(qtd_votos) AS qtd_votos
FROM vw_filmes
GROUP BY dsc_genero
HAVING sum(qtd_votos) < 600000
ORDER BY 2 DESC