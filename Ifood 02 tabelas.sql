-- Tabela Usuario
CREATE TABLE usuario (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nome VARCHAR(60),
    email VARCHAR(60) UNIQUE,
    senha VARCHAR(60),
    telefone VARCHAR(20),
    cpf VARCHAR(11) UNIQUE
);

-- Tabela Restaurante
CREATE TABLE restaurante (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nome VARCHAR(60),
    descricao VARCHAR(255),
    telefone VARCHAR(20),
    avaliacao FLOAT,
    cnpj VARCHAR(14) UNIQUE
);

-- Tabela Categoria_Estabelecimento
CREATE TABLE categoria_estabelecimento (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nome VARCHAR(60),
    descricao VARCHAR(255)
);

-- Tabela Endereco
CREATE TABLE endereco (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    rua VARCHAR(60),
    bairro VARCHAR(60),
    cidade VARCHAR(60),
    cep VARCHAR(10),
    numero VARCHAR(10),
    complemento VARCHAR(100),
    padrao INT,
    ID_usuario INT,
    ID_restaurante INT,
    CONSTRAINT FK_usuario FOREIGN KEY (ID_usuario) REFERENCES usuario(ID),
    CONSTRAINT FK_restaurante FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID)
);

-- Tabela Categoria_Produto
CREATE TABLE categoria_produto (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nome VARCHAR(60),
    descricao VARCHAR(255)
);

-- Tabela Produto
CREATE TABLE produto (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nome VARCHAR(60),
    preco DECIMAL(10, 2),
    descricao VARCHAR(255),
    categoria_produto_ID INT,
    restaurante_ID INT,
    CONSTRAINT FK_categoria_produto FOREIGN KEY (categoria_produto_ID) REFERENCES categoria_produto(ID),
    CONSTRAINT FK_restaurante_produto FOREIGN KEY (restaurante_ID) REFERENCES restaurante(ID)
);

-- Tabela Adicional
CREATE TABLE adicional (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nome VARCHAR(60),
    valor DECIMAL(10, 2),
    descricao VARCHAR(255)
);

-- Tabela Pedido
CREATE TABLE pedido (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    taxaEntrega DECIMAL(10, 2),
    valorTotal DECIMAL(10, 2),
    descricao VARCHAR(255),
    is_retirada INT,
    endereco_ID INT,
    usuario_ID INT,
    restaurante_ID INT,
    cupom_ID INT,
    status_pedido_ID INT,
    CONSTRAINT FK_endereco FOREIGN KEY (endereco_ID) REFERENCES endereco(ID),
    CONSTRAINT FK_usuario_pedido FOREIGN KEY (usuario_ID) REFERENCES usuario(ID),
    CONSTRAINT FK_restaurante_pedido FOREIGN KEY (restaurante_ID) REFERENCES restaurante(ID),
    CONSTRAINT FK_cupom FOREIGN KEY (cupom_ID) REFERENCES cupom(ID),
    CONSTRAINT FK_status_pedido FOREIGN KEY (status_pedido_ID) REFERENCES status_pedido(ID)
);

-- Tabela Status_Pedido
CREATE TABLE status_pedido (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nome VARCHAR(60),
    descricao VARCHAR(255)
);

-- Tabela Historico_Pedido
CREATE TABLE historico_pedido (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    pedido_ID INT,
    status_pedido_ID INT,
    CONSTRAINT FK_pedido_historico FOREIGN KEY (pedido_ID) REFERENCES pedido(ID),
    CONSTRAINT FK_status_pedido_historico FOREIGN KEY (status_pedido_ID) REFERENCES status_pedido(ID)
);

-- Tabela Cupom
CREATE TABLE cupom (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    codigo VARCHAR(15) NOT NULL,
    valor DECIMAL(10, 2),
    descricao VARCHAR(255),
    validade TIMESTAMP NOT NULL
);

-- Tabela Adicional_Produto_Pedido
CREATE TABLE adicional_produto_pedido (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    quantidade INT,
    pedido_produto_ID INT,
    adicional_ID INT,
    CONSTRAINT FK_pedido_produto FOREIGN KEY (pedido_produto_ID) REFERENCES pedido_produto(ID),
    CONSTRAINT FK_adicional FOREIGN KEY (adicional_ID) REFERENCES adicional(ID)
);

-- Tabela Avaliacao
CREATE TABLE avaliacao (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nota_restaurante INT,
    nota_pedido INT,
    descricao VARCHAR(255),
    pedido_ID INT,
    CONSTRAINT FK_pedido_avaliacao FOREIGN KEY (pedido_ID) REFERENCES pedido(ID)
);

-- Tabela Metodo_Pagamento
CREATE TABLE metodo_pagamento (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nome VARCHAR(60),
    descricao VARCHAR(255)
);

-- Tabela Status_Pagamento
CREATE TABLE status_pagamento (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    nome VARCHAR(60),
    descricao VARCHAR(255)
);

