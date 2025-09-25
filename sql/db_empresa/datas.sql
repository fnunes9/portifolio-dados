-- 1 - Gerar a lista de aniversariantes da empresa com mês, dia e nome do empregado ordem cronológica
SELECT MONTH(e.dat_nascimento) mes,
DAY(e.dat_nascimento) dia,
e.nom_empregado
FROM empregado e 
ORDER BY mes,dia

-- 2 - Listar os departamentos e seus gerentes com tempo de gerência em anos ordenando pelo mais antigo
SELECT d.nom_depto,
e.nom_empregado,
YEAR (getdate()) - YEAR(d.dat_inicio_gerente) Tempo
FROM departamento d 
LEFT JOIN empregado e ON d.num_matricula_gerente = e.num_matricula 
ORDER BY Tempo DESC

-- 3 - Listar os funcionários  que terão mais que 65 a partir de 2025
SELECT e.nom_empregado,
YEAR(getdate()) - YEAR(e.dat_nascimento) IDADE,
YEAR(getdate()) + 1 - YEAR(e.dat_nascimento) Idade_Prox_ano
FROM empregado e 
WHERE YEAR(getdate()) + 1 - YEAR(dat_nascimento) >= 65


