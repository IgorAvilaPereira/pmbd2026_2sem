# Lista de Exercícios — ER, Modelo Relacional e SQL PostgreSQL

## Parte 1 — Modelo Entidade-Relacionamento (ER)

### Exercício 1 — Identificação de entidades

Uma biblioteca deseja armazenar informações sobre:

* livros;
* autores;
* editoras;
* leitores;
* empréstimos.

Para cada elemento:

1. Identifique as entidades.
2. Indique quais são entidades fortes.
3. Defina um identificador para cada entidade.
4. Liste pelo menos três atributos para cada entidade.

---

### Exercício 2 — Entidade forte

Uma empresa possui funcionários. Cada funcionário possui:

* matrícula;
* nome;
* CPF;
* data de nascimento;
* salário.

Modele a entidade `Funcionario`.

Indique:

* entidade;
* identificador;
* atributos simples;
* possíveis restrições.

---

### Exercício 3 — Atributos compostos

Um sistema de cadastro de clientes precisa armazenar o endereço completo:

* logradouro;
* número;
* complemento;
* bairro;
* cidade;
* estado;
* CEP.

Modele o atributo `Endereco` como um **atributo composto**.

Depois responda:

1. Quais são os subatributos?
2. Como esse atributo poderia ser representado no modelo relacional?

---

### Exercício 4 — Atributos multivalorados

Um professor pode possuir vários números de telefone.

Modele:

* `Professor`;
* `Telefone`.

O atributo `telefone` deve ser tratado como **multivalorado**.

Explique como esse atributo deverá ser convertido para o modelo relacional.

---

### Exercício 5 — Atributos derivados

Um aluno possui:

* código;
* nome;
* data de nascimento.

A idade deve ser obtida a partir da data de nascimento.

1. Qual é o atributo derivado?
2. Ele deve ser armazenado diretamente na tabela?
3. Como poderia ser obtido no PostgreSQL?

---

## Parte 2 — Relacionamentos

### Exercício 6 — Relacionamento 1:N

Uma empresa possui vários departamentos.

Cada funcionário pertence a um único departamento.

Modele:

* `Funcionario`;
* `Departamento`;
* relacionamento entre as entidades.

Indique:

* cardinalidade;
* participação;
* onde ficará a chave estrangeira no modelo relacional.

---

### Exercício 7 — Relacionamento N:M

Uma universidade possui:

* alunos;
* disciplinas.

Um aluno pode cursar várias disciplinas e uma disciplina pode possuir vários alunos.

Modele o relacionamento.

Além disso, o relacionamento deve armazenar:

* data da matrícula;
* nota;
* frequência.

1. Qual é a cardinalidade?
2. Existe uma entidade associativa?
3. Quais serão as PKs e FKs?

---

### Exercício 8 — Relacionamento 1:1

Uma empresa possui funcionários e cada funcionário pode possuir, no máximo, um crachá.

Cada crachá pertence a exatamente um funcionário.

Modele:

* `Funcionario`;
* `Cracha`.

Determine onde deverá ficar a FK.

---

### Exercício 9 — Relacionamento recursivo

Uma empresa possui funcionários.

Um funcionário pode ser responsável por vários outros funcionários, mas cada funcionário possui no máximo um responsável.

Modele o relacionamento recursivo.

Indique:

* cardinalidade;
* FK;
* referência para a própria tabela.

---

### Exercício 10 — Entidade fraca

Considere:

* `Empregado(CPF, nome)`
* `Dependente(nome, data_nascimento, parentesco)`

Um dependente somente pode existir associado a um empregado.

O nome do dependente é apenas um identificador parcial.

1. Identifique a entidade forte.
2. Identifique a entidade fraca.
3. Identifique o identificador parcial.
4. Determine a chave primária de `Dependente`.
5. Represente o modelo relacional.

O material utiliza justamente a combinação **PK da entidade forte + identificador parcial da entidade fraca** para formar a identificação única. 

---

# Parte 3 — Conversão ER → Modelo Relacional

### Exercício 11 — Conversão de entidade forte

Transforme o seguinte modelo em modelo relacional:

**Cliente**

* id_cliente;
* nome;
* CPF;
* email;
* data_nascimento.

Defina:

* nome da tabela;
* PK;
* tipos de dados;
* restrições.

---

### Exercício 12 — Conversão 1:N

