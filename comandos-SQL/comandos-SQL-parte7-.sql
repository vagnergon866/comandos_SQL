-- CRUD NO SQL (INSERT adiciona dados, UPDATE atualiza dados e DELETE remove dados)

-- INSERT
-- adicionar um novo livro na tabela livros
INSERT 
INTO livros (id_livro, nome, edicao, dt_expedicao, qtd_estoque, preco)
VALUE(18, 'Clean Code', 1, '2008-08-01', 250, 120);
-- adicionar uma nova pessoa na tabela pessoas
INSERT
INTO pessoas (id_pessoa, nome, sobrenome, data_nascimento, residencia, funcionario, cpf, telefone)
VALUE(29, 'Wilian', 'Cardoso', '1986-05-05', 'Rua Icaro', 1, 23811938299, 221223992);

-- INSERT com SubConsultas
-- exemplo
-- quero adicionar um livro aonde a data de expedicao seja igual a data de nascimento da pessoa cadastrada com o id 5
INSERT 
INTO livros
VALUES (0, 'Codigo Limpo', 2, (SELECT data_nascimento FROM pessoas WHERE id_pessoa = 5), 230, 125);

-- UPDATE
-- atualizar informacao do livro que possui o id 118
UPDATE livros
SET edicao = 6, qtd_estoque = 385
WHERE id_livro = 118;
-- atualizar da tabela pessoas 
UPDATE pessoas
SET sobrenome = 'Json'
WHERE id_pessoa = 29;

-- DELETE
-- remover um dado da tabela
DELETE 
FROM livros
WHERE id_livro = 18;

-- TRANSACTION
-- voce pode trabalhar na tabela fazendo alteracoes como se fosse em um banco virtual 
-- e so depois voce confirma se realmente quer ralizar as alteracoes
-- em quanto tiver aberta a TRANSACTION ninguem mais tera acesso a tabela ate que voce finalize
BEGIN WORK; -- quando rodar esse comando indica ao banco que esta abrindo uma trasacao
ROLLBACK; -- quando rodar esse comando ele volta as as alteracoes para o estado anterior
COMMIT; -- quando rodar esse comando ele vai realmente fazer as alteracoes

UPDATE livros
SET edicao = 3
WHERE nome = 'Codigo Limpo';

DELETE FROM livros
WHERE nome = 'As Portas de Pedra';

