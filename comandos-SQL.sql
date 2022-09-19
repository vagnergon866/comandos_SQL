-- buscando todas as colunas da tabela livros
SELECT * FROM livros;

-- buscando as colunas nome e edicao na tabela livros
SELECT nome, edicao FROM livros;

-- buscando as colunas nome, sobrenome e cpf na tabela pessoas
SELECT nome, sobrenome, cpf FROM pessoas;

-- adicionando colunas na busca: terceira coluna com valor 10 e quarta coluna com o texto TRABALHO
SELECT nome, sobrenome, 10, 'TRABALHO' FROM pessoas;

-- buscando todas as edicoes de livbros sem repetir, trasendo somente uma vez cada edicao
SELECT DISTINCT edicao FROM livros; 
SELECT DISTINCT edicao, nome FROM livros;

-- selecionar da tabela pessoas todos os sobrenomes diferentes
SELECT DISTINCT sobrenome FROM pessoas;

-- selecionar sobrenome e nome diferentes da tabela pessoa
SELECT DISTINCT sobrenome, nome FROM pessoas;

-- selecionar somente os quatro ultimos livros da tabela livros
SELECT * FROM livros LIMIT 4;

-- selecionar da tabela pessoas somenta as 10 primeiras, buscando pelas colunas nome e sobenome
SELECT nome, sobrenome FROM pessoas LIMIT 10;

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