Considere:

**Departamento**

* id_departamento;
* nome.

**Funcionario**

* id_funcionario;
* nome;
* salario.

Relacionamento:

> Um departamento possui vários funcionários e um funcionário pertence a um departamento.

Transforme o modelo ER em tabelas relacionais.

---

### Exercício 13 — Conversão N:M

Considere:

**Aluno**

* id_aluno;
* nome.

**Disciplina**

* id_disciplina;
* nome.

Relacionamento:

> Aluno cursa Disciplina.

O relacionamento possui:

* nota;
* frequência.

Transforme para o modelo relacional.

---

### Exercício 14 — Conversão de atributo multivalorado

Considere:

**Professor**

* id_professor;
* nome.

Um professor pode possuir vários telefones.

Crie o modelo relacional correspondente.

---

### Exercício 15 — Conversão de relacionamento recursivo

Considere:

**Funcionario**

* id_funcionario;
* nome.

Um funcionário pode possuir um gerente.

Transforme o modelo para o modelo relacional.

---

### Exercício 16 — Conversão de entidade fraca

Considere:

**Pedido**

* id_pedido;
* data.

**ItemPedido**

* numero_item;
* quantidade;
* valor.

`ItemPedido` é uma entidade fraca identificada pelo pedido e pelo número do item.

Crie as tabelas correspondentes.

---

# Parte 4 — DDL PostgreSQL

## Exercício 17 — CREATE TABLE básico

Crie uma tabela:

```text
produto
```

com:

* id;
* nome;
* descrição;
* preço;
* estoque.

Defina:

* PK;
* `NOT NULL`;
* `CHECK` para impedir preço negativo;
* `CHECK` para impedir estoque negativo.

---

## Exercício 18 — Chave estrangeira

Crie:

```text
departamento
funcionario
```

Um funcionário deve pertencer a um departamento.

Utilize uma `FOREIGN KEY`.

---

## Exercício 19 — Restrições

Crie uma tabela `usuario` contendo:

* id;
* nome;
* email;
* senha;
* idade.

Utilize:

* `PRIMARY KEY`;
* `NOT NULL`;
* `UNIQUE`;
* `CHECK`.

---

## Exercício 20 — Tabela N:M

Crie:

```text
aluno
disciplina
matricula
```

A tabela `matricula` deverá possuir:

* `id_aluno`;
* `id_disciplina`;
* `data_matricula`;
* `nota`;
* `frequencia`.

Utilize uma **PK composta**.

---

## Exercício 21 — ON DELETE

Crie `professor` e `professor_telefone`.

Configure a FK para que, ao excluir um professor, seus telefones também sejam excluídos.

Utilize:

```sql
ON DELETE CASCADE
```

---

## Exercício 22 — ON DELETE SET NULL

Crie a tabela `aluno` com um relacionamento recursivo:

```text
id_aluno_representante
```

Ao excluir o aluno que atua como representante, o campo dos demais alunos deve se tornar `NULL`.

---

# Parte 5 — INSERT

### Exercício 23 — Inserção de registros

Insira pelo menos:

* 5 alunos;
* 3 professores;
* 4 disciplinas;
* 3 turmas.

---

### Exercício 24 — Inserção com FK

Insira registros em `matricula`, relacionando alunos e disciplinas.

Insira pelo menos 8 matrículas.

---

### Exercício 25 — Inserção inválida

Tente inserir:

1. um aluno sem nome;
2. dois alunos com o mesmo CPF;
3. uma matrícula para um aluno inexistente;
4. uma nota maior que 10;
5. uma frequência menor que 0.

Observe os erros produzidos pelo PostgreSQL.

---

# Parte 6 — SELECT Básico

### Exercício 26

Liste todos os alunos.

---

### Exercício 27

Liste somente:

* nome;
* CPF;
* data de nascimento.

---

### Exercício 28

Liste os alunos nascidos depois de `2000-01-01`.

---

### Exercício 29

Liste os alunos cujo nome começa com a letra `A`.

Utilize:

```sql
LIKE
```

---

### Exercício 30

Liste os alunos cujo nome contém a palavra `"Silva"`.

---

### Exercício 31

Liste os produtos com preço entre R$ 50 e R$ 200.

Utilize:

```sql
BETWEEN
```

---

### Exercício 32

