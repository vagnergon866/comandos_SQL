-- CASE
-- nada mais e que o "if else" do sql
SELECT 
    nome,
    qtd_estoque,
    CASE 
    WHEN qtd_estoque >= 200 THEN 'muitos livros'
    WHEN qtd_estoque >= 100 THEN 'boa quantidade'
    ELSE 'repor livros' END AS 'situacao do estoque'
FROM livros;
-- selecionar da tabela pessoas o nome da pessoa, 'sim' se tiver o telefone e 'nao' se nao tiver
-- EXEMPLO 1
SELECT 
    nome,
    telefone,
    CASE
    WHEN telefone != 'null' THEN 'sim'
    ELSE 'nao' END AS 'possue contato'
FROM pessoas;
-- EXEMPLO 2
SELECT 
    nome,
    telefone,
    CASE
    WHEN telefone is null THEN 'nao'
    ELSE 'sim' END AS 'possue contato'
FROM pessoas;   
-- EXEMPLO 3
SELECT 
    nome,
    telefone,
    CASE
    WHEN telefone is not null THEN 'sim'
    ELSE 'nao' END AS 'possue contato'
FROM pessoas;
    
-- COALESCE  
-- funciona da seguinte forma: EXEMPLO: 'se o valor de uma coluna for null quero que troque por 0'
-- selecionar da tabela livros as colunas nome e data de expedicao (minha data de expedicao e null entao quero passar uma data qualquer)    
SELECT nome, COALESCE(dt_expedicao, '0000-00-00') AS 'dt_expedicao' FROM livros;
-- selecionar da tabela pessoas o nome e telefone (se telefone for null quero que retorne o numero 0)
SELECT nome, COALESCE(telefone, 0) AS 'telefone' FROM pessoas;     
    
    