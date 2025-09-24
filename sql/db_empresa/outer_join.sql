/* 
1 - Liste o número de matrícula e nome dos empregados e nome e parentesco dos seus dependentes. 
Considere também os funcionários que não tem dependentes.
*/

SELECT e.num_matricula id_empregado, 
e.nom_empregado nome_empregado, 
d.dsc_parentesco parentesco,
d.nom_dependente nome_dependente
FROM empregado e 
LEFT JOIN dependente d on d.num_matricula = e.num_matricula


/* 
2 - Liste o número de matrícula e nome dos empregados que não tem dependentes cadastrados.
*/
SELECT e.num_matricula id_empregado, 
e.nom_empregado nome_empregado
FROM empregado e 
LEFT JOIN dependente d on d.num_matricula = e.num_matricula
WHERE d.num_matricula IS NULL


/* 
Listar os nomes dos projetos, os locais de execução, o departamento, e os gerentes responsáveis. 
Considere também os departamentos sem projeto e sem gerente.
*/

SELECT p.nom_projeto, 
p.nom_local, 
d.nom_depto, 
e.nom_empregado
FROM projeto p 
RIGHT JOIN departamento d ON d.cod_depto = p.cod_depto
LEFT JOIN empregado e ON e.num_matricula = d.num_matricula_gerente


