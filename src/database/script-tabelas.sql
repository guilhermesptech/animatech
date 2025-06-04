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
	nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
	data_nascimento DATE NOT NULL,
	genero CHAR(1) NOT NULL, 
	imagem_url varchar(255) DEFAULT 'imagens/perfil-padrao.webp' NOT NULL,
	nome_usuario VARCHAR(25) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
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
	descricao TEXT NOT NULL,
    imagem_url VARCHAR(255) NOT NULL,
    fkgenero INT NOT NULL
);

CREATE TABLE genero
(
	id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL UNIQUE,
    descricao TEXT NOT NULL
);

CREATE TABLE voto
(
	id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    quantidade_votos INT,
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
INSERT INTO usuario
(
	nome,
    sobrenome,
    data_nascimento,
    genero,
    nome_usuario,
    email,
    senha
)
VALUES
(
	'Guilherme',
    'Rodrigues de Oliveira',
    '2003-09-24',
    'm',
    'Guigo',
    'guilherme@email.com',
    '22418907Aeiou.'
);

INSERT INTO acesso_usuario 
(
	data_acesso, 
	fkusuario
) 
VALUES
('2025-01-03 08:23:45', 1),
('2025-01-08 12:10:20', 1),
('2025-01-12 19:11:30', 1),
('2025-01-19 20:03:10', 1),
('2025-01-27 04:01:01', 1),
('2025-02-01 09:15:32', 1),
('2025-02-02 11:05:10', 1),
('2025-02-03 13:47:22', 1),
('2025-02-05 17:33:59', 1),
('2025-02-07 21:45:00', 1),
('2025-02-10 08:01:44', 1),
('2025-02-12 14:20:15', 1),
('2025-02-14 18:30:30', 1),
('2025-02-17 23:59:59', 1),
('2025-02-19 06:45:11', 1),
('2025-02-21 07:12:50', 1),
('2025-02-23 10:10:10', 1),
('2025-02-25 15:25:35', 1),
('2025-02-27 19:00:00', 1),
('2025-02-28 22:22:22', 1),
('2025-03-10 08:00:00', 1),
('2025-03-20 09:30:30', 1),
('2025-03-30 16:40:40', 1),
('2025-04-02 08:11:11', 1),
('2025-04-05 10:22:22', 1),
('2025-04-09 12:33:33', 1),
('2025-04-14 14:44:44', 1),
('2025-04-18 16:55:55', 1),
('2025-04-22 18:06:06', 1),
('2025-04-30 20:17:17', 1),
('2025-05-01 07:07:07', 1),
('2025-05-04 08:08:08', 1),
('2025-05-08 09:09:09', 1),
('2025-05-12 10:10:10', 1),
('2025-05-15 11:11:11', 1),
('2025-05-20 12:12:12', 1),
('2025-05-23 13:13:13', 1),
('2025-05-27 14:14:14', 1),
('2025-05-31 15:15:15', 1);

INSERT INTO genero 
(
	nome, 
    descricao
)
VALUES
(
	'Anime', 
    'Animações originárias do Japão, com estilos únicos e narrativas envolventes que exploram diversos gêneros.'
),
(
	'Infantil', 
    'Animações desenvolvidas especialmente para o público infantil, com temas educativos, lúdicos e acessíveis.'
),
(
	'Comédia', 
    'Desenhos voltados para o humor, com situações engraçadas e personagens cômicos que garantem boas risadas.'
),
(
	'Aventura', 
    'Animações que acompanham heróis em jornadas emocionantes, cheias de descobertas, desafios e mundos fantásticos.'
),
(
	'Ação',
    'Desenhos repletos de cenas dinâmicas, combates intensos e histórias cheias de adrenalina e emoção.'
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
	'Naruto', 
    'Naruto conta a história de Naruto Uzumaki, um jovem ninja rejeitado por sua vila, mas determinado a conquistar o respeito de todos e se tornar Hokage. Em um mundo repleto de técnicas ninjas, laços profundos e batalhas marcantes, a série explora temas como superação, amizade e o desejo de ser reconhecido.',
    'imagens/naruto.jpg',
    1
),
(
	'Os jovens titãs em ação', 
    'Os Jovens Titãs em Ação mostram as aventuras engraçadas e caóticas de Robin, Estelar, Ravena, Mutano e Ciborgue quando não estão salvando o mundo. Com muito humor, situações absurdas e brincadeiras, a série mistura ação e comédia para divertir fãs de todas as idades.',
    'imagens/robin.jpeg',
    3
),
(
	'Doug Funnie', 
    'Doug Funnie acompanha as aventuras de Doug, um garoto de 12 anos que se muda com sua família para a cidade de Bluffington. Com seu fiel cachorro Costelinha e os amigos Skeeter e Patti, Doug enfrenta os desafios da adolescência, lidando com inseguranças, paixões e a busca por identidade. A série mistura humor, imaginação e situações cotidianas, proporcionando uma visão sensível e divertida da vida juvenil.',
    'imagens/doug.jpg',
    2
),
(
	'Ben 10: Força Alienígena', 
    'Ben 10: Força Alienígena segue Ben Tennyson agora mais velho, que retorna com novos poderes e um Omnitrix atualizado. Junto com seus amigos, ele enfrenta ameaças alienígenas cada vez maiores enquanto aprende sobre responsabilidade, amizade e o peso de ser um herói intergaláctico.',
    'imagens/ben-10-força-alienigena.jpeg',
    4
),
(
	'Cocoricó', 
    'Cocóricó acompanha Júlio, um garoto curioso que vive em uma fazenda cheia de amigos divertidos como o cavalo Alípio, a galinha Lola e o porquinho Zazá. Com músicas, brincadeiras e lições do dia a dia, a série encanta as crianças ao ensinar valores como amizade, respeito e imaginação em meio à natureza.',
    'imagens/julio.jpg',
    2
),
(
	'Clarêncio, o otimista', 
    'Clarêncio, o Otimista acompanha as aventuras de Clarêncio, um garoto cheio de energia e imaginação, sempre vendo o lado bom das coisas. Com seus amigos Jeff e Sumo, ele enfrenta os desafios da adolescência com criatividade, bom humor e muita diversão.',
    'imagens/clarencio.jpg',
    3
),
(
	'Dragon Ball',
    'Dragon Ball acompanha as aventuras de Goku, um guerreiro com coração puro e força extraordinária, em sua busca pelas esferas do dragão.',
    'imagens/goku.jpg',
    1
),
(
	'Vila Sésamo',
    'Vila Sésamo é um programa clássico que mistura fantoches, animações e pessoas reais para ensinar crianças sobre amizade, números, letras e valores importantes. Com personagens inesquecíveis como Garibaldo e Elmo, a série estimula a criatividade, a aprendizagem e a diversidade desde os primeiros anos.',
    'imagens/vila-sesamo.jpg',
    2
),
(
	'Irmão do Jorel',
    'Irmão do Jorel acompanha as aventuras do caçula da família Jorel, um garoto tímido que vive em meio a personagens excêntricos e situações engraçadas. Com um humor leve e uma visão única da infância, a série explora a imaginação, os desafios familiares e a busca por identidade.',
    'imagens/irmao-do-jorel.jpeg',
    3
),
(
	'Tom e Jerry', 
    'Tom e Jerry retrata a eterna e hilária rivalidade entre um gato determinado e um rato astuto. Com perseguições criativas, armadilhas malucas e quase nenhuma fala, a série encanta gerações com seu humor visual e a comédia de situações imprevisíveis.',
    'imagens/tom-e-jerry.jpg',
    2
),
(
	'Hunter x Hunter',
    'Hunter x Hunter acompanha Gon Freecss, um garoto determinado a se tornar um Hunter e encontrar seu pai desaparecido. Em um mundo cheio de criaturas místicas, desafios mortais e batalhas inteligentes, a série mergulha em amizades profundas, escolhas morais e o verdadeiro custo do poder.',
    'imagens/gon.jpg',
    1
),
(
	'Apenas um Show',
    'Apenas um Show acompanha Mordecai, um gaio azul, e Rigby, um guaxinim, dois amigos que trabalham em um parque e vivem situações absurdas e hilárias no dia a dia. Com muito humor nonsense e personagens excêntricos, a série mistura o cotidiano com o surreal em aventuras inesperadas.',
    'imagens/mordecai.png',
    3
),
(
	'Ben 10',
    'Ben 10 acompanha Ben Tennyson, um garoto que encontra o Omnitrix, um relógio alienígena que lhe permite se transformar em diferentes seres poderosos. Junto com seus amigos, ele enfrenta ameaças intergalácticas enquanto aprende sobre responsabilidade, coragem e o valor de proteger o planeta.',
    'imagens/ben-10.webp',
    4
),
(
	'O Incrível Mundo de Gumball', 
    'O Incrível Mundo de Gumball acompanha as aventuras de Gumball Watterson, um gato azul cheio de imaginação, e sua família inusitada na cidade de Elmore. Com humor inteligente, situações absurdas e personagens únicos, a série mistura realidade e fantasia para divertir todas as idades.',
    'imagens/o-incrivel-mundo-de-gumball.jpeg',
    3
),
(
	'Hora de Aventura', 
    'Hora de Aventura segue Finn, um garoto corajoso, e seu melhor amigo mágico, Jake, em aventuras épicas pelo misterioso Reino de Ooo. Repleto de criaturas estranhas, desafios perigosos e histórias cheias de emoção, a série mistura fantasia, amizade e descobertas sobre crescer e enfrentar o desconhecido.',
    'imagens/finn.png',
    4
),
(
	'Fullmetal Alchemist',
    'Fullmetal Alchemist conta a jornada dos irmãos Edward e Alphonse Elric, que, após uma tentativa proibida de alquimia, enfrentam as consequências em busca da Pedra Filosofal. Em um mundo onde ciência e magia se entrelaçam, eles lutam contra forças sombrias enquanto exploram temas como sacrifício, humanidade e redenção.',
    'imagens/edward-elric.jpg',
    1
),
(
	'O pequeno urso',
    'O Pequeno Urso acompanha as aventuras de um ursinho curioso e seus amigos na floresta, explorando o mundo ao seu redor com inocência e alegria. A série traz histórias cheias de amizade, descobertas e aprendizado, perfeitas para crianças pequenas que estão começando a conhecer a vida.',
    'imagens/o-pequeno-urso.jpg',
    2
),
(
	'Steven Universo', 
    'Steven Universo acompanha um garoto único que é metade humano, metade gema mágica, enquanto ele aprende a controlar seus poderes e proteger o planeta ao lado das Crystal Gems. A série mistura aventura, amizade e autodescoberta, abordando temas de amor, aceitação e identidade.',
    'imagens/steven-universo.png',
    4
),
(
	'One Piece',
    'One Piece narra a incrível jornada de Monkey D. Luffy, um jovem pirata com um chapéu de palha e um sonho grandioso: encontrar o lendário tesouro One Piece e se tornar o Rei dos Piratas. Em um mundo vasto repleto de ilhas exóticas, poderes místicos e inimigos formidáveis, a série celebra a amizade, a liberdade e a coragem de nunca desistir dos próprios sonhos.',
    'imagens/luffy.jpg',
    1
),
(
	'Liga da Justiça: Sem Limites',
    'Liga da Justiça: Sem Limites acompanha os maiores super-heróis da DC — Superman, Batman, Mulher-Maravilha, Flash e outros — enquanto enfrentam ameaças globais e intergalácticas. A série combina ação intensa, trabalho em equipe e dilemas morais, mostrando heróis que vão além dos seus limites para proteger o mundo.',
    'imagens/liga-da-justica.jpg',
    1
),
(
	'As Meninas Super Poderosas', 
    'As Meninas Superpoderosas acompanham Florzinha, Lindinha e Docinho — três irmãs criadas em laboratório que usam seus superpoderes para proteger a cidade de Townsville. Entre monstros, vilões excêntricos e deveres de casa, elas equilibram a infância com a missão de salvar o mundo antes da hora de dormir.',
    'imagens/as-meninas-super-poderosas.jpg',
    2
);