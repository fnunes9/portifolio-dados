
SELECT e.num_matricula, *
FROM empregado e

select * from dependente
-- List the employee ID number and name, along with the name and relationship of all dependents.
SELECT e.num_matricula, e.nom_empregado, d.nom_dependente, d.dsc_parentesco
FROM empregado e
JOIN dependente d 
on e.num_matricula = d.num_matricula

--List the department names with the employee ID number and name of all employees. Order the result by department and employee name.
SELECT dep.nom_depto, e.num_matricula, e.nom_empregado
FROM departamento dep
JOIN empregado e ON e.cod_depto = dep.cod_depto
ORDER BY nom_depto, nom_empregado

-- For each department, one of the employees has the role of manager. List the department names with the employee ID number and name of the responsible manager.
SELECT d.nom_depto, e.num_matricula, e.nom_empregado
FROM departamento d
JOIN empregado e ON e.num_matricula = d.num_matricula_gerente

-- List the supervisor ID number and name, and the employee ID number and name of the employees under their supervision. Order the supervisors and employees alphabetically.
SELECT s.num_matricula supervisor_id,
s.nom_empregado nome_supervisor,
e.num_matricula funcionario_id,
e.nom_empregado
FROM empregado e
JOIN empregado s
ON e.num_matricula_supervisor = s.num_matricula

-- List the employees of the projects in BH with the total allocated hours. Display the project name and location, employee ID number and name, and the total allocated hours.
SELECT p.nom_projeto, p.nom_local, e.num_matricula, e.nom_empregado, a.num_horas
FROM alocacao a 
JOIN empregado e on e.num_matricula = a.num_matricula
JOIN projeto p on p.cod_projeto = a.cod_projeto
WHERE p.nom_local LIKE '%bh%'

