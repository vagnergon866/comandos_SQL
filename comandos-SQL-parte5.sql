-- SubQuerys (SubConsultas)
-- selecionar todos os livros que em algum momento foram comprados
SELECT * FROM livros AS liv
WHERE liv.id_livro IN (SELECT ped.id_livro FROM pedidos AS ped);
-- selecionar da tabela pessoas todas as pessoas que em algum momento realizaram alguma compra
SELECT * FROM pessoas AS pes
WHERE pes.id_pessoa IN (SELECT ped.id_pessoa FROM pedidos AS ped);

-- SubQuerys (SubConsultas em um filtro com uma lista)
-- selecionar da tabela todos os livros que foram vendidos metade ou mais da quantidade em estoque
SELECT * FROM livros AS liv
WHERE liv.id_livro 
IN (SELECT ped.id_livro FROM pedidos AS ped WHERE ped.qtd_pedida >= liv.qtd_estoque/2);
-- selecionar da tabela pedidos todoas os pedidos que foram feitos por funcionarios da loja de livros
-- funcionarios sao = 1
SELECT * FROM pedidos AS ped
WHERE ped.id_pessoa 
IN (SELECT pes.id_pessoa FROM pessoas As pes WHERE pes.funcionario = 1);

-- SubQuerys (SubConsultas com uma coluna)
-- selecionar da tabela livros a quantidade de livros caros e a quantidade de livros baratos
SELECT 
    nome,
    (SELECT count(id_livro) FROM livros WHERE preco >= 50) AS 'quantidade livros caros',
    (SELECT count(id_livro) FROM livros WHERE preco < 50) AS 'quantidade livros baratos'
FROM livros;    
-- selecionar da tabela pessoas o nome e sobrenome e criar mais duas SubConsultas 
-- primeira coluna 'quantidade de funcionarios'
-- segunda coluna 'quantidade de clientes'
SELECT 
    nome, sobrenome,
    (SELECT count(id_pessoa) FROM pessoas WHERE funcionario = 1) AS 'quantidade de funcionarios',
    (SELECT count(id_pessoa) FROM pessoas WHERE funcionario != 1) AS 'quantidade de clientes'
FROM pessoas;

-- SubTabela (criando uma tabela de consulta)
-- selecionar de uma tabela resultante de uma subConsulta todas as colunas e linhas dessa tabela
-- multiplicando quantidade em estoque pelo preco 
SELECT nome, round(total, 2) AS valorTotal 
FROM (SELECT nome, qtd_estoque * preco AS total FROM livros) AS t1;
-- selecionar da tabela de pessoas o nome, sobrenome e telefone utilizando uma subConsulta como a nossa tabela fonte
SELECT nome, sobrenome, tel 
FROM (SELECT nome, sobrenome, telefone AS tel FROM pessoas) AS pes;

-- SubConsultas com EXISTS 
-- (EXISTS = se for null retorna false, se for != null retorna true)
-- selecionar da tabela livros todos os livros que exista ao menos um pedido
SELECT * 
FROM livros liv 
WHERE EXISTS(SELECT ped.id_livro FROM pedidos ped 
WHERE ped.id_livro = liv.id_livro);
-- selecionar da tabela livros todos os livros que exista ao menos um pedido mais agora filtrando por nome do livro tambem 'O pistoleiro'
SELECT * 
FROM livros liv 
WHERE EXISTS(SELECT ped.id_livro FROM pedidos ped 
WHERE ped.id_livro = liv.id_livro 
AND liv.nome = 'O pistoleiro');
-- selecionar da tabela livros todos os livros que tenha no minimo 5 pedidos
SELECT *
FROM livros liv 
WHERE EXISTS(SELECT ped.id_livro FROM pedidos ped 
WHERE ped.id_livro = liv.id_livro 
AND ped.qtd_pedida >= 5);
-- selecionar todas as pessoas que ja fizeram pelo menos um pedido
SELECT * 
FROM pessoas pes
WHERE EXISTS(SELECT ped.id_pessoa FROM pedidos ped 
WHERE ped.id_pessoa = pes.id_pessoa);
-- selecionar todas as pessoas que sao funcionarios e ja fizeram algum pedido
SELECT * 
FROM pessoas pes
WHERE EXISTS(SELECT ped.id_pessoa FROM pedidos ped 
WHERE ped.id_pessoa = pes.id_pessoa 
AND pes.funcionario = 1);




