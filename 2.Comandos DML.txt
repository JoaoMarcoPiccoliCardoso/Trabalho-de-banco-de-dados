-- Projeto 1 - E-COMMERCE TRADICIONAL
-- Grupo 3

--comandos DML:

--insere registros na tabela tb_cliente

insert into tb_cliente (nome_completo, nome_usuario, email,	cpf, data_nascimento, endereco_rua,	endereco_numero, endereco_bairro, endereco_cidade, endereco_UF, endereco_complemento) values
('Ana da Silva',	'anasilva',	'anasilva@.com', '54839210754',	'2000-12-25', 'rua 1', 1, 'bairro 1', 'cidade a', 'estado b', 'bl 2'),
('Pedro da Silva', 'pedrosilva', 'pedrosilva@.com', '47659345762', '1991-11-10', 'rua 2', 2, 'bairro 2', 'cidade a', 'estado b', null),
('Mario dos Reis', 'marioreis', 'marioreis@.com', '38659823401', '1997-07-02', 'rua 3', 3, 'bairro 3', 'cidade a', 'estado b', 'bl 4'),
('Jose Vieira',	'josevieira', 'josevieira@.com', '66748809362',	'1980-01-13', 'rua 4', 5, 'bairro 4', 'cidade a', 'estado b','sem numero'),
('Maria Silva',	'mariasilva', 'mariasilva@.com', '88963476231',	'1995-03-22', 'rua 5', 5, 'bairro 5', 'cidade a', 'estado b', null);

--insere registros na tabela tb_funcionario

insert into tb_funcionario (nome, cpf) values
('Joao Silva', '48659236843'),
('Jessica Pereira', '98765432123'),
('Paulo Souza', '12345678901'),
('Guilherme Santos', '98765123458'),
('Marina Rodrigues', '87467295482');

--insere registros na tabela tb_categoria

insert into tb_categoria (nome, descricao) values
('Categoria A', 'Produtos da categoria A'),
('Categoria B', 'Produtos da categoria B'),
('Categoria C', 'Produtos da categoria C'),
('Categoria D', 'Produtos da categoria D'),
('Categoria E', 'Produtos da categoria E');

--insere registros na tabela tb_pedido

insert into tb_pedido (id_cliente, data_pedido) values
(1, '2023-03-24'),
(2, '2023-03-25'),
(2, '2023-03-25'),
(3, '2023-03-26'),
(4, '2023-03-27');

--insere registros na tabela tb_produto

insert into tb_produto (nome, descricao, qtd_estoque, id_categoria, data_fabricacao, valor_unitario, id_funcionario) values
('Produto A', 'Um produto A', 100, 1, '2023-03-23', 50.90, 1),
('Produto B', 'Um produto B', 59, 1, '2023-03-23', 110.00, 1),
('Produto C', 'Um produto C', 500, 2, '2023-03-26', 39.90, 2),
('Produto D', 'Um produto D', 99, 3, '2023-03-27', 250.00, 3),
('Produto E', 'Um produto E', 20, 5, '2023-03-28', 9.99, 5),
('Produto F', 'Um produto F', 0, 4,	'2023-03-28', 25.50, 4);

--insere registros na tabela tb_pedido_produto

insert into tb_pedido_produto (id_pedido, id_produto, qtd) values
(1, 4, 1),
(1, 2, 10),
(2, 5, 2),
(3, 2, 1),
(4, 3, 4),
(5, 5, 18);

-- Executar os comandos abaixo separadamente!

--Atualiza o valor em estoque dos produtos que foram pedidos

UPDATE tb_produto
set qtd_estoque = CASE
WHEN (select SUM(qtd) from tb_pedido_produto where tb_pedido_produto.id_produto = tb_produto.id_produto) is null
THEN qtd_estoque
ELSE qtd_estoque - (select SUM(qtd) from tb_pedido_produto where tb_pedido_produto.id_produto = tb_produto.id_produto)	
END

-- Comando SQL de exclusão de algum registro em uma tabela

DELETE FROM tb_produto WHERE id_produto = 6;



 