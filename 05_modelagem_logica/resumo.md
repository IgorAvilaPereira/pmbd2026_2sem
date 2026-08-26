# Mapeamento do Modelo ER para o Modelo Relacional

## 1. Entidades → Tabelas

Cada **entidade** do modelo ER se torna uma **tabela** no modelo relacional.

**Regra:**

* A entidade vira uma tabela.
* Os atributos viram colunas.
* A chave primária da entidade vira **PRIMARY KEY** da tabela.

### Exemplo

**Modelo ER**

Entidade:
Aluno

* matrícula (PK)
* nome
* email

**Modelo Relacional**

```
ALUNO(
    matricula PK,
    nome,
    email
)
```

---

## 2. Atributos → Colunas

Tipos de atributos:

### Atributo simples

Vira uma coluna normal.

Ex:

```
nome
idade
cpf
```

---

### Atributo composto

Pode ser **quebrado em vários atributos**.

Exemplo:

Endereço

* rua
* número
* cidade

Tabela:

```
ALUNO(
   matricula PK,
   rua,
   numero,
   cidade
)
```

---

### Atributo multivalorado

Vira **uma nova tabela**.

Exemplo:

Aluno
telefone (multivalorado)

Tabela:

```
ALUNO(
   matricula PK,
   nome
)

TELEFONE(
   matricula FK,
   telefone,
   PK(matricula, telefone)
)
```

---

## 3. Relacionamentos

Depende da **cardinalidade**.

---

# Relacionamento 1:1

Pode ser resolvido colocando uma **FK em uma das tabelas**.

Exemplo:

Pessoa — possui — Passaporte

```
PESSOA(
   id PK,
   nome
)

PASSAPORTE(
   numero PK,
   id_pessoa FK
)
```

---

# Relacionamento 1:N

A **chave estrangeira fica no lado N**.

Exemplo:

Curso 1 —— N Aluno

```
CURSO(
   id PK,
   nome
)

ALUNO(
   matricula PK,
   nome,
   id_curso FK
)
```

---

# Relacionamento N:N

Cria-se **uma nova tabela associativa**.

Exemplo:

Aluno N —— N Disciplina

```
ALUNO(
   matricula PK,
   nome
)

DISCIPLINA(
   id PK,
   nome
)

ALUNO_DISCIPLINA(
   matricula FK,
   id_disciplina FK,
   PK(matricula, id_disciplina)
)
```

Essa tabela representa o relacionamento.

---

# Relacionamentos com atributos

Se o relacionamento possui atributos, ele **vira uma tabela própria**.

Exemplo:

Aluno — cursa — Disciplina

Atributo do relacionamento: **nota**

```
ALUNO_DISCIPLINA(
   matricula FK,
   id_disciplina FK,
   nota,
   PK(matricula, id_disciplina)
)
```

---

# Entidades fracas

A chave depende de outra entidade.

Exemplo:

Pedido
ItemPedido

```
PEDIDO(
   id PK
)

ITEM_PEDIDO(
   id_pedido FK,
   numero_item,
   produto,
   PK(id_pedido, numero_item)
)
```

---

# Resumo das Regras

| ER                     | Modelo Relacional     |
| ---------------------- | --------------------- |
| Entidade               | Tabela                |
| Atributo               | Coluna                |
| Chave                  | Primary Key           |
| Relacionamento 1:N     | FK no lado N          |
| Relacionamento 1:1     | FK em uma das tabelas |
| Relacionamento N:N     | Nova tabela           |
| Atributo multivalorado | Nova tabela           |
| Entidade fraca         | PK composta           |

---


* **tabela**
* **coluna**
* **chave**


