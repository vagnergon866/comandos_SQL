-- LEFT JOIN
-- selecionar todas as colunas da tabela livros e todas as colunas da tabela pedido 
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