Liste os alunos cujo CPF esteja entre determinados valores utilizando:

```sql
IN
```

---

### Exercício 33

Liste os registros que possuem algum campo `NULL`.

Utilize:

```sql
IS NULL
```

---

# Parte 7 — ORDER BY, LIMIT e DISTINCT

### Exercício 34

Liste os produtos ordenados pelo preço crescente.

---

### Exercício 35

Liste os produtos ordenados pelo preço decrescente.

---

### Exercício 36

Mostre os 5 produtos mais caros.

Utilize:

```sql
ORDER BY
LIMIT
```

---

### Exercício 37

Liste as cidades dos alunos sem repetir cidades.

Utilize:

```sql
DISTINCT
```

---

# Parte 8 — UPDATE e DELETE

### Exercício 38

Aumente em 10% o preço de todos os produtos.

---

### Exercício 39

Atualize o endereço de um aluno específico.

---

### Exercício 40

Altere a frequência de uma matrícula específica.

---

### Exercício 41

Exclua um aluno específico.

Observe o comportamento das tabelas relacionadas.

---

### Exercício 42

Exclua todos os produtos cujo estoque seja zero.

---

# Parte 9 — Funções de agregação

### Exercício 43

Informe:

* quantidade de alunos;
* quantidade de professores;
* quantidade de disciplinas.

Utilize:

```sql
COUNT()
```

---

### Exercício 44

Calcule:

* maior salário;
* menor salário;
* salário médio;
* soma dos salários.

Utilize:

```sql
MAX()
MIN()
AVG()
SUM()
```

---

### Exercício 45

Calcule a média das notas dos alunos.

---

### Exercício 46

Conte quantos alunos estão matriculados em cada disciplina.

Utilize:

```sql
GROUP BY
```

---

### Exercício 47

Mostre somente as disciplinas que possuem mais de 5 alunos.

Utilize:

```sql
HAVING
```

---

# Parte 10 — JOIN

### Exercício 48 — INNER JOIN

Liste:

```text
nome do funcionário
nome do departamento
```

utilizando `INNER JOIN`.

---

### Exercício 49 — JOIN com três tabelas

Liste:

```text
aluno
disciplina
nota
```

utilizando:

```text
aluno → matricula → disciplina
```

---

### Exercício 50 — LEFT JOIN

Liste todos os alunos, inclusive aqueles que não possuem nenhuma matrícula.

---

### Exercício 51 — Professor e disciplinas

Liste:

```text
professor
disciplina
```

incluindo professores que ainda não possuem disciplinas associadas.

---

# Parte 11 — Subconsultas

### Exercício 52

Liste os funcionários que recebem salário acima da média salarial.

---

### Exercício 53

Liste os alunos que possuem nota acima da média geral.

---

### Exercício 54

Liste os alunos que nunca realizaram uma matrícula.

Resolva utilizando uma subconsulta.

---

### Exercício 55

Liste os produtos cujo preço seja maior que o preço médio dos produtos.

---

# Parte 12 — Views

### Exercício 56

Crie uma view:

```text
vw_alunos
```

contendo:

* id;
* nome;
* CPF;
* idade.

A idade deverá ser calculada a partir da data de nascimento.

O material apresenta justamente o uso de `VIEW` para representar um atributo derivado, utilizando `AGE()`. 

---

### Exercício 57

Crie uma view:

```text
vw_boletim
```

contendo:

```text
aluno
disciplina
nota
frequencia
```

---

# Parte 13 — Exercícios integradores

### Exercício 58 — Sistema acadêmico

Modele e implemente um sistema acadêmico contendo:

* alunos;
* professores;
* disciplinas;
* turmas;
* matrículas;
* telefones dos professores.

O sistema deverá contemplar:

* entidade forte;
* atributo multivalorado;
* relacionamentos 1:N;
* relacionamento N:M;
* entidade associativa;
* PK composta;
* FK.

Depois:

1. faça o DER;
2. faça o modelo relacional;
3. crie o script PostgreSQL;
4. insira dados;
5. faça consultas utilizando `JOIN`.

---

### Exercício 59 — Sistema de biblioteca

Uma biblioteca possui:

* livros;
* autores;
* editoras;
* leitores;
* empréstimos.

Regras:

