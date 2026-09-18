-- psql -h localhost -U postgres
DROP DATABASE IF EXISTS deezer;

CREATE DATABASE deezer; 

\c deezer;

CREATE TABLE artista (
    id serial primary key,
    nome varchar(20) not null
);
INSERT INTO artista (nome) VALUES
('PABLO VITTAR');

CREATE TABLE musica (
    id serial primary key,
    titulo text not null,
    duracao time not null
);
INSERT INTO musica (titulo, duracao) VALUES ('JINGLE BELLS', '00:02:00');

CREATE TABLE artista_musica (
    artista_id integer references artista (id),
    musica_id integer references musica (id),
    primary key (artista_id, musica_id)
);
INSERT INTO artista_musica (artista_id, musica_id) VALUES (1,1);

CREATE TABLE gravadora (
    id serial primary key,
    nome varchar(200) not null,
    contato varchar(100),
    telefone char(10),
    site text
);

CREATE TABLE album (
    id serial primary key,
    nome text not null,
    data_lancamento date,
    gravadora_id integer references gravadora (id),
    album_indicado_id integer references album (id)
);
INSERT INTO album (nome) VALUES ('MELHORES SUCESSOS DO PABLO VITTAR');


CREATE TABLE musica_album(
    musica_id integer references musica (id),
    album_id integer references album (id),
    ordem integer check (ordem >= 1),
    primary key (musica_id, album_id)
);
INSERT INTO musica_album (musica_id, album_id, ordem) VALUES (1,1,1); 

CREATE TABLE usuario (
    id serial primary key,
    nome varchar(200) not null,
    email varchar(250) unique,
    senha text
);

CREATE TABLE playlist (
    id serial primary key,
    nome text not null,
    data_hora timestamp default current_timestamp,
    usuario_id integer,
    FOREIGN KEY (usuario_id) references usuario (id)
);

CREATE TABLE playlist_musica (
    playlist_id integer references playlist (id),
    musica_id integer references musica(id),
    primary key (playlist_id, musica_id)
);

