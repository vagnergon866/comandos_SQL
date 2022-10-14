-- SELECT NULL
-- selecionar todas as colunas da tabela livros filtrando por edicao null
SELECT * FROM livros WHERE edicao IS NULL;
-- selecionar da tabela pessoas todas as pessoas cuju o telefone seja null
SELECT * FROM pessoas WHERE telefone IS NULL;

-- AND
-- selecionar da tabela pessoas todas as colunas e filtar por id_pessoa >= 5 e funcionario seja igual a 1
SELECT * 
FROM pessoas 
WHERE id_pessoa >= 5
AND funcionario = 1;
-- selecionar da tabela livros que a edicao seja >= 2 e a quantidade em estoque ea quantidade em estoque seja < que 100
SELECT * FROM livros 
WHERE edicao >= 2 AND qtd_estoque < 100;

-- OR 
-- selecionar da tabela pessoas todas as pessoas que o id seja >= 12 ou que pessoa possua a culuna funcionario = 1
SELECT * FROM pessoas 
WHERE id_pessoa >= 12 OR funcionario = 1; 
-- selecionar da tabela de livros todos os livros que a edicao seja = 5 ou a quantidade em estoque seja > que 100 
SELECT * FROM livros 
WHERE edicao = 5 OR qtd_estoque > 100;

-- NOT 
-- selecionar as colunas nome e qtd_estoque da tabela livros onde quantidade < 100 
SELECT nome, qtd_estoque FROM livros
WHERE qtd_estoque < 100;
-- o NOT altera a logica, se estou pedindo livros com quantidade menores que 100 e adicionar o NOT antes ele
-- muda a logica e me traz os maiores que 100 : exemplo
SELECT nome, qtd_estoque FROM livros
WHERE NOT qtd_estoque < 100;
-- podemos usar parentezes para mostrar o que estamos negando: exemplo
SELECT nome, qtd_estoque FROM livros
WHERE NOT (qtd_estoque < 100);  
-- selecionar da tabela pedidos aonde a qtd_pedida pedida for < 5 
SELECT * FROM pedidos WHERE qtd_pedida < 5;
-- e agora >= 5
SELECT * FROM pedidos WHERE NOT (qtd_pedida < 5);

-- DESAFIOS 
-- selecionar da tabela livros que a qtd_estoque seja maior que 100 e a edicao seja 1 ou 4
SELECT * 
FROM livros 
WHERE qtd_estoque > 100 
AND (edicao = 1 OR edicao = 4);
-- selecionar da tabela livros os livros que a edicao nao seja menor ou igual a 5 ou a quantidade em estoque nao seja maior que 100
SELECT *
FROM livros
WHERE NOT (edicao <= 5 AND qtd_estoque > 100);
-- selecionar da tabela livros todos os livros que a quantidade de estoque nao seja >= 100 e data de espedicao seja maior que 2015
SELECT * 
FROM livros 
WHERE NOT (qtd_estoque >= 100 OR date_format(dt_expedicao, '%Y') > 2015);

-- LIKE
-- Digamos que temos que fazer uma busca de todos os nomes que começam com "ca" entao 
-- usamos o LIKE  e passamos o 'ca%' com isso estamos dizendo que queremos todos os nomes que comecem com 'ca' mais nao 
-- nos emportampos com o que vem depois. Exemplos:
SELECT * FROM livros WHERE nome LIKE 'O nome %';
SELECT * FROM livros WHERE nome LIKE '% vento';
SELECT * FROM livros WHERE nome LIKE 'O%ger';
SELECT * FROM livros WHERE nome LIKE 'O%nome%vento';
-- selecionar todos os livros que contem 'arry'
SELECT * FROM livros WHERE nome LIKE '%arry %';
-- selecionar todos os livros que terminem com a palavra 'silencio'
SELECT * FROM livros WHERE nome LIKE '% silencio';
-- usando o % ele me traz na consulta a quantidade de caracteres existentes sem limites, agora se eu usar um _ ele me traz um 
-- caractere para cada _ que eu usar por exemplo:
-- selecionar da tabela livros os livros que comecem com um caracter e depois nao me importa o que vem
SELECT * FROM livros WHERE nome LIKE '_ %'; -- um exemplo de nome que esse comando traz é 'O Temor do Sabio' e 'A lenda'
-- selecionar da tabela livros todos os livros que comecem com tres caracteres e depois disso nao importa o que vem
SELECT * FROM livros WHERE nome LIKE '___ %';

