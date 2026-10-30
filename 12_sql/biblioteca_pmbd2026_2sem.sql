DROP DATABASE IF EXISTS biblioteca_pmbd2026_2sem;

CREATE DATABASE biblioteca_pmbd2026_2sem;

\c biblioteca_pmbd2026_2sem;

CREATE TABLE editora (
    id serial primary key,
    nome text not null,
    bairro text,
    nro text,
    complemento text,
    rua text,
    email text unique
);

INSERT INTO editora (nome, bairro, nro, complemento, rua, email) VALUES
('Novatec', 'Centro', '120', NULL, 'Rua da Inovação', 'contato@novatec.com.br'),
('Bookman', 'Floresta', '450', 'Sala 302', 'Avenida das Letras', 'contato@bookman.com.br'),
('Alta Books', 'Centro', '85', NULL, 'Rua dos Livros', 'contato@altabooks.com.br'),
('O''Reilly Media', 'Centro', '200', NULL, 'Rua da Tecnologia', 'contato@oreilly.com'),
('Saraiva', 'Cidade Baixa', '710', NULL, 'Avenida Central', 'contato@saraiva.com.br');

CREATE TABLE livro (
    id serial primary key,
    isbn char(6) unique,
    titulo text not null,
    ano integer
);

INSERT INTO livro (isbn, titulo, ano) VALUES
('100001', 'Use a Cabeça! Java', 2022),
('100002', 'PostgreSQL: Guia Prático', 2023),
('100003', 'Padrões de Projeto', 2019),
('100004', 'Engenharia de Software', 2021),
('100005', 'Banco de Dados', 2020),
('100006', 'Python para Análise de Dados', 2022),
('100007', 'Java: Como Programar', 2018),
('100008', 'Sistemas Distribuídos', 2021),
('100009', 'Introdução à Inteligência Artificial', 2024),
('100010', 'Desenvolvimento Web com Java', 2023);

CREATE TABLE editora_livro (
    editora_id integer references editora (id),
    livro_id integer references livro(id),
    edicao integer check (edicao >= 1),
    primary key (editora_id, livro_id)
);

INSERT INTO editora_livro (editora_id, livro_id, edicao) VALUES
(1, 1, 3),
(1, 2, 2),
(1, 3, 2),
(2, 4, 10),
(2, 5, 4),
(3, 6, 3),
(3, 7, 8),
(4, 8, 2),
(4, 9, 1),
(5, 10, 2),
(1, 5, 3),
(3, 10, 1);

CREATE TABLE autor (
    id serial primary key,
    nome text not null
);

INSERT INTO autor (nome) VALUES
('Kathy Sierra'),
('Bert Bates'),
('Simon Sinek'),
('Erich Gamma'),
('Richard Helm'),
('Ralph Johnson'),
('John Vlissides'),
('Ian Sommerville'),
('Abraham Silberschatz'),
('Henry F. Korth'),
('S. Sudarshan'),
('Wes McKinney'),
('Paul Deitel'),
('Harvey Deitel'),
('Andrew S. Tanenbaum'),
('Stuart Russell'),
('Peter Norvig'),
('José de Assis');

CREATE TABLE autor_livro (
    livro_id integer references livro(id),
    autor_id integer references autor(id),
    primary key (livro_id, autor_id)
);

INSERT INTO autor_livro (livro_id, autor_id) VALUES
(1, 1),
(1, 2),
(2, 18),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 8),
(5, 9),
(5, 10),
(5, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(9, 16),
(9, 17),
(10, 18);

CREATE TABLE exemplar (
    id serial primary key,
    situacao text check(situacao in ('disponivel', 'reservado', 'emprestimo')),
    livro_id integer references livro (id)
);

INSERT INTO exemplar (situacao, livro_id) VALUES
('disponivel', 1),
('emprestimo', 1),
('disponivel', 1),
('reservado', 2),
('disponivel', 2),
('emprestimo', 3),
('disponivel', 3),
('disponivel', 4),
('emprestimo', 4),
('disponivel', 5),
('reservado', 5),
('disponivel', 6),
('emprestimo', 6),
('disponivel', 7),
('disponivel', 7),
('reservado', 8),
('disponivel', 8),
('emprestimo', 9),
('disponivel', 9),
('disponivel', 10),
('emprestimo', 10),
('disponivel', 10);

CREATE TABLE usuario (
    id serial primary key,
    nome varchar(200) not null,
    senha text not null,
    email varchar(200) unique,
    cpf char(11) unique
    
);

INSERT INTO usuario (nome, senha, email, cpf) VALUES
('Ana Paula Silva', '123456', 'ana.silva@email.com', '11111111111'),
('Bruno Costa', '123456', 'bruno.costa@email.com', '22222222222'),
('Carla Mendes', '123456', 'carla.mendes@email.com', '33333333333'),
('Daniel Oliveira', '123456', 'daniel.oliveira@email.com', '44444444444'),
('Eduarda Santos', '123456', 'eduarda.santos@email.com', '55555555555'),
('Felipe Rodrigues', '123456', 'felipe.rodrigues@email.com', '66666666666'),
('Gabriela Martins', '123456', 'gabriela.martins@email.com', '77777777777'),
('Henrique Souza', '123456', 'henrique.souza@email.com', '88888888888'),
('Isabela Ferreira', '123456', 'isabela.ferreira@email.com', '99999999999'),
('João Pedro Lima', '123456', 'joao.lima@email.com', '00000000000');

CREATE TABLE emprestimo (
    id serial primary key,
    data_retirada date default current_date,
    data_previsata_entrega date default current_date + interval '7 days',
    data_entrega date,
    usuario_id integer references usuario (id),
    exemplar_id integer references exemplar (id),
    multa money
);

INSERT INTO emprestimo
(data_retirada, data_previsata_entrega, data_entrega, usuario_id, exemplar_id, multa)
VALUES
(CURRENT_DATE - 2, CURRENT_DATE + 5, NULL, 1, 2, 0),
(CURRENT_DATE - 15, CURRENT_DATE - 8, CURRENT_DATE - 9, 2, 6, 15.00),
(CURRENT_DATE - 3, CURRENT_DATE + 4, NULL, 3, 9, 0),
(CURRENT_DATE - 20, CURRENT_DATE - 13, CURRENT_DATE - 13, 4, 13, 0),
(CURRENT_DATE - 10, CURRENT_DATE - 3, NULL, 5, 18, 0),
(CURRENT_DATE - 30, CURRENT_DATE - 23, CURRENT_DATE - 20, 6, 21, 45.00),
(CURRENT_DATE - 1, CURRENT_DATE + 6, NULL, 7, 1, 0),
(CURRENT_DATE - 12, CURRENT_DATE - 5, CURRENT_DATE - 5, 8, 4, 0),
(CURRENT_DATE - 4, CURRENT_DATE + 3, NULL, 9, 10, 0),
(CURRENT_DATE - 25, CURRENT_DATE - 18, CURRENT_DATE - 15, 10, 14, 45.00);

CREATE TABLE reserva (
    id serial primary key,
    data date default current_date,
    validade date default current_date + interval '7 days',
    livro_id integer references livro (id),
    usuario_id integer references usuario (id)
);


INSERT INTO reserva (data, validade, livro_id, usuario_id) VALUES
(CURRENT_DATE, CURRENT_DATE + 7, 2, 1),
(CURRENT_DATE - 1, CURRENT_DATE + 6, 5, 3),
(CURRENT_DATE - 2, CURRENT_DATE + 5, 8, 4),
(CURRENT_DATE, CURRENT_DATE + 7, 1, 6),
(CURRENT_DATE - 3, CURRENT_DATE + 4, 10, 7),
(CURRENT_DATE, CURRENT_DATE + 7, 3, 9),
(CURRENT_DATE - 1, CURRENT_DATE + 6, 6, 10);





