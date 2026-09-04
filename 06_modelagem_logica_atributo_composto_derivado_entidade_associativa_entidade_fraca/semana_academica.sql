DROP DATABASE IF EXISTS semana_academica;

CREATE DATABASE semana_academica;

\c semana_academica;

-- 1
/*
CREATE TABLE pessoa (
    id serial primary key,
    nome text,
    cpf character(11) unique,
    cnpj character(14) unique
);

INSERT INTO pessoa (nome, cpf) VALUES('IGOR', '11111111111');
INSERT INTO pessoa (nome, cnpj) VALUES('IPIRANGA', '12312312300010');
INSERT INTO pessoa (nome, cnpj) VALUES('VETORIAL NET', '12312312300011');

select * from pessoa;
*/

/*
-- 2
CREATE TABLE pessoafisica (
    id serial primary key,
    nome text,
    cpf character(11) unique
);

CREATE TABLE pessoajuridica (
    id serial primary key,
    nome text,
    cnpj character(14) unique
);

INSERT INTO pessoafisica (nome, cpf) VALUES('IGOR', '11111111111');
INSERT INTO pessoajuridica (nome, cnpj) VALUES('IPIRANGA', '12312312300010');

select id, nome, cpf as cpf_cnpj from pessoafisica union select id, nome, cnpj from pessoajuridica;
*/

-- 3
/*
CREATE TABLE pessoa (
    id serial primary key,
    nome text
);

CREATE TABLE pessoafisica (
    cpf character(11) primary key,
    pessoa_id integer references pessoa (id)
);

CREATE TABLE pessoajuridica (
    cnpj character(14) primary key,
    pessoa_id integer references pessoa (id)
);
INSERT INTO pessoa (nome) VALUES('IGOR'); -- 1
INSERT INTO pessoa (nome) VALUES('IPIRANGA'); -- 2
INSERT INTO pessoafisica (cpf, pessoa_id) VALUES('11111111111', 1);
INSERT INTO pessoajuridica (cnpj, pessoa_id) VALUES('12312312300010', 2);

select id, nome, cpf as cpf_cnpj from pessoa inner join pessoafisica on (pessoa.id = pessoafisica.pessoa_id) union select id, nome, cnpj from pessoa join pessoajuridica on (pessoa.id = pessoajuridica.pessoa_id);
*/

-- 4 quase exclusivo do PostgreSQL
CREATE TABLE pessoa (
    id serial primary key,
    nome text
);

CREATE TABLE pessoafisica (
    cpf character(11) primary key
) INHERITS (pessoa);

CREATE TABLE pessoajuridica (
    cnpj character(14) primary key
) INHERITS (pessoa);

INSERT INTO pessoafisica (nome, cpf) VALUES('IGOR', '11111111111');
INSERT INTO pessoajuridica (nome, cnpj) VALUES('IPIRANGA', '12312312300010');

select * from pessoafisica ;
select * from pessoajuridica;
select * from pessoa;

-- OFF-TOPIC
INSERT INTO pessoa (nome) VALUES('PESSOA SÓ PESSOA');
select * from only pessoa;
