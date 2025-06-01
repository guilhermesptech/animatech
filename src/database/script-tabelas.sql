-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

-- Criando o banco de dados
CREATE DATABASE toon;

-- Colocando o banco de dados em uso
USE toon;

-- Criando as tabelas
CREATE TABLE usuario 
(
	id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	nome VARCHAR(25) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
	nome_usuario VARCHAR(25) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    genero CHAR(1) NOT NULL, 
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    imagem_url varchar(255) DEFAULT 'imagens/perfil-padrao.webp',
	CONSTRAINT check_genero CHECK (genero IN ('m', 'f', 'o'))
);

CREATE TABLE acesso_usuario
(
	id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    data_acesso DATETIME DEFAULT CURRENT_TIMESTAMP,
    fkusuario INT
);

CREATE TABLE desenho
(
	id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL UNIQUE,
	descricao TEXT,
    imagem_url VARCHAR(255),
    fkgenero INT
);

CREATE TABLE genero
(
	id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL UNIQUE,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE voto
(
	id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    quantidade_votos INT DEFAULT 0,
    fkusuario INT NOT NULL,
    fkdesenho INT NOT NULL
);

-- Fazendo os acertos das chaves estrangeiras
ALTER TABLE voto
ADD CONSTRAINT foreign_key_fkusuario_fav
FOREIGN KEY(fkusuario) REFERENCES usuario(id),
ADD CONSTRAINT foreign_key_fkdesenho
FOREIGN KEY(fkdesenho) REFERENCES desenho(id);

ALTER TABLE acesso_usuario
ADD CONSTRAINT foreign_key_fkusuario_acess
FOREIGN KEY(fkusuario) REFERENCES usuario(id);

ALTER TABLE desenho
ADD CONSTRAINT foreign_key_fkgenero
FOREIGN KEY(fkgenero) REFERENCES genero(id);

-- Inserindo registros nas tabelas
INSERT INTO genero 
(
	nome, 
    descricao
)
VALUES
(
	'Anime', 
    'Desenhos de origem japonesa'
),
(
	'Infantil', 
    'Desenhos feitos especialmente para crianças'
),
(
	'Comédia', 
    'Desenhos feitos para tirar risadas do público'
),
(
	'Aventura', 
    'Desenhos que envolvem aventuras jamais vistas'
);

INSERT INTO desenho 
(
	nome, 
    descricao, 
    imagem_url, 
    fkgenero
)
VALUES 
(
	'Tom e Jerry', 
    'Gato e rato em aventuras cômicas.',
    'imagens/tom-e-jerry.jpg',
    2
),
(
	'Naruto', 
    'Ninja determinado em busca de reconhecimento.',
    'imagens/naruto.jpg',
    1
),
(
	'Steven Universo', 
    'Jovem com joias mágicas e aventuras.',
    'imagens/steven-universo.png',
    4
),
(
	'O Incrível Mundo de Gumball', 
    'Gato azul e seu irmão peixinho em aventuras.',
    'imagens/o-incrivel-mundo-de-gumball.jpeg',
    3
),
(
	'As Meninas Super Poderosas', 
    'Versão anime das superpoderosas.',
    'imagens/as-meninas-super-poderosas.jpg',
    2
);

INSERT INTO acesso_usuario 
(
	data_acesso, 
	fkusuario
) 
VALUES
(
	'2025-01-10 08:23:45', 
	1
),
(
	'2025-01-22 19:11:30',
	1
);

INSERT INTO acesso_usuario 
(
	data_acesso, 
	fkusuario
) 
VALUES
(
	'2025-02-03 14:00:00', 
	1
),
(
	'2025-02-17 10:15:22', 
	1
),
(
	'2025-02-27 23:59:59', 
	1
);

INSERT INTO acesso_usuario 
(
	data_acesso, 
	fkusuario
) 
VALUES
(
	'2025-03-05 07:45:12', 
	1
);

INSERT INTO acesso_usuario 
(
	data_acesso, 
	fkusuario
) 
VALUES
(
	'2025-04-18 12:30:00', 
	1
),
(
	'2025-04-25 18:20:15', 
	1
);

INSERT INTO acesso_usuario 
(
	data_acesso, 
	fkusuario
) 
VALUES
(
	'2025-05-01 09:00:00', 
	1
),
(
	'2025-05-15 16:45:33', 
	1
),
(
	'2025-05-29 21:10:05', 
	1
);