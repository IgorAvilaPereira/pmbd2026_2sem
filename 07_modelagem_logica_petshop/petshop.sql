-- apaguei pois fiz alguma coisa antes (possivel uma m...) e quero apagar tudo e fazer tudo do zero - opcional
DROP DATABASE IF EXISTS petshop;

-- criei o bd
CREATE DATABASE petshop;

-- entrei no banco
\c petshop;

CREATE TABLE cliente (
    email varchar(200) primary key,
    nome varchar(200) not null,
    bairro text,
    rua text,
    nro text,
    data_nascimento date
);
INSERT INTO cliente (email, nome) VALUES
('igor.pereira@riogrande.ifrs.edu.br','IGOR'), ('lisandro@mikrus.com','LISANDRO');

CREATE TABLE telefone (
    telefone varchar(200) primary key,
    cliente_email varchar(200) references cliente (email)
);
INSERT INTO telefone (telefone, cliente_email) VALUES
('1221231232432', 'igor.pereira@riogrande.ifrs.edu.br'),
('1233242342443', 'igor.pereira@riogrande.ifrs.edu.br');

CREATE TABLE animal (
    id serial primary key,
    nome varchar(200),
    cliente_email varchar(200) references cliente (email)
);
INSERT INTO animal (nome, cliente_email) VALUES
('DOG DO ALEMÃO BY IGOR', 'igor.pereira@riogrande.ifrs.edu.br'),
('CADELINHA1', 'lisandro@mikrus.com'),
('CADELIHA2', 'lisandro@mikrus.com'),
('GATINHO DO IGOR',  'igor.pereira@riogrande.ifrs.edu.br');

CREATE TABLE felino (
    nro_bigodes integer check (nro_bigodes > 0),
    animal_id integer,
    primary key(animal_id),
    foreign key (animal_id) references animal (id)
);
INSERT INTO felino (nro_bigodes, animal_id) VALUES
(32, 4);

CREATE TABLE ave (
    textura_pena varchar(200) not null,
    comprimento_bico real,
    animal_id integer,
    primary key(animal_id),
    foreign key (animal_id) references animal (id)
);

CREATE TABLE consulta (
    id serial primary key,
    data_hora timestamp default current_timestamp,
    observacao text not null,
    preco money,
    animal_id integer references animal (id)
);
INSERT INTO consulta (observacao, preco, animal_id) VALUES
('GATINHO DO IGOR ESTÁ COM FEBRE', 1.99, 4);


