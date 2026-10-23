-- conectar
-- psql -h localhost -U postgres

-- conectar em bd especifico
-- psql -h localhost -U postgres aula_pmbd

-- conectar e ja importar o script.sql ao mesmo
-- psql -h localhost -U postgres -f /home/iapereira/script.sql

-- importar um script
-- \i script.sql

-- elencar tabelas existentes
-- \dt

-- destruir caso exista
DROP DATABASE IF EXISTS aula_pmbd;

-- criar um bd
CREATE DATABASE aula_pmbd;

-- conectar em um BD
\c aula_pmbd;

CREATE TABLE funcionario (
    -- jeito 1 de criar uma pk
    id serial primary key, 
    nome varchar(200) not null, 
    email varchar(200) unique(email)
);

CREATE TABLE projeto (
    -- jeito 2 de criar uma pk
    id serial,  -- to criando uma coluna simples do tipo serial
    nome text not null, 
    data_inicio date default current_date, 
    data_fim date,
    -- aqui ela se transforma chave primaria
    PRIMARY KEY (id)
);

                                                             
CREATE TABLE funcionario_projeto (
    -- criando a coluna e a fk ao mesmo tempo agora
    funcionario_id integer references funcionario (id),
    -- criando a coluna de forma isolada e a fk separadamente 
    projeto_id integer,
    FOREIGN KEY (projeto_id) REFERENCES projeto (id),
    -- criando uma coluna com valor default 
    data_inicio date default current_date, 
    data_fim date, 
    -- criando uma pk composta
    primary key(funcionario_id, projeto_id)
);

