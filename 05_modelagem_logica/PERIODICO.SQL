-- 3) Modelagem Física >> SQL
DROP DATABASE IF EXISTS periodico;
CREATE DATABASE periodico;

\c periodico;

CREATE TABLE instituicao (
    id serial primary key,
    nome character varying(200) not null
);

CREATE TABLE autor (
    id serial primary key,
    nome character varying(200) not null,
    email character varying(200) unique
);

CREATE TABLE periodico (
    id serial primary key,
    nome text not null
);

CREATE TABLE artigo (
    id serial primary key,
    titulo text not null,
    resumo text not null,
    nro_paginas integer check (nro_paginas > 0),
    arquivo character varying(200) not null,
    periodico_id integer references periodico (id)
);

CREATE TABLE palavra_chave (
    id serial primary key,
    palavra_chave text not null,
    artigo_id integer references artigo (id)
);

CREATE TABLE instituicao_artigo (
    autor_id integer references autor (id),
    instituicao_id integer references instituicao (id),
    data_ingresso date default current_date,
    data_fim_vinculo date,
    primary key (autor_id, instituicao_id, data_ingresso)
);
CREATE TABLE autor_artigo (
    autor_id integer references autor (id),
    artigo_id integer references artigo (id),
    autor_principal boolean default false,
    primary key (autor_id, artigo_id)
);

INSERT INTO autor (nome, email) VALUES ('JAVIER BARDEN', 'javier@riogrande.ifrs.edu.br');

select * from autor;
select * from autor where email = 'javier@riogrande.ifrs.edu.br';




