-- Tabela Clientes
CREATE TABLE usuario (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
nome VARCHAR(60),
email VARCHAR(60)UNIQUE,
senha VARCHAR(60),
telefone VARCHAR(20),
cpf VARCHAR(11)UNIQUE
);

CREATE TABLE restaurante(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
nome VARCHAR(60), 
descricao VARCHAR(60),
telefone VARCHAR(20),
avaliacao FLOAT,
cnpj VARCHAR(30)
);

CREATE TABLE categoria_estabelecimeto(
ID  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE endereco(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
rua VARCHAR(60),
bairro VARCHAR(60),
cidade VARCHAR(60),
cep VARCHAR(20),
numero VARCHAR(10),
complemento VARCHAR(100),
padrao INT
);

CREATE TABLE produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
nome VARCHAR(60),
preco INT,
descricao VARCHAR(60)
);

CREATE TABLE categoria_produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE adicional(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
nome VARCHAR(60),
valor INT,
descricao VARCHAR(60)
);

CREATE TABLE pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
taxaEntrega INT,
valorTotal INT,
descricao VARCHAR(60)
is_retirada INT
);

CREATE TABLE status_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE historico_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT
);

CREATE TABLE cupom(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
codigo VARCHAR(15) NOT NULL,
valor INT,
descriao VARCHAR(60),
validade INT NOT NULL
);

CREATE TABLE adicional_produto_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora  INT,
status INT,
quantidade INT
);

CREATE TABLE avaliacao(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
nota_restaurante INT,
nota_pedido INT,
descricao VARCHAR(60)
);

CREATE TABLE pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
valor INT NOT NULL,
data_hora INT
);

CREATE TABLE metado_pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData  INT,
dataHora INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE status_pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE favoritos(
ID_usuario INT,
ID_restaurante INT
);

CREATE TABLE pedido_produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT
);

CREATE TABLE funcionamento_restaurante(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
criarData INT,
dataHora INT,
status INT,
dia INT,
hora_abrir INT,
hora_fechar INT
);

CREATE TABLE adicionar_produto(
ID_produto INT,
ID_adicional INT
);

/* NESSA PARTE DO GODIGO SERA FEITA AS ALTERAÇÕES DAS TABELAS */


/* TABELA RESTAURANTE*/
ALTER TABLE restaurante
ADD CONSTRAINT categoria_estabelecimeto_FK
FOREIGN KEY (categoria_estabelecimeto_ID) REFERENCES categoria_estabelecimeto (ID);

/*TABELA ENDEREÇO*/
ALTER TABLE endereco
ADD CONSTRAINT usuario_FK
FOREIGN KEY (ID_usuario) REFERENCES usuario(ID);
ALTER TABLE endereco
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

/*TABELA PRODUTO*/
ALTER TABLE produto
ADD CONSTRAINT categoria_produto_FK
FOREIGN KEY (categoria_produto_ID) REFERENCES categoria_produto(ID);
ALTER TABLE produto
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

/*TABELA AVALIAÇÃO*/
ALTER TABLE avaliacao
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);

/*TABELA PEDIDO*/
ALTER TABLE pedido
ADD CONSTRAINT endereco_FK
FOREIGN KEY (endereco_ID) REFERENCES endereco(ID);
ALTER TABLE pedido
ADD CONSTRAINT usuario_FK
FOREIGN KEY(ID_usuario) REFERENCES usuario(ID);
ALTER TABLE pedido
ADD CONSTRAINT restaurante_FK
FOREIGN KEY(ID_restaurante) REFERENCES restaurante(ID);
ALTER TABLE pedido
ADD CONSTRAINT cupom_FK
FOREIGN KEY (cupom_ID) REFERENCES cupom(ID);
ALTER TABLE pedido
ADD CONSTRAINT status_pedido_FK
FOREIGN KEY (status_pedido_ID) REFERENCES status_pedido(ID);

/*TABELA ADICIONAR PRODUTO*/
ALTER TABLE adicionar_produto
ADD CONSTRAINT adicional_FK
FOREIGN KEY (adicional_ID) REFERENCES adicional(ID);
ALTER TABLE adicionar_produto
ADD CONSTRAINT produto_FK
FOREIGN KEY (ID_produto) REFERENCES produto(ID);

/*TABELA FAVORITOS*/
ALTER TABLE favoritos
ADD CONSTRAINT usuario_FK
FOREIGN KEY (ID_usuario) REFERENCES usuario(ID);
ALTER TABLE favoritos
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

/*TABELA PEDIDO-PRODUTO*/
ALTER TABLE pedido_produto
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE pedido_produto
ADD CONSTRAINT produto_FK
FOREIGN KEY (ID_produto) REFERENCES produto(ID);

/*TABELA ADICIONAL-PRODUTO-PEDIDO*/
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT pedido_produto_FK
FOREIGN KEY (pedido_produto_ID) REFERENCES pedido_produto(ID);
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT adicional_FK
FOREIGN KEY (adicional_ID) REFERENCES adicional(ID);

