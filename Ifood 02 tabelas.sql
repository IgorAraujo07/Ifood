-- Tabela de Clientes
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);
-- Tabela de usuários
CREATE TABLE Restaurante (
    restaurante_id INT PRIMARY KEY,
    nome VARCHAR(100),
    tipo_culinaria VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);

CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    restaurante_id INT,
    data_pedido DATE,
    estado_pedido VARCHAR(50),
    valor_total DECIMAL(10, 2)
);

CREATE TABLE ItemPedido (
    item_pedido_id INT PRIMARY KEY,
    pedido_id INT,
    nome_produto VARCHAR(100),
    quantidade INT,
    preco_unitario DECIMAL(10, 2)
);

CREATE TABLE Entregador (
    entregador_id INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    veiculo VARCHAR(50),
    placa_veiculo VARCHAR(20)
);

CREATE TABLE Entrega (
    entrega_id INT PRIMARY KEY,
    pedido_id INT,
    entregador_id INT,
    data_entrega DATE,
    status_entrega VARCHAR(50)
);

CREATE TABLE Pagamento (
    pagamento_id INT PRIMARY KEY,
    pedido_id INT,
    valor_pago DECIMAL(10, 2),
    metodo_pagamento VARCHAR(50),
    status_pagamento VARCHAR(50)
);
