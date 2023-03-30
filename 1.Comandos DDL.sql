-- Projeto 1 - E-COMMERCE TRADICIONAL
-- Grupo 3

-- comandos DDL:

--cria tabela tb_categoria:

create table tb_categoria (
	id_categoria integer primary key autoincrement,
	nome text unique not null,
	descricao text		
);

--cria tabela tb_funcionario:

create table tb_funcionario (
	id_funcionario integer primary key autoincrement,
	nome text not null,
	cpf text unique not null
);

--cria tabela tb_cliente:

create table tb_cliente (
	id_cliente integer primary key autoincrement,
	nome_completo text not null,
	nome_usuario text unique not null,
	email text unique not null,
	cpf text unique not null,
	data_nascimento date not null,
	endereco_rua text not null,
	endereco_numero integer,
	endereco_bairro text not null,
	endereco_cidade text not null,
	endereco_UF text not null,
	endereco_complemento text
);

--cria tabela tb_pedido:

create table tb_pedido(
	id_pedido integer primary key autoincrement,
	id_cliente integer not null,
	data_pedido date not null,
	foreign key (id_cliente) references tb_cliente(id_cliente)
);

--cria tabela tb_produto:

create table tb_produto(
	id_produto integer primary key autoincrement,
	nome text unique not null,
	descricao text not null,
	qtd_estoque integer not null,
	id_categoria integer not null,
	data_fabricacao date not null,
	valor_unitario real not null,
	id_funcionario integer not null,
	foreign key (id_categoria) references tb_categoria(id_categoria),
	foreign key (id_funcionario) references tb_funcionario(id_funcionario),
	check (valor_unitario>0)	
);

--cria tabela tb_pedido_produto:

create table tb_pedido_produto (
	id integer primary key autoincrement,
	id_pedido integer not null,
	id_produto integer not null,
	qtd integer not null,
	foreign key (id_pedido) references tb_pedido(id_pedido),
	foreign key (id_produto) references tb_produto(id_produto),
	check (qtd>0)	
);