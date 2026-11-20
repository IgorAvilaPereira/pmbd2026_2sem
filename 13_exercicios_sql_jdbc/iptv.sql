DROP DATABASE IF EXISTS iptv;

CREATE DATABASE iptv;

\c iptv;

CREATE TABLE plano (
    id serial primary key,
    nome text not null,
    preco money 
);

CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome character varying(255) not null,
    email character varying(255) unique,
    senha character varying(255) not null,
    data_nascimento date,
    rua text,
    bairro text,
    nro text,
    complemento text,
    plano_id integer references plano (id)
);

CREATE TABLE canal (
    id serial primary key,
    nome text not null,
    senha character varying(255),
    nro integer
);

CREATE TABLE plano_canal (
    -- criando uma coluna, definindo seu tipo e criando uma fk
    plano_id integer references plano (id),
    
    canal_id integer not null,
    FOREIGN KEY (canal_id) REFERENCES canal (id)
);


CREATE TABLE programa (
    id serial primary key,
    nome text not null,
    classificacao text check (classificacao in ('infantil', 'adulta'))
);

INSERT INTO cliente (nome, email, senha, data_nascimento) VALUES ('IGOR PEREIRA', 'igor.pereira@riogrande.ifrs.edu.br', '123', '1987-01-20');

-- 1: usei a like 
select * from cliente where email ilike '%@riogrande.ifrs.edu.br';


