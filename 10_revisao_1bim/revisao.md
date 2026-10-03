# Guia Integrado de Estudo: Modelagem ER, Modelo Relacional e Implementação no PostgreSQL

## Parte 1: Modelagem Conceitual (Diagrama Entidade-Relacionamento)

A etapa conceitual descreve os dados sob a perspectiva do negócio de forma independente de software ou SGBD.

```
+-----------------------------------------------------------------------+
|                         MODELO CONCEITUAL (ER)                        |
|                                                                       |
|  +------------------+         ( 1:N )         +--------------------+  |
|  |     EMPREGADO    |-------------------------<|     DEPENDENTE     |  |
|  +------------------+                         +--------------------+  |
|  | (Identificador)  |                         |  (Identificador    |  |
|  | CPF              |                         |   Parcial) Nome    |  |
|  | Nome             |                         |  DataNascimento    |  |
|  +------------------+                         +--------------------+  |
|           |                                              |            |
|     [Entidade Forte]                             [Entidade Fraca]     |
+-----------------------------------------------------------------------+

```

### 1. Tipos de Entidades

* **Entidade Forte (Regular):** Existe por si só e possui ao menos um **atributo identificador**. *Gráfico: Retângulo simples.*
* **Entidade Fraca:** Não possui atributo identificador próprio por si só. Depende de uma entidade forte (proprietária) para sua identificação e existência. O relacionamento identificador é obrigatoriamente $1:N$ (com o $N$ no lado fraco) e possui **participação total**. *Gráfico: Retângulo duplo (entidade) e losango duplo (relacionamento).*
* **Entidade Associativa:** Surge da necessidade de associar um relacionamento $N:M$ a outra entidade, ou para carregar atributos próprios de um fato/evento.

### 2. Classificação dos Atributos

* **Atributo Identificador (Forte/Total):** Identifica unicamente uma instância de uma entidade forte. *Gráfico: Elipse com texto sublinhado com linha contínua.*
* **Atributo Parcial (Identificador Parcial / Discriminador):** Distingue instâncias de uma entidade fraca associadas a uma *mesma* entidade forte. *Gráfico: Elipse com texto sublinhado pontilhado.*
* **Atributo Simples (Monovalorado):** Armazena um único valor por registro. *Gráfico: Elipse simples.*
* **Atributo Composto:** Pode ser subdividido em sub-atributos (ex: `Endereco` $\rightarrow$ `Rua`, `Numero`, `Bairro`). *Gráfico: Elipse derivada.*
* **Atributo Multivalorado:** Armazena múltiplos valores simultaneamente (ex: `Telefones`). *Gráfico: Elipse com borda dupla.*
* **Atributo Derivado:** Valor calculado a partir de outros campos (ex: `Idade` derivada de `DataNascimento`). *Gráfico: Elipse pontilhada.*

### 3. Identificação da Entidade Fraca

Como a entidade fraca não possui atributo identificador próprio, a determinação única de uma instância depende da combinação:

$$\text{Identificação Única} = \text{Identificador da Entidade Forte} + \text{Identificador Parcial da Entidade Fraca}$$

#### Exemplo: `Empregado` x `Dependente`

O `Empregado` possui o identificador `CPF`. O `Dependente` possui o identificador parcial `Nome`.

| `CPF` (Identificador da Forte) | `Nome` (Identificador Parcial) | Data Nascimento |
| --- | --- | --- |
| `000.000.000-00` | Pedro | 10/05/2015 |
| **`000.000.000-00`** | **João** | 12/08/2018 |
| `111.111.111-11` | Fernando | 01/02/2012 |
| **`111.111.111-11`** | **João** | 05/09/2020 |

> Dois dependentes podem possuir o identificador parcial `João`, mas são univocamente distinguidos no sistema ao concatenar com o `CPF` da entidade forte proprietária.


## Parte 2: Modelo Lógico Relacional (Regras de Conversão)

Na etapa lógica, os conceitos abstratos do DER são traduzidos para o paradigma relacional: **tabelas, colunas, chaves primárias (PK) e chaves estrangeiras (FK)**.

```
+-----------------------------------------------------------------------+
|                        MODELO LÓGICO (RELACIONAL)                     |
|                                                                       |
|  +----------------------------+       +----------------------------+  |
|  |     tb_empregado           |       |     tb_dependente          |  |
|  +----------------------------+       +----------------------------+  |
|  | PK | cpf_empregado         |---+   | PK,FK1 | cpf_empregado     |  |
|  |    | nome                  |   +-->| PK     | nome_dependente   |  |
|  +----------------------------+       |        | data_nascimento   |  |
|                                       +----------------------------+  |
+-----------------------------------------------------------------------+

```

### Regras de Mapeamento (Conceitual $\rightarrow$ Lógico)

