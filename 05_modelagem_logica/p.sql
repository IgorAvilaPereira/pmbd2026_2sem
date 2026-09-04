DROP DATABASE IF EXISTS periodico;

CREATE DATABASE periodico;

\c periodico;

CREATE TABLE artigo (
    id serial primary key,
    resumo text not null,
    titulo character varying(200) not null,
    arquivo bytea,
    nro_paginas integer check(nro_paginas > 0)
);

CREATE TABLE palavrachave (
    id serial primary key,
    descricao text not null
);

CREATE TABLE artigo_palavrachave (
    artigo_id integer references artigo(id),
    palavrachave_id integer references palavrachave(id),
    primary key (artigo_id, palavrachave_id)
);

CREATE TABLE instituicao (
    id serial primary key,
    nome character varying(150) not null,
    endereco text
);
INSERT INTO instituicao (nome, endereco) VALUES 
('IFRS', 'ALFREDO HUCH');

CREATE TABLE autor (
    email character varying(150) primary key,
    nome character varying(150) not null,
    instituicao_id integer references instituicao (id)
);



CREATE TABLE artigo_autor (
    artigo_id integer references artigo (id),
    autor_email character varying(150) references autor (email),
    primary key (artigo_id, autor_email)
    
);

