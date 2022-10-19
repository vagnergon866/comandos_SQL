-- LEFT JOIN
-- selecionar todas as colunas da tabela livros e todas as colunas da tabela pedido 
-- nesse caso estou olhando para tabela de livros e trazendo os pedidos dos livros
SELECT liv.*, ped.*
FROM livros liv
LEFT JOIN pedidos ped 
ON ped.id_livro = liv.id_livro;
-- verificar das tabelas livros e pedidos somente os livros que nao tenham nenhum pedido
SELECT liv.*, ped.*
FROM livros liv
LEFT JOIN pedidos ped
ON liv.id_livro = ped.id_livro
WHERE ped.id_pedidos IS NULL;
-- selecionar da tabela de pessoas o nome e sobrenome e junto o numero de pedidos de cada pessoa
SELECT pes.nome, pes.sobrenome, ped.num_pedido, ped.id_livro
FROM pessoas pes
LEFT JOIN pedidos ped
ON pes.id_pessoa = ped.id_pessoa
WHERE ped.id_pedidos IS NOT NULL;

-- RIGHT JOIN
-- no caso do RIGHT ele passa estamos disendo que a tabela principal esta na esquerda do JOIN
-- entao primeiro estou olhando para tabela de pedidos e trazendo os livros dos pedidos
SELECT liv.*, ped.*
FROM livros liv
RIGHT JOIN pedidos ped 
ON ped.id_livro = liv.id_livro;
-- selecionar nome, sobrenome e telefone da tabela pessoas e 
-- selecionar da tabela pedido o numero do pedido o id do livro 
-- partindo da tabela pedidos todas as pessoas que fizeram algum pedido
SELECT pes.nome, pes.sobrenome, pes.telefone, ped.num_pedido, ped.id_livro
FROM pessoas pes
RIGHT JOIN pedidos ped
ON ped.id_pessoa = pes.id_pessoa;

-- INNER JOIN 
-- ele comprara duas tabelas e traz resultados que existem em abas as tabelas
-- peciso verificar qual pessoal fez o pedido cujo o id do pedido seja 13
SELECT ped.id_pedidos, pes.nome, pes.sobrenome, pes.telefone
FROM pessoas pes
INNER JOIN pedidos ped 
ON pes.id_pessoa = ped.id_pessoa -- pes.id_pessoa = primary key da tabela pessoas | ped.id_pessoa = foreign key da tabela pedidos
WHERE ped.id_pedidos = 13;
-- verificar o numero do pedido de cada pessoas ja fez buscando por nome e sobrenome e numero de pedidos
SELECT pes.nome, pes.sobrenome, ped.num_pedido
FROM pessoas pes 
INNER JOIN pedidos ped
ON pes.id_pessoa = ped.id_pessoa;

-- fazendo um JOIN de uma tabela com ela mesma - conceito "SELF JOIN"
-- verificar da tabela pessoas todas as pessoas que moram no mesmo endereco
SELECT pes.nome, pes2.nome, pes2.residencia
FROM pessoas pes
INNER JOIN pessoas pes2
ON pes.id_pessoa <> pes2.id_pessoa -- o id deve ser diferente (<> ou !=)
WHERE pes.residencia = pes2.residencia;

-- UNION
-- unir duas consultas em apenas uma (as duas consultas devem ter as mesmas colunas)
SELECT nome, dt_expedicao FROM livros WHERE qtd_estoque < 50
UNION
SELECT nome, dt_expedicao FROM livros WHERE qtd_estoque > 50;
-- exemplo com LEFT JOIN e RIGHT JOIN olhando para os dois lados da consulta
SELECT 
	liv.nome,
    liv.dt_expedicao,
    ped.num_pedido,
    ped.id_pessoa
FROM livros liv
LEFT JOIN pedidos ped 
ON ped.id_livro = liv.id_livro
UNION
SELECT 
	liv.nome,
    liv.dt_expedicao,
    ped.num_pedido,
    ped.id_pessoa
FROM livros liv
RIGHT JOIN pedidos ped 
ON ped.id_livro = liv.id_livro;

