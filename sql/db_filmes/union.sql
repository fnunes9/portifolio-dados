/*
Listar os filmes que são do gênero Guerra ou do Gênero Ação
*/

SELECT f.dsc_filme, g.dsc_genero
FROM filmes f
JOIN filmes_genero fg ON fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
UNION
SELECT f.dsc_filme, g.dsc_genero
FROM filmes f
JOIN filmes_genero fg ON fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação'


 --Listar os filmes que são do gênero Guerra e também do Gênero Ação
SELECT f.dsc_filme --,g.dsc_genero
FROM filmes f
JOIN filmes_genero fg ON fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
INTERSECT
SELECT f.dsc_filme --,g.dsc_genero
FROM filmes f
JOIN filmes_genero fg ON fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação'

-- Listar os filmes que são do gênero Guerra e não são do Gênero Ação

SELECT f.dsc_filme --,g.dsc_genero
FROM filmes f
JOIN filmes_genero fg ON fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
EXCEPT
SELECT f.dsc_filme --,g.dsc_genero
FROM filmes f
JOIN filmes_genero fg ON fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação'