-- SELECT
-- buscando todas as colunas da tabela livros
SELECT * FROM livros;
-- buscando as colunas nome e edicao na tabela livros
SELECT nome, edicao FROM livros;
-- buscando as colunas nome, sobrenome e cpf na tabela pessoas
SELECT nome, sobrenome, cpf FROM pessoas;
-- adicionando colunas na busca: terceira coluna com valor 10 e quarta coluna com o texto TRABALHO
SELECT nome, sobrenome, 10, 'TRABALHO' FROM pessoas;

-- DISTINCT
-- buscando todas as edicoes de livbros sem repetir, trasendo somente uma vez cada edicao
SELECT DISTINCT edicao FROM livros; 
SELECT DISTINCT edicao, nome FROM livros;
-- selecionar da tabela pessoas todos os sobrenomes diferentes
SELECT DISTINCT sobrenome FROM pessoas;
-- selecionar sobrenome e nome diferentes da tabela pessoa
SELECT DISTINCT sobrenome, nome FROM pessoas;

-- LIMIT
-- selecionar somente os quatro ultimos livros da tabela livros
SELECT * FROM livros LIMIT 4;
-- selecionar da tabela pessoas somenta as 10 primeiras, buscando pelas colunas nome e sobenome
SELECT nome, sobrenome FROM pessoas LIMIT 10;

-- ORDER BY
-- exemplos de como fazer um busca em ordem crescente usando o "order by" ASC , e DESC para decrescente
-- para fazer uma busca em ordem crescente nao é obrigatorio usar o ASC mais ja para uma busca decrescente é obrigatorio o DESC
SELECT nome, edicao FROM livros ORDER BY nome;
SELECT nome, edicao FROM livros ORDER BY edicao;  
SELECT nome, edicao FROM livros ORDER BY edicao DESC; 
-- nesse exemplo eu quero que busque a coluna edicao em ordem crescente e o nome em decrescente 
-- entao a cada grupo de valor da edicao ele vai ordenar a coluna nome
SELECT nome, edicao FROM livros ORDER BY edicao ASC, nome DESC;
-- primeiro ordene por nome e depois por edicao, poderia ser "edicao, nome" ai primeiro ondenaria por edicao e depois por nome
SELECT nome, edicao FROM livros ORDER BY nome, edicao; 
SELECT nome, edicao FROM livros ORDER BY edicao, nome; 
-- passando o 2 estou dizendo que quero que me retorne ordenado por edicao que é minha segunda coluna, se fosse por nome poderia usar o 1 tambem
SELECT nome, edicao FROM livros ORDER BY 2; 
SELECT nome, edicao FROM livros ORDER BY 1; 
SELECT nome, edicao FROM livros ORDER BY 1, 2; 
-- selecionar da tabela pessoa as colunas nome e sobrenome ordenando por nome
SELECT nome, sobrenome FROM pessoas ORDER BY nome;
-- selecionar da tabela pessoa as colunas sobrenome e nome ordenando por sobrenome
SELECT sobrenome, nome FROM pessoas ORDER BY sobrenome;
-- selecionar da tabela pessoa as colunas sobrenome e nome ordenando por nome DESC 
SELECT sobrenome, nome FROM pessoas ORDER BY nome DESC;
-- selecionar da tebela pessoas nome, sobrenome e cpf ordenado por nome em oredem crescente e cpf em ordem decrescente
SELECT nome, sobrenome, cpf FROM pessoas ORDER BY nome, cpf DESC;

-- WHERE
-- selecionar as colunas nome e edicao da tabela livros, filtrando por edicao com valor 1
SELECT nome, edicao FROM livros
WHERE edicao = 1;
-- selecionar as colunas nome e preco da tabela livros dos que possuem edicao com valor 1
SELECT nome, preco FROM livros 
WHERE edicao = 1;
-- selecionar nome, edicao e preco da tabela livros filtrando por nome 'Harry Potter e o cálice de fogo'
SELECT nome, edicao, preco FROM livros 
WHERE nome = 'Harry Potter e o cálice de fogo';
-- selecionar as colunas nome e edicao da tabela livros dos que possuem edicao >= 5
SELECT nome, edicao FROM livros 
WHERE edicao >= 5;
-- selecionar da tabela pessoas a coluna nome aonde o nome seja igual a 'Miguel'
SELECT nome, sobrenome FROM pessoas 
WHERE nome = 'Miguel';

-- CASOS EXPECIAIS
-- selecionar todas as colunas da tabela livros filtrando por por valor
SELECT * FROM livros 
WHERE round(preco, 2) = 40.34;
-- seleciona todas as colunas da tabela livros filtrando por data
SELECT * FROM livros 
WHERE dt_expedicao = '2011-11-20';
-- maior que a data
SELECT * FROM livros 
WHERE dt_expedicao > '2011-11-20';
-- buscando so pelo ano 
SELECT * FROM livros 
WHERE date_format(dt_expedicao, '%Y') = 2011; 
-- mais opçoes para buscas usando o date_format() no README

