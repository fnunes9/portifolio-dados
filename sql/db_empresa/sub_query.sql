/*
Listar o nome do empregado e o nome do respectivo departamento para todos os empregados que não estão 
alocados em projetos
*/
SELECT e.nom_empregado, d.nom_depto
FROM empregado e 
JOIN departamento d on d.cod_depto = e.cod_depto
WHERE e.num_matricula NOT IN (
	SELECT a.num_matricula FROM alocacao a )

SELECT e.nom_empregado, d.nom_depto
FROM empregado e 
JOIN departamento d on d.cod_depto = e.cod_depto
WHERE NOT EXISTS (
	SELECT a.num_matricula 
	FROM alocacao a
		WHERE a.num_matricula = e.num_matricula)

SELECT nom_empregado, 
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
LEFT JOIN alocacao a on a.num_matricula = e.num_matricula 
WHERE a.num_matricula is null

/*
Listar o empregado, o número de horas e o projeto cuja alocação de horas no projeto é maior
do que a média de alocação do referido projeto
*/

SELECT a.cod_projeto,
e.nom_empregado,
p.nom_projeto,
media, 
SUM (num_horas) QTS_HORAS
FROM empregado e 
JOIN alocacao a on a.num_matricula = e.num_matricula
JOIN projeto p on p.cod_projeto = a.cod_projeto
JOIN (
	SELECT a.cod_projeto, 
	AVG(a.num_horas) media
	FROM alocacao a 
	GROUP BY a.cod_projeto
) a_media ON a.cod_projeto = a_media.cod_projeto
GROUP BY a.cod_projeto, e.nom_empregado, p.nom_projeto, media 
HAVING SUM (num_horas) > media

