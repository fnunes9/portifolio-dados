/*
1 - Liste o número de matrícula e nome dos empregados e seus dependentes, exibindo a coluna
'dependentes' com nome do dependente e o parentesco entre parêntesis . Exemplo: Zezinho (filho)
*/
SELECT e.num_matricula,
e.nom_empregado,
CONCAT (d.nom_dependente,' ( ', RTRIM (d.dsc_parentesco), ' ) ')
FROM empregado e 
LEFT JOIN dependente d ON d.num_matricula = e.num_matricula

/*
Liste os departamentos, com seu respectivos gerentes e a data de início da gerência no formato dia-mês-ano
*/

SELECT e.nom_empregado, 
CONVERT(varchar(10),d.dat_inicio_gerente, 105) inicio_gerencia
FROM empregado e 
JOIN departamento d on e.num_matricula = d.num_matricula_gerente


/*
Liste os empregados e horas de alocação em cada projeto no formato abaixo:
Nome: Rodrigo Moreira Projeto: Migração para SQL 2005 - 10 horas
Considere todos os funcionários, incluindo os que não tem projeto
*/

SELECT CONCAT('Nome: ', e.nom_empregado,' Projeto: ', ISNULL(p.nom_projeto, '-'), ' - ',  convert (varchar(2), isnull(num_horas,0)),' horas ') AS alocacao
FROM empregado e 
LEFT JOIN alocacao a ON a.num_matricula = e.num_matricula
LEFT JOIN projeto p on p.cod_projeto = a.cod_projeto