1. **Entidade Forte:** Vira tabela. O *atributo identificador* vira **Chave Primária (PK)**.
2. **Entidade Fraca:** Vira tabela. A **Chave Primária (PK)** será composta pela **Chave Estrangeira (FK)** oriunda da entidade forte + o *identificador parcial* da entidade fraca.
3. **Relacionamento $1:N$:** A PK do lado "1" entra como **FK** no lado "N". Atributos do relacionamento acompanham a FK.
4. **Relacionamento $N:M$:** Vira uma tabela intermediária. As PKs das entidades envolvidas entram como FKs e, juntas, formam a PK composta dessa tabela.
5. **Relacionamento $1:1$:** A PK de uma tabela vira FK na outra. A tabela com **participação total** deve receber a FK para evitar valores nulos.
6. **Relacionamentos Recursivos:** Geram uma FK na própria tabela apontando para sua própria PK.
7. **Atributos Multivalorados:** Viram tabelas separadas com PK composta por `(FK_Entidade + Atributo)`.
8. **Atributos Compostos:**
* *Abordagem Clássica:* Desmembrados em colunas simples na própria tabela.
* *Abordagem Prática:* Viram uma nova tabela separada ligada por $1:N$ via FK.


9. **Atributos Derivados:** Não são mapeados como colunas comuns. Convertem-se em `VIEW`s ou colunas geradas.
10. **Especialização / Generalização:**
* *Tabela Única:* Uma tabela com colunas de todas as subclasses + coluna discriminadora (`tipo`).
* *Tabelas Separadas por Subclasse:* Tabela pai com atributos comuns e PK; tabelas filhas contendo atributos específicos e a PK do pai atuando como PK e FK simultaneamente.
* *Tabelas Totalmente Separadas:* Tabelas independentes para cada subclasse concreta com todos os atributos acumulados.


## Parte 3: Implementação Física (SQL no PostgreSQL)

Mapeamento final do modelo lógico para scripts DDL (`CREATE TABLE`, `CREATE VIEW` e restrições no PostgreSQL).

```sql
-- ============================================================================
-- 1. ENTIDADES FORTES & ATRIBUTOS MULTIVALORADOS
-- ============================================================================

-- Entidade Forte: Professor (Identificador 'id_professor' vira PK)
CREATE TABLE professor (
    id_professor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Atributo Multivalorado: Telefone do Professor
CREATE TABLE professor_telefone (
    id_professor INT NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_professor, telefone),
    CONSTRAINT fk_prof_tel FOREIGN KEY (id_professor) 
        REFERENCES professor(id_professor) ON DELETE CASCADE
);

-- Entidade Forte: Aluno (Atributo Composto 'Endereco' desmembrado em colunas)
CREATE TABLE aluno (
    id_aluno SERIAL PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    -- Atributo Composto
    logradouro VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    -- Relacionamento Recursivo
    id_aluno_representante INT,
    CONSTRAINT fk_aluno_rep FOREIGN KEY (id_aluno_representante) 
        REFERENCES aluno(id_aluno) ON DELETE SET NULL
);

-- Atributo Derivado: Mapeado como VIEW no PostgreSQL
CREATE VIEW vw_aluno_detalhes AS
SELECT 
    id_aluno,
    nome,
    data_nascimento,
    AGE(CURRENT_DATE, data_nascimento) AS idade
FROM aluno;

-- ============================================================================
-- 2. ENTIDADES FRACAS & RELACIONAMENTOS 1:N
-- ============================================================================

-- Entidade Fraca: Contato do Aluno
-- PK Composta = FK (id_aluno) + Identificador Parcial (nome_contato)
CREATE TABLE contato_aluno (
    id_aluno INT NOT NULL,
    nome_contato VARCHAR(100) NOT NULL, -- Identificador parcial no ER
    parentesco VARCHAR(30),
    telefone VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_aluno, nome_contato),
    CONSTRAINT fk_contato_aluno FOREIGN KEY (id_aluno) 
        REFERENCES aluno(id_aluno) ON DELETE CASCADE
);

-- Relacionamento 1:N: Turma
CREATE TABLE turma (
    id_turma SERIAL PRIMARY KEY,
    codigo_turma VARCHAR(10) NOT NULL,
    semestre VARCHAR(6) NOT NULL
);

-- Relacionamento 1:N: Disciplina
CREATE TABLE disciplina (
    id_disciplina SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_turma INT NOT NULL,
    id_professor INT,
    CONSTRAINT fk_disc_turma FOREIGN KEY (id_turma) REFERENCES turma(id_turma),
    CONSTRAINT fk_disc_prof FOREIGN KEY (id_professor) REFERENCES professor(id_professor) ON DELETE SET NULL
);

-- ============================================================================
-- 3. RELACIONAMENTOS N:M & ENTIDADES ASSOCIATIVAS
-- ============================================================================

-- Entidade Associativa / Relacionamento N:M: Matricula (Aluno x Turma)
CREATE TABLE matricula (
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE DEFAULT CURRENT_DATE,
    nota NUMERIC(4, 2) CHECK (nota >= 0 AND nota <= 10),
    frequencia NUMERIC(5, 2) CHECK (frequencia >= 0 AND frequencia <= 100),
    PRIMARY KEY (id_aluno, id_turma),
    CONSTRAINT fk_mat_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno) ON DELETE CASCADE,
    CONSTRAINT fk_mat_turma FOREIGN KEY (id_turma) REFERENCES turma(id_turma) ON DELETE CASCADE
);

```
