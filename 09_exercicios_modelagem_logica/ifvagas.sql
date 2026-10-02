DROP DATABASE IF EXISTS ifvagas;

CREATE DATABASE ifvagas;

\c ifvagas;

CREATE TABLE empresa (
    id serial primary key,
    cnpj character(14) unique,
    nome character varying(200) not null
);
INSERT INTO empresa (cnpj, nome) VALUES
('12121212121212', 'IFRS');

CREATE TABLE departamento (
    id serial primary key,
    nome character varying(200) not null,
    empresa_id integer references empresa (id)
);
INSERT INTO departamento (nome, empresa_id) VALUES
('DEPARTAMENTO DE INFORMATICA', 1);


CREATE TABLE vaga (
    id serial primary key,
    titulo text not null,
    descricao text not null,
    data_abertura date default current_date,
    salario money default 0::money,
    status text check(status in ('DISPONIVEL', 'FECHADA')),
    departamento_id integer references departamento (id)
);
INSERT INTO vaga (titulo, descricao, departamento_id, status) VALUES
('ESTÁGIO NO GOOGLE', 'UM BAITA ESTÁGIO NO GOOGLE', 1, 'DISPONIVEL');

CREATE TABLE candidato (
    id serial primary key,
    nome varchar(200) not null,
    cpf char(11) unique,
    telefone varchar(14),
    email varchar(100) unique
);
INSERT INTO candidato (nome, cpf, email) VALUES
('IGOR AVILA PEREIRA', '00000000000', 'igor.pereira@riogrande.ifrs.edu.br');

CREATE TABLE candidatura (
    id serial primary key,
    situacao text check (situacao in('SUBMETIDA', 'APROVADA', 'REJEITADA')),
    data_hora timestamp default current_timestamp,
    vaga_id integer references vaga(id),
    candidato_id integer references candidato (id),
    unique(vaga_id, candidato_id)
);
INSERT INTO candidatura (situacao, vaga_id, candidato_id) VALUES
('SUBMETIDA', 1, 1);

CREATE TABLE etapa (
    ordem serial primary key,
    descricao text not null
);
INSERT INTO etapa (descricao) VALUES
('ANALISE'),
('ENTREVISTA'),
('SELEÇÃO'),
('CHAMADA'),
('CONTRATAÇÃO');

CREATE TABLE participacao (
    id serial primary key,
    etapa_ordem integer references etapa (ordem),
    candidatura_id integer references candidatura (id),
    unique(etapa_ordem, candidatura_id)
);

INSERT INTO participacao (etapa_ordem, candidatura_id) VALUES
(1,1);

