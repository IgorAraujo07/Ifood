-- Tabela de Clientes
CREATE TABLE usuario (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(100),
email VARCHAR(100)UNIQUE,
senha VARCHAR(60),
telefone VARCHAR(20),
cpf VARCHAR(11)UNIQUE
);

CREATE TABLE restaurante(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(100), 
descricao VARCHAR(100),
telefone VARCHAR(20),
avaliacao FLOAT,
cnpj VARCHAR(30)
);

CREATE TABLE categoria_estabelecimeto(
ID  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(100),
descricao VARCHAR(100)
);

CREATE TABLE endereco(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
rua VARCHAR(100),
bairro VARCHAR(100),
cidade VARCHAR(80),
cep VARCHAR(20),
numero VARCHAR(10),
complemento VARCHAR(100),
padrao INT
);

CREATE TABLE produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(100),
preco INT,
descricao VARCHAR(100)

CREATE TABLE categoria_produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE adicional(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
valor INT,
descricao VARCHAR(60)
);

CREATE TABLE pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
taxaEntrega INT,
valorTotal INT,
descricao VARCHAR(100)
is_retirada INT
);

CREATE TABLE status_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(100),
descricao VARCHAR(100)
);

CREATE TABLE historico_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT
);

CREATE TABLE cupom(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
codigo VARCHAR(20) NOT NULL,
valor INT,
descriao VARCHAR(100),
validade INT NOT NULL
):
