-- Projeto 1 - E-COMMERCE TRADICIONAL
-- Grupo 3

-- comandos DQL:

-- SQL usando INNER JOIN (lista os produtos e por qual funcionário eles foram registrados)

SELECT tp.nome, tf.nome 
from tb_funcionario tf 
inner join tb_produto tp 
on tp.id_funcionario = tf.id_funcionario

-- SQL usando INNER JOIN (retorna informaçoes dos produtos pedidos)

SELECT ped.id_pedido, ped.data_pedido, prod.nome, tpp.qtd, prod.valor_unitario
FROM tb_pedido ped
INNER JOIN tb_pedido_produto tpp on ped.id_pedido = tpp.id_pedido
INNER JOIN tb_produto prod on prod.id_produto = tpp.id_produto;

--SQL usando RIGHT JOIN (retorna informaçoes dos produtos pedidos, incluindo os produtos não pedidos(sem correspondencia na tabela pedido_produto)

SELECT ped.id_pedido, ped.data_pedido, prod.nome, tpp.qtd, prod.valor_unitario
FROM tb_pedido ped
right JOIN tb_pedido_produto tpp on ped.id_pedido = tpp.id_pedido
right JOIN tb_produto prod on prod.id_produto = tpp.id_produto;

--Usando count() e group by()

SELECT tc.nome, COUNT(*) 
from tb_produto tp, tb_categoria tc
WHERE tp.id_categoria = tc.id_categoria
GROUP BY tc.id_categoria;

--Consulta Livre

SELECT *
from tb_produto

-- SQL para construção de nota fiscal do pedido numero 1

select tp.id_pedido as Pedido,
tp.data_pedido as Data,
tc.nome_completo as Cliente,
tc.cpf as CPF,
tprod.nome as Produto,
tpp.qtd as Qtd,
tprod.valor_unitario as V_Unitario,
tpp.qtd*tprod.valor_unitario as V_Total,
tc.email as Email,
tc.endereco_rua ||', n. '|| tc.endereco_numero ||', '|| tc.endereco_bairro ||', '|| tc.endereco_cidade ||', '|| tc.endereco_UF  as Endereco
from tb_pedido as tp
join tb_cliente as tc on tc.id_cliente = tp.id_cliente
join tb_pedido_produto as tpp on tpp.id_pedido = tp.id_pedido
join tb_produto as tprod on tprod.id_produto = tpp.id_produto
where tpp.id_pedido = 1;