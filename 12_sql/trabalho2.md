# Trabalho 2 – Sistema de Biblioteca com Java + JDBC + PostgreSQL (6 pontos)

## Objetivo

Estender o sistema de biblioteca criando uma aplicação Java integrada ao PostgreSQL utilizando:

* Maven
* JDBC
* DriverManager
* pacote `java.sql`
* classe `Scanner`

A aplicação deverá executar consultas SQL diretamente pelo sistema Java.

---

# Requisitos Obrigatórios

O trabalho deve obrigatoriamente utilizar:

* Java
* Maven
* PostgreSQL
* JDBC
* DriverManager
* `java.sql`
* `Scanner`

Também deverá possuir:

* menu textual no terminal
* tratamento de exceções
* consultas parametrizadas com `PreparedStatement`

---

# Questões

## Questão 1 – Conexão JDBC e Estrutura do Projeto (1,0 ponto)

Criar um projeto Maven em Java conectado ao PostgreSQL utilizando JDBC.

O projeto deve conter:

* arquivo `pom.xml`
* dependência JDBC PostgreSQL
* classe de conexão utilizando `DriverManager`
* uso de:

  * `Connection`
  * `PreparedStatement`
  * `ResultSet`
* menu textual utilizando `Scanner`

---

## Questão 2 – Consultas com SELECT, WHERE e ORDER BY (1,0 ponto)

Implementar funcionalidades de consulta no sistema utilizando:

* `SELECT`
* `WHERE`
* `ORDER BY`

Exemplos possíveis:

* buscar livros por categoria
* listar leitores em ordem alfabética
* listar empréstimos por data

As consultas devem ser executadas pelo Java e exibidas no terminal.

---

## Questão 3 – UPDATE e DELETE (1,0 ponto)

Implementar funcionalidades de alteração e remoção de dados no sistema.

A aplicação deve possuir pelo menos:

* uma operação utilizando `UPDATE`
* uma operação utilizando `DELETE`

Exemplos possíveis:

* alterar status de exemplar
* atualizar dados de leitor
* excluir empréstimos

---

## Questão 4 – Datas e CASE WHEN (1,0 ponto)

Implementar consultas envolvendo:

* manipulação de datas
* `CASE WHEN`

Exemplos possíveis:

* empréstimos atrasados
* cálculo de dias emprestados
* classificação de empréstimos como:

  * “Em Dia”
  * “Atrasado”

---

## Questão 5 – JOINs e Relatórios (2,0 ponto)

Implementar consultas utilizando JOIN entre tabelas do sistema.

As consultas devem relacionar informações do banco.

Exemplos possíveis:

* empréstimos com leitor e livro
* livros e categorias
* livros e autores

Os resultados devem ser exibidos formatados no terminal.

---

# Entrega

O aluno deverá entregar:

1. Projeto Maven completo
2. Código-fonte Java
3. Arquivo `pom.xml`
4. Script SQL do banco
5. Prints da execução
6. Relatório simples contendo:

   * funcionalidades implementadas
   * consultas SQL utilizadas
   * dificuldades encontradas

---

# Observações

* O trabalho deve funcionar com PostgreSQL.
* Não será aceito uso de ORM (Hibernate/JPA).
* As consultas SQL devem ser implementadas manualmente.
* O uso de `PreparedStatement` é obrigatório.
* Trabalhos sem Maven terão desconto.
* Trabalhos sem JDBC terão nota zero.
* As consultas devem ser desenvolvidas pelos próprios alunos.

