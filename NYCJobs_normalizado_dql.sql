-- Pesquisa com AGREGAÇÃO
-- Selecionar o número de vagas que pertençam a categoria "Information Technology", e que tenham 
-- média salarial anual > ,não sendo obrigatório o emprego ser APENAS de tal categoria


SELECT COUNT(Job_Category), AVG(Salary_range_from)
FROM Jobs NATURAL JOIN Salary
WHERE Job_Category LIKE '%Information Technology%' 
AND Salary_frequency = 'Annual'

-- Das mais de 3000 linhas apenas 75 contém remuneração anual e se encaixam na categoria
-- ______________________________________________________________________________________


-- Pesquisa com operador UNION
-- Selecionar vagas que tenham relação com "PROGRAMMER" ou "COMPUTER" e sua remuneração inicial, mas apenas
-- que contenham remuneração anual superior a 75.000, também incluir a o código de tal emprego.

SELECT JobID, Civil_service_title, Salary_range_from
FROM Jobs NATURAL JOIN Salary as s NATURAL JOIN Requirements
WHERE s.Salary_frequency = 'Annual' 
AND  s.Salary_range_from > '75000'
AND Jobs.Civil_service_title LIKE'%PROGRAMMER%'
UNION
SELECT JobID, Civil_service_title , Salary_range_from
FROM Jobs NATURAL JOIN Salary as s NATURAL JOIN Requirements
WHERE s.Salary_frequency = 'Annual' 
AND  s.Salary_range_from > '75000'
AND Jobs.Civil_service_title LIKE'%COMPUTER%'

-- Como resultado temos 41 empregos que sem encaixam nos requisitos de titulo e possuem
-- remuneração anual superior a 75000
-- _______________________________________________________________________________________


-- Pesquisa com JUNÇÃO ENTRE 3 (OU MAIS) TABELAS
-- Selecionar 'Agencias' e o 'código de seus empregos' que não contenham restrições de residencia,
-- ou seja, empregos aos quais estrangeiros poderiam se candidatar
SELECT DISTINCT Agency.Agency, Jobs.JobID 
FROM Jobs NATURAL JOIN Agency NATURAL JOIN Requirements
WHERE Requirements.Residency_requirement = ""

-- _______________________________________________________________________________________

-- Pesquisa com AGREGAÇÃO
-- Verificar quais são as localizações que contém maior média salarial anual
SELECT Work_location, AVG(Salary_range_from)
FROM Jobs NATURAL JOIN Salary
WHERE Salary_frequency = 'Annual'
GROUP BY Work_location
ORDER BY avg(Salary_range_from) desc
 
--__________________________________________________________________________________________

-- Pesquisa com AGREGAÇÃO
-- Verificar quais são as categorias de emprego que possui a melhor média salárial
SELECT Job_Category, AVG(Salary_range_from)
FROM Jobs NATURAL JOIN Salary
WHERE Salary_frequency = 'Annual' 
AND Job_Category <> '' 
-- a clausula abaixo exclui todos empregos que possuem TODAS categorias como categoriar
AND Job_Category <> 'Engineering Architecture and Planning Finance Accounting and Procurement Building 
Operations and Maintenance Public Safety Inspections and Enforcement'
GROUP BY Job_Category
ORDER BY avg(Salary_range_from) desc
 
-- _____________________________________________________________________________________________


-- Pesquisa com AGREGAÇÃO
-- Buscar quais empregos possuem o maior número de vagas em aberto
SELECT MAX(Positions), Civil_service_title
FROM Jobs  
GROUP BY Civil_service_title
ORDER BY MAX(Positions) desc

 

