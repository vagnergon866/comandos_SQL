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
    
-- GROUP BY
-- selecionar da tabela livros as edicoes distintas (sem que elas retornem repetidas) 
SELECT nome, edicao FROM livros GROUP BY edicao;
-- selecionar da tabela pessoas agrupando pelo sobrenome 
SELECT nome, sobrenome FROM pessoas GROUP BY sobrenome;

-- MIN, MAX E AVG
-- selecionar da tabela livros o livro com o menor valor
SELECT nome, qtd_estoque, min(preco) AS 'menor valor' FROM livros;
-- selecionar da tabela livros o livros com o maior valor
SELECT nome, qtd_estoque, max(preco) AS 'maior valor' FROM livros;
-- selecionar da tabela livros fazendo uma media de valores e trazer o intermediario
SELECT nome, qtd_estoque, avg(preco) AS 'valor medio' FROM livros;

-- GROUP BY com MIN, MAX e AVG 
-- selecionar a tabela livros acrupando edicao com o maior valor
SELECT nome, edicao, max(preco) AS 'preco' FROM livros GROUP BY edicao; 
-- selecionar a tabela livros acrupando edicao com o menor valor
SELECT nome, edicao, min(preco) AS 'preco' FROM livros GROUP BY edicao; 
-- selecionar a tabela livros acrupando edicao com a media do valor agrupado
SELECT nome, edicao, avg(preco) AS 'preco' FROM livros GROUP BY edicao; 
-- valor minimo, valor maximo e media de precos 
SELECT nome, edicao, preco,
    min(preco) AS 'valor minimo',
    max(preco) AS 'valor maximo',
    avg(preco) AS 'media de preco' 
FROM livros GROUP BY edicao;
-- selecionar da tabela pedidos os pedidos de uma pessoa para saber o minimo o maximo e a media que ela ja comprou na loja
SELECT id_pessoa,
    min(qtd_pedida) AS 'quantidade minima pedida',
    max(qtd_pedida) AS 'quantidade maxima pedida',
    avg(qtd_pedida) AS 'media pedida' 
FROM pedidos GROUP BY id_pessoa; 

-- GROUP BY com SUM, COUNT e HAVING
-- verificar da tabela livros quantos livros de cada edicao eu tenho e somar a quantidade de livros em estoque
SELECT edicao,
    count(nome) AS 'quantos livros tenho',
    sum(qtd_estoque) AS 'quantidade total por edicao'
FROM livros GROUP BY edicao;
-- verificar da tabela pedidos quantos pedidos tive de um livro e quantos foram vendidos
SELECT id_livro,
    count(qtd_pedida) AS 'quantidade de pedidos',
    sum(qtd_pedida) AS 'quantidade de vendas'
FROM pedidos GROUP BY id_livro;
-- selecionar da tabela livros o nome do livro a edicao e verificar a quantidade de livros pra cada edicao
SELECT nome, edicao,
    count(preco) AS qtd_livros 
FROM livros GROUP BY edicao
HAVING qtd_livros >= 1;
-- verificar da tabela pedidos quantas vendas foram realizadas de cada livro e filtrar as linhas com mais de uma venda
SELECT id_livro, 
    count(id_livro) AS qtd_livros 
FROM pedidos GROUP BY qtd_pedida
HAVING qtd_livros >= 2;