/*TABELA HISTORICO PEDIDO*/
ALTER TABLE historico_pedido
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE historico_pedido
ADD CONSTRAINT status_pedido_FK
FOREIGN KEY (status_pedido_ID) REFERENCES status_pedido(ID);

/*TABELA PAGAMENTO*/
ALTER TABLE pagamento
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE pagamento
ADD CONSTRAINT metado_pagamento_FK
FOREIGN KEY (metado_pagamento_ID) REFERENCES metado_pagamento(ID);
ALTER TABLE pagamento
ADD CONSTRAINT status_pagamento_FK
FOREIGN KEY (status_pagamento_ID) REFERENCES status_pagamento(ID);

/* TABELA FUNCIONAMENTO*/
ALTER TABLE funcionamento_restaurante
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

-- Inserir dados na tabela usuario
INSERT INTO usuario (dateCreate, dateTime, status, nome, email, senha, telefone, cpf)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'João Silva', 'joao@example.com', 'senha123', '123456789', '12345678901');

-- Inserir dados na tabela restaurante
INSERT INTO restaurante (dateCreate, dateTime, status, nome, descricao, telefone, avaliacao, cnpj)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'Restaurante ABC', 'Restaurante especializado em culinária internacional.', '987654321', 4.5, '12345678901234');

-- Inserir dados na tabela categoria_estabelecimento
INSERT INTO categoria_estabelecimento (dateCreate, dateTime, status, nome, descricao)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'Restaurante', 'Categoria para estabelecimentos de restaurante');

-- Inserir dados na tabela endereco
INSERT INTO endereco (dateCreate, dateTime, status, rua, bairro, cidade, cep, numero, complemento, padrao, ID_usuario, ID_restaurante)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'Rua A', 'Centro', 'Cidade A', '12345678', '123', 'Apartamento 101', 1, 1, 1);

-- Inserir dados na tabela produto
INSERT INTO produto (dateCreate, dateTime, status, nome, preco, descricao, restaurante_ID)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'Pizza Margherita', 2500, 'Pizza clássica com molho de tomate, muçarela e manjericão fresco.', 1);

-- Inserir dados na tabela categoria_produto
INSERT INTO categoria_produto (dateCreate, dateTime, status, nome, descricao)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'Pizza', 'Categoria de produtos relacionados a pizza');

-- Inserir dados na tabela adicional
INSERT INTO adicional (dateCreate, dateTime, status, nome, valor, descricao)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'Borda recheada', 500, 'Borda da pizza recheada com queijo cheddar');

-- Inserir dados na tabela pedido
INSERT INTO pedido (dateCreate, dateTime, status, taxaEntrega, valorTotal, descricao, is_retirada, endereco_ID, usuario_ID, restaurante_ID)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 300, 3000, 'Pedido de uma pizza margherita com borda recheada', 0, 1, 1, 1);

-- Inserir dados na tabela status_pedido
INSERT INTO status_pedido (dateCreate, dateTime, status, nome, descricao)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'Pendente', 'Pedido aguardando confirmação');

-- Inserir dados na tabela cupom
INSERT INTO cupom (dateCreate, dateTime, status, codigo, valor, descriao, validade)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'DESC10', 1000, 'Cupom de desconto de 10%', UNIX_TIMESTAMP() + (7 * 24 * 60 * 60)); -- Cupom válido por 7 dias

-- Inserir dados na tabela adicionar_produto
INSERT INTO adicionar_produto (ID_produto, ID_adicional)
VALUES (1, 1); -- Adicionando borda recheada à pizza margherita

-- Inserir dados na tabela pedido_produto
INSERT INTO pedido_produto (dateCreate, dateTime, status)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1);

-- Inserir dados na tabela adicional_produto_pedido
INSERT INTO adicional_produto_pedido (dateCreate, dateTime, status, quantidade, pedido_produto_ID, adicional_ID)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 1, 1, 1);

-- Inserir dados na tabela historico_pedido
INSERT INTO historico_pedido (dateCreate, dateTime, status, pedido_ID, status_pedido_ID)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 1, 1);

-- Inserir dados na tabela pagamento
INSERT INTO pagamento (dateCreate, dateTime, status, valor, data_hora, pedido_ID, metado_pagamento_ID, status_pagamento_ID)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 3000, UNIX_TIMESTAMP(), 1, 1, 1); -- Pagamento com valor total do pedido

-- Inserir dados na tabela metado_pagamento
INSERT INTO metado_pagamento (dateCreate, dateTime, status, nome, descricao)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'Cartão de crédito', 'Pagamento realizado através de cartão de crédito');

-- Inserir dados na tabela status_pagamento
INSERT INTO status_pagamento (dateCreate, dateTime, status, nome, descricao)
VALUES (UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 1, 'Pago', 'Pagamento foi efetuado com sucesso');

-- Inserir dados na tabela favoritos
INSERT INTO favoritos (ID_usuario, ID_restaurante)
VALUES (1, 1); -- Adicionando restaurante aos favoritos do usuário
