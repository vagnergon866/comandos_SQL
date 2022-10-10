-- REGEXP ou dependendo do Banco de Dados RLIKE (Expressão regular)
-- selecionar todas as colunas da tabela pessoas buscando por nome que contem 'ca' em qualquer parte do nome
SELECT * FROM pessoas WHERE nome REGEXP 'ca';
-- selecionar todas as colunas da tabela pessoas buscando por nome que contem 'ar' em qualquer parte do nome
SELECT * FROM pessoas WHERE nome REGEXP 'ar';
-- selecionar todas as colunas da tabela pessoas buscando por nome que começa com 'ca'
SELECT * FROM pessoas WHERE nome REGEXP '^ca';
-- selecionar todas as colunas da tabela pessoas buscando por sobrenome que inicia com a letra 'c' 
SELECT * FROM pessoas WHERE sobrenome REGEXP '^c';
-- selecionar todas as colunas da tabela pessoas buscando por nome que termine com 'a'
SELECT * FROM pessoas WHERE nome REGEXP 'a$';
-- selecionar todas as colunas da tabela pessoas buscando por sobrenome que termine com 'so'
SELECT * FROM pessoas WHERE sobrenome REGEXP 'so$';
-- existe varias outras possibilidade de filtros usando o REGEXP => LINK DOC https://dev.mysql.com/doc/refman/8.0/en/regexp.html

-- IN 
-- selecionar da tabela livros todos os livros cujo o nome seja 'O nome do vento' ou 'A queda' ou 'Mago e vidro'
SELECT * FROM livros WHERE nome IN ('O nome do vento', 'A queda', 'Mago e vidro');
-- selecionar da tabela livros todos os livros cuja a edicao seja todos os valores pares indo ate o 8
SELECT * FROM livros WHERE edicao IN (2, 4, 6, 8);
-- selecionar da tabela livros todos os livros cuja a edicao seja todos os valores impares indo ate o 8
SELECT * FROM livros WHERE edicao IN (1, 3, 5, 7);
-- selecionar da tabela livros todos os livros que o estoque sejam iguais ha '100' ou '120' ou '200' ou '60'
SELECT * FROM livros WHERE qtd_estoque IN ('100', '120', '200', '60');

-- BETWEEN
-- selecionar da tabela livros todos os livros que a edicao seja de '1' ate '5'
SELECT * FROM livros WHERE edicao BETWEEN 1 AND 5;
-- selecionar da tabela pessoas todas as pessoas cuja a data de nascimento esteja dento de '1988-11-16' ate '1997-04-12' 
SELECT * FROM pessoas WHERE data_nascimento BETWEEN '1988-11-16' AND '1997-04-12'; 
-- selecionar da tabela pessoas todas as pessoas nascidas entre o ano de '1988' e '1995'
SELECT * FROM pessoas WHERE date_format(data_nascimento, '%Y') BETWEEN '1988' AND '1995';
-- selecionar da tabela livros as colunas nome e dt_expedicao filtrando por data de expedicao entre '1990-01' e '2010-06'
SELECT nome, date_format(dt_expedicao, '%Y-%M') 
FROM livros 
WHERE date_format(dt_expedicao, '%Y-%M') 
BETWEEN '1990-01' AND '2010-06';
-- selecionar da tabela pessoas todas as pessoas nascidas entre '1950' e '2010' buscando pelo ano
SELECT * FROM pessoas 
WHERE date_format(data_nascimento, '%Y') BETWEEN '1950' AND '2010'; 

-- AS
-- O comando AS renomeia uma colula eu tabela temporariamente na nossa consulta
-- selecionar da tabela livros dando um apelido de 'l' para a tabela, filtrando por nome que seja igual 'O nome do vento'
SELECT * FROM livros AS l WHERE l.nome = 'O nome do vento';
-- selecionar a tabela livros dando um apelido de 'estoque' para a coluna qtd_estoque 
SELECT id_livro, nome, edicao, dt_expedicao, qtd_estoque AS 'estoque', preco
FROM livros;
-- selecionar da tabela pessoas as colunas nome e data nascimento filtrando so o ano e alterando o nome das colunas
SELECT nome AS 'Nome', date_format(data_nascimento, '%Y') AS 'Ano Nascimento' FROM pessoas;

-- OPERCOES MATEMATICAS EM SQL
-- EXEMPLOS
SELECT 
    nome,
    qtd_estoque,
    preco,
    preco + preco AS '2 * preco',
    round(preco * preco, 2) AS 'preco aredondado',
    qtd_estoque * preco AS 'total',
    round(qtd_estoque * preco, 2) AS 'total arredondado',
    round(preco + preco + 10 * 2, 2) AS 'preco arredondado mais uma constante',
    10 % 2 AS 'resto da divisao 10 por 2',
    11 % 2 AS 'resto da divisao por 2, numeros impares',
    preco % 2 AS 'preco dividido por 2',
    round(preco % 2, 2) AS 'preco dividido por 2 arredondado'
FROM livros;    
-- selecionar da tabela livros o nome a quantidade em estoque e multiplicar por 5 o preco arredondando pra duas casas decimais 
SELECT nome, qtd_estoque , round(preco * 5, 2) AS 'preco * 5', preco FROM livros;  


    
    
    
    
    
    
    
    
    
    
    
    