-- Tabela Pagamento
CREATE TABLE pagamento (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    valor DECIMAL(10, 2) NOT NULL,
    pedido_ID INT,
    metodo_pagamento_ID INT,
    status_pagamento_ID INT,
    CONSTRAINT FK_pedido_pagamento FOREIGN KEY (pedido_ID) REFERENCES pedido(ID),
    CONSTRAINT FK_metodo_pagamento FOREIGN KEY (metodo_pagamento_ID) REFERENCES metodo_pagamento(ID),
    CONSTRAINT FK_status_pagamento FOREIGN KEY (status_pagamento_ID) REFERENCES status_pagamento(ID)
);

-- Tabela Favoritos
CREATE TABLE favoritos (
    ID_usuario INT,
    ID_restaurante INT,
    CONSTRAINT FK_usuario_favoritos FOREIGN KEY (ID_usuario) REFERENCES usuario(ID),
    CONSTRAINT FK_restaurante_favoritos FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID),
    PRIMARY KEY (ID_usuario, ID_restaurante)
);

-- Tabela Pedido_Produto
CREATE TABLE pedido_produto (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    pedido_ID INT,
    produto_ID INT,
    CONSTRAINT FK_pedido_produto FOREIGN KEY (pedido_ID) REFERENCES pedido(ID),
    CONSTRAINT FK_produto_pedido FOREIGN KEY (produto_ID) REFERENCES produto(ID)
);

-- Tabela Funcionamento_Restaurante
CREATE TABLE funcionamento_restaurante (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    criarData TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status INT,
    dia INT,
    hora_abrir TIME,
    hora_fechar TIME,
    restaurante_ID INT,
    CONSTRAINT FK_restaurante_funcionamento FOREIGN KEY (restaurante_ID) REFERENCES restaurante(ID)
);

-- Tabela Adicionar_Produto
CREATE TABLE adicionar_produto (
    produto_ID INT,
    adicional_ID INT,
    CONSTRAINT FK_produto_adicional FOREIGN KEY (produto_ID) REFERENCES produto(ID),
    CONSTRAINT FK_adicional_produto FOREIGN KEY (adicional_ID) REFERENCES adicional(ID),
    PRIMARY KEY (produto_ID, adicional_ID)
);

-- Inserir dados na tabela usuario
INSERT INTO usuario (status, nome, email, senha, telefone, cpf)
VALUES (1, 'João Silva', 'joao@example.com', 'senha123', '123456789', '12345678901');

-- Inserir dados na tabela restaurante
INSERT INTO restaurante (status, nome, descricao, telefone, avaliacao, cnpj)
VALUES (1, 'Restaurante ABC', 'Restaurante especializado em culinária internacional.', '987654321', 4.5, '12345678901234');

-- Inserir dados na tabela categoria_estabelecimento
INSERT INTO categoria_estabelecimento (status, nome, descricao)
VALUES (1, 'Restaurante', 'Categoria para estabelecimentos de restaurante');

-- Inserir dados na tabela endereco
INSERT INTO endereco (status, rua, bairro, cidade, cep, numero, complemento, padrao, ID_usuario, ID_restaurante)
VALUES (1, 'Rua A', 'Centro', 'Cidade A', '12345678', '123', 'Apartamento 101', 1, 1, 1);

-- Inserir dados na tabela categoria_produto
INSERT INTO categoria_produto (status, nome, descricao)
VALUES (1, 'Pizza', 'Categoria de produtos relacionados a pizza');

-- Inserir dados na tabela produto
INSERT INTO produto (status, nome, preco, descricao, categoria_produto_ID, restaurante_ID)
VALUES (1, 'Pizza Margherita', 25.00, 'Pizza clássica com molho de tomate, muçarela e manjericão fresco.', 1, 1);

-- Inserir dados na tabela adicional
INSERT INTO adicional (status, nome, valor, descricao)
VALUES (1, 'Borda recheada', 5.00, 'Borda da pizza recheada com queijo cheddar');

-- Inserir dados na tabela status_pedido
INSERT INTO status_pedido (status, nome, descricao)
VALUES (1, 'Pendente', 'Pedido aguardando confirmação');

-- Inserir dados na tabela cupom
INSERT INTO cupom (status, codigo, valor, descricao, validade)
VALUES (1, 'DESC10', 10.00, 'Cupom de desconto de 10%', DATE_ADD(NOW(), INTERVAL 7 DAY));

-- Inserir dados na tabela pedido
INSERT INTO pedido (status, taxaEntrega, valorTotal, descricao, is_retirada, endereco_ID, usuario_ID, restaurante_ID, cupom_ID, status_pedido_ID)
VALUES (1, 3.00, 30.00, 'Pedido de uma pizza margherita com borda recheada', 0, 1, 1, 1, 1, 1);

-- Inserir dados na tabela adicionar_produto
INSERT INTO adicionar_produto (produto_ID, adicional_ID)
VALUES (1, 1);

-- Inserir dados na tabela pedido_produto
INSERT INTO pedido_produto (status, pedido_ID, produto_ID)
VALUES (1, 1, 1);

-- Inserir dados na tabela adicional_produto_pedido
INSERT INTO adicional_produto_pedido (status, quantidade, pedido_produto_ID, adicional_ID)
VALUES (1, 1, 1, 1);

-- Inserir dados na tabela historico_pedido
INSERT INTO historico_pedido (status, pedido_ID, status_pedido_ID)
VALUES (1, 1, 