* um livro pertence a uma editora;
* uma editora possui vários livros;
* um livro pode possuir vários autores;
* um autor pode escrever vários livros;
* um leitor pode realizar vários empréstimos;
* cada empréstimo possui data de retirada e data de devolução.

Faça:

1. DER;
2. modelo relacional;
3. script `CREATE TABLE`;
4. script `INSERT`;
5. consultas utilizando `JOIN`;
6. consultas utilizando `GROUP BY`.

---

### Exercício 60 — Sistema de vendas

Modele um sistema contendo:

* cliente;
* produto;
* pedido;
* item_pedido.

Um pedido pertence a um cliente e possui vários produtos.

O relacionamento entre `pedido` e `produto` deve armazenar:

* quantidade;
* preço unitário.

Depois:

1. faça o DER;
2. transforme para o modelo relacional;
3. crie as tabelas;
4. insira pelo menos 10 produtos;
5. insira pelo menos 5 clientes;
6. crie pedidos;
7. consulte o valor total de cada pedido.

---

# Parte 14 — Desafios SQL

### Desafio 61 — Relatório de alunos

Crie uma consulta que mostre:

```text
Aluno | Quantidade de disciplinas | Média das notas
```

Ordene pela média decrescente.

---

### Desafio 62 — Ranking de alunos

Crie uma consulta que apresente:

```text
posição | aluno | média
```

Utilize uma função de janela, como:

```sql
RANK()
```

---

### Desafio 63 — Alunos sem matrícula

Apresente três soluções diferentes para encontrar alunos sem matrícula:

1. `LEFT JOIN`;
2. `NOT EXISTS`;
3. `NOT IN`.

---

### Desafio 64 — Melhor aluno de cada disciplina

Para cada disciplina, mostre o aluno com a maior nota.

---

### Desafio 65 — Relatório completo

Crie um relatório contendo:

```text
Aluno
Quantidade de disciplinas
Média
Maior nota
Menor nota
Frequência média
```

Ordene pela média decrescente.

---

# Desafio final — Projeto completo

### Exercício 66 — Sistema de universidade

Uma universidade deseja um banco de dados para controlar alunos, professores, cursos, disciplinas, turmas e matrículas.

O sistema deve permitir:

* cadastrar alunos;
* cadastrar professores;
* cadastrar cursos;
* cadastrar disciplinas;
* associar disciplinas aos cursos;
* criar turmas;
* associar professores às turmas;
* matricular alunos;
* registrar notas;
* registrar frequência.

O aluno pode possuir vários telefones.

Um professor pode possuir vários telefones.

Um curso possui várias disciplinas.

Uma disciplina pode pertencer a vários cursos.

Uma turma pertence a uma disciplina.

Um professor pode ministrar várias turmas.

Uma turma possui vários alunos.

A matrícula deve registrar:

* data;
* nota;
* frequência.

### Entregáveis

**1. Modelo conceitual**

Desenvolva o DER identificando:

* entidades;
* atributos;
* identificadores;
* cardinalidades;
* relacionamentos;
* entidades associativas;
* atributos multivalorados.

**2. Modelo relacional**

Apresente todas as tabelas indicando:

```text
PK
FK
NOT NULL
UNIQUE
CHECK
```

**3. Script PostgreSQL**

Implemente todo o banco utilizando:

```sql
CREATE TABLE
ALTER TABLE
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
CHECK
```

**4. Massa de dados**

Insira dados suficientes para testar o sistema.

**5. Consultas básicas**

Faça pelo menos 10 consultas utilizando:

* `SELECT`;
* `WHERE`;
* `ORDER BY`;
* `LIKE`;
* `IN`;
* `BETWEEN`;
* `IS NULL`;
* `DISTINCT`;
* `LIMIT`.

**6. Consultas com JOIN**

Faça pelo menos 5 consultas utilizando:

* `INNER JOIN`;
* `LEFT JOIN`;
* múltiplos `JOINs`.

**7. Consultas agregadas**

Faça pelo menos 5 consultas utilizando:

* `COUNT`;
* `SUM`;
* `AVG`;
* `MIN`;
* `MAX`;
* `GROUP BY`;
* `HAVING`.

**8. Consultas avançadas**

Faça pelo menos 3 consultas utilizando:

* subconsulta;
* `NOT EXISTS`;
* função de janela ou `CTE`.

**9. View**

Crie pelo menos uma `VIEW` para apresentar um relatório acadêmico.


