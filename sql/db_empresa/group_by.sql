/*
 Listar a quantidade de empregados com idade média por supervisor
*/
SELECT COUNT(*) AS Total_empregados,
AVG(2025 - YEAR(e.dat_nascimento)) AS Media_idade,
e.num_matricula_supervisor AS Supervisor_id
FROM empregado e
GROUP BY e.num_matricula_supervisor

SELECT sup.nom_empregado, 
       count(*) AS qtd_empregado, 
       AVG( YEAR(getdate()) - YEAR(e.dat_nascimento)) AS idade_media
FROM empregado e
JOIN empregado sup on sup.num_matricula = e.num_matricula_supervisor
GROUP BY sup.nom_empregado

/*
Listar nome dos departamentos com nomes dos empregados e a quantidade de dependentes, se houver.
*/
SELECT d.nom_depto,
e.nom_empregado, 
COUNT(dp.nom_dependente) qtd_dependentes
FROM departamento d
JOIN empregado e on e.cod_depto = d.cod_depto
LEFT JOIN dependente dp on dp.num_matricula = e.num_matricula
GROUP BY d.nom_depto,e.nom_empregado
ORDER BY d.nom_depto, e.nom_empregado

/*
Listar somente os locais e a quantidade de projetos onde houver mais de 2 projetos alocados
*/
SELECT pj.nom_local,
COUNT(*) qtd_projetos
FROM projeto pj
GROUP BY pj.nom_local
HAVING COUNT(pj.nom_local) > 2

SELECT nom_local, 
       COUNT(*) qtd_projeto
FROM projeto p
GROUP BY nom_local
HAVING COUNT(*) > 2
