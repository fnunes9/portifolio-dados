-- Atualize nome do funcionário "Novo empregado" para  "Gustavo Teixeira" e associe ao departamento "RH"

UPDATE empregado 
SET nom_empregado = 'Gustavo Teixeira',
cod_depto = 4
WHERE num_matricula = 9

-- Faça a alocação do funcionário "Gustavo Teixeira" ao projeto "Montar plano de capacitação" com 10 horas semanais

INSERT INTO alocacao (num_matricula,cod_projeto,num_horas)
VALUES (9, 9, 10)

--Excluir do banco os projetos que não tiveram nenhum funcionário alocado 

DELETE FROM projeto 
WHERE cod_projeto NOT IN (
	SELECT a.cod_projeto FROM alocacao a 
)