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


