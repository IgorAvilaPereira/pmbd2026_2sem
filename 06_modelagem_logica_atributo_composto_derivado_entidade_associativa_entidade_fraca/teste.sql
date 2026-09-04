CREATE DATABASE banco;

\c banco;

CREATE TABLE pessoa (
    cod serial primary key,
    nome character varying(200) not null,
    email character varying(150) not null,
    data_nascimento date,
    -- mapeamento de um atributo composto - cada atributinho vira coluna - e eu desconsidero a raiz endereco
    bairro text,
    rua text,
    complemento text,
    nro text,
    unique(email)
);

CREATE TABLE telefone (
    cod serial primary key,
    telefone varchar(200) not null,
    pessoa_cod integer references pessoa (cod),
    unique (telefone, pessoa_cod)
);

-- ex: mapeamento de uma entidade fraca com relacao 1:n
CREATE TABLE dependente (
    -- mapeamento direto do atributo/atributo_parcial da entidade de origem
    nome character varying(200) not null,
    -- coluna + declaracao de fk
    pesssoa_cod integer references pessoa (cod),
    primary key (nome, pessoa_cod)
);

