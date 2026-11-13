# **Material de aula – PostgreSQL: consultas, filtros e manipulação de dados**

PMBD – Programação e Manipulação de Banco de Dados | PostgreSQL / psql

Este material apresenta os principais comandos utilizados para consultar, filtrar, inserir alterações, atualizar e excluir dados em bancos de dados PostgreSQL. Também aborda operações com datas, valores nulos, transações e integridade referencial por meio de chaves estrangeiras (`FOREIGN KEY`).

Os exemplos utilizam principalmente as tabelas `usuario`, `livro`, `autor`, `emprestimo` e `reserva`, considerando o banco de dados `biblioteca_pmbd2026_2sem`.

# **1. Conexão e exploração do banco de dados**

Antes de executar consultas, precisamos selecionar o banco de dados e conhecer sua estrutura.

## **1.1. Conectar a um banco de dados**

```
\c biblioteca_pmbd2026_2sem
```

O comando `\c` (ou `\connect`) é um metacomando do PostgreSQL que permite conectar a outro banco de dados.

## **1.2. Listar as tabelas**

```
\dt
```

Apresenta as tabelas existentes no banco de dados conectado.

## **1.3. Consultar a estrutura de uma tabela**

```
\d usuario
```

Exibe informações sobre a tabela `usuario`, incluindo:

- Nome das colunas;
- Tipos de dados;
- Restrições;
- Chaves primárias;
- Chaves estrangeiras;
- Valores padrão.

Também podemos consultar outras tabelas:

```
\d leitor
\d usuario
```

## **1.4. Consultar a documentação dos comandos**

```
\h SELECT
```

Apresenta a documentação da instrução SQL `SELECT` diretamente no terminal do PostgreSQL.

Para sair do terminal:

```
\q
```

**Atenção:** `\c`, `\dt`, `\d`, `\h` e `\q` são metacomandos do cliente `psql`, não comandos SQL convencionais.

# **2. Consultas com SELECT**

O comando `SELECT` permite recuperar informações armazenadas nas tabelas.

## **2.1. Consultar todos os registros**

```
SELECT * FROM usuario;
```

O caractere `*` representa todas as colunas da tabela.

Também podemos consultar outras tabelas:

```
SELECT * FROM livro;
SELECT * FROM emprestimo;
SELECT * FROM autor;
```

## **2.2. Filtrar registros com WHERE**

A cláusula `WHERE` permite estabelecer condições para selecionar registros.

```
SELECT *
FROM usuario
WHERE nome = 'Ana';
```

Nesse caso, serão retornados apenas os registros cujo nome seja exatamente `Ana`.

Observe a diferença:

```
SELECT * FROM usuario WHERE nome = 'Ana';

SELECT * FROM usuario WHERE nome = 'Ana Silva';

SELECT * FROM usuario WHERE nome = 'Ana silva';
```

O operador `=` realiza uma comparação exata e, no PostgreSQL, diferencia letras maiúsculas de minúsculas para valores textuais.

# **3. Pesquisa textual com LIKE e ILIKE**

Os operadores `LIKE` e `ILIKE` permitem realizar pesquisas utilizando padrões de texto.

- `LIKE`: diferencia letras maiúsculas de minúsculas.
- `ILIKE`: não diferencia letras maiúsculas de minúsculas (recurso do PostgreSQL).

## **3.1. Utilizando o caractere %**

O caractere `%` representa uma sequência de zero ou mais caracteres.

```
SELECT *
FROM usuario
WHERE nome ILIKE 'Ana%';
```

Retorna nomes que começam com Ana, independentemente de maiúsculas ou minúsculas.

Exemplos de padrões:

| Padrão         | Significado                    |
| -------------- | ------------------------------ |
| `'Ana%'`       | Começa com Ana                 |
| `'%Ana'`       | Termina com Ana                |
| `'%Ana%'`      | Contém Ana em qualquer posição |
| `'A%'`         | Começa com A                   |
| `'%gmail.com'` | Termina com gmail.com          |

Comparando `LIKE` e `ILIKE`:

```
SELECT *
FROM usuario
WHERE nome LIKE 'ANA%';
```

Essa consulta diferencia maiúsculas e minúsculas.

```
SELECT *
FROM usuario
WHERE nome ILIKE 'ANA%';
```

Essa consulta também encontrará nomes iniciados por `Ana`, `ANA`, `ana` etc.

## **3.2. Utilizando o caractere \_**

O caractere `_` representa exatamente um caractere qualquer.

```
SELECT *
FROM usuario
WHERE nome ILIKE 'A_a%';
```

O padrão exige:

- Primeiro caractere: A;
- Segundo caractere: qualquer caractere;
- Terceiro caractere: a;
- Demais caracteres: qualquer sequência.

Outro exemplo:

```
SELECT *
FROM usuario
WHERE nome ILIKE 'A__%';
```

Nesse caso, o nome deve começar com A, seguido de pelo menos dois caracteres quaisquer.

**Resumo dos curingas:**

| Caractere | Significado             |
| --------- | ----------------------- |
| `%`       | Zero ou mais caracteres |
| `_`       | Exatamente um caractere |

# **4. Combinação de condições: AND e OR**

Podemos combinar diferentes condições utilizando operadores lógicos.

## **4.1. Operador OR**

O operador `OR` retorna os registros que atendem a pelo menos uma das condições.

```
SELECT *
FROM usuario
WHERE nome ILIKE 'Ana%'
   OR nome ILIKE 'IGOR%';
```

Retorna usuários cujos nomes começam com Ana ou Igor.

## **4.2. Operador AND**

O operador `AND` exige que todas as condições sejam verdadeiras.

```
SELECT *
FROM usuario
WHERE nome ILIKE 'Ana%'
  AND email ILIKE '%@gmail.com';
```

Retorna usuários cujo nome começa com Ana e cujo e-mail termina em `@gmail.com`.

Outro exemplo:

```
SELECT *
FROM usuario
WHERE nome ILIKE 'Ana%'
  AND email ILIKE '%@email.com';
```

## **4.3. Pesquisar em qualquer posição**

```
SELECT *
FROM usuario
WHERE nome ILIKE '%Ana%'
  AND email ILIKE '%@email.com';
```

Nesse exemplo, Ana pode aparecer em qualquer posição do nome.

## **4.4. Utilizando funções nas condições**

Também podemos utilizar funções SQL para transformar valores durante a comparação.

```
SELECT *
FROM usuario
WHERE UPPER(nome) LIKE '%ANA%'
  AND email ILIKE '%@email.com';
```

A função `UPPER()` transforma o conteúdo textual em letras maiúsculas antes da comparação.

Outras funções relacionadas:

- `LOWER(texto)`: converte para minúsculas.
- `UPPER(texto)`: converte para maiúsculas.

# **5. Comparações numéricas**

As condições também podem utilizar operadores relacionais.

```
SELECT *
FROM livro
WHERE ano > 2020;
```

Retorna livros publicados depois de 2020.

Principais operadores:

| Operador | Significado    |
| -------- | -------------- |
| `=`      | Igual          |
| `<>`     | Diferente      |
| `>`      | Maior          |
| `<`      | Menor          |
| `>=`     | Maior ou igual |
| `<=`     | Menor ou igual |

Outros exemplos:

```
SELECT * FROM livro WHERE ano = 2020;

SELECT * FROM livro WHERE ano <> 2020;

SELECT * FROM livro WHERE ano >= 2020;

SELECT * FROM livro WHERE ano <= 2020;
```

# **6. Alteração da estrutura de uma tabela – ALTER TABLE**

O comando `ALTER TABLE` permite modificar a estrutura de uma tabela existente.

## **6.1. Adicionar uma coluna**

```
ALTER TABLE usuario
ADD COLUMN telefone TEXT;
```

Adiciona a coluna `telefone` à tabela `usuario`.

Podemos verificar a alteração:

```
\d usuario
```

E consultar os registros:

```
SELECT * FROM usuario;
```

Como a coluna foi adicionada sem um valor padrão, os registros existentes terão `NULL` nessa coluna.

# **7. Valores NULL**

O valor `NULL` representa a ausência de um valor conhecido. Não deve ser confundido com zero ou texto vazio.

## **7.1. Atualizar um registro**

```
UPDATE usuario
SET telefone = '539999999999'
WHERE id = 1;
```

## **7.2. Consultar registros que possuem telefone**

```
SELECT *
FROM usuario
WHERE telefone IS NOT NULL;
```

## **7.3. Consultar registros sem telefone**

```
SELECT *
FROM usuario
WHERE telefone IS NULL;
```

**Atenção:** não devemos utilizar `telefone = NULL` ou `telefone <> NULL`.

Para verificar valores nulos, utilizamos `IS NULL` e `IS NOT NULL`.

## **7.4. Pesquisar telefones por prefixo**

```
SELECT *
FROM usuario
WHERE telefone LIKE '53%';
```

Retorna telefones iniciados por `53`.

# **8. Operadores IN e ordenação com ORDER BY**

## **8.1. Utilizando OR**

Podemos selecionar usuários com identificadores específicos:

```
SELECT *
FROM usuario
WHERE id = 2
   OR id = 4
   OR id = 6;
```

Uma condição equivalente pode ser escrita utilizando `IN`.

## **8.2. Utilizando IN**

```
SELECT *
FROM usuario
WHERE id IN (2, 4, 6);
```

O operador `IN` verifica se o valor pertence a uma lista de valores.

É equivalente a várias comparações conectadas por `OR`.

## **8.3. Ordenando os resultados**

```
SELECT *
FROM usuario
WHERE id IN (2, 4, 6)
ORDER BY id;
```

O comando `ORDER BY` ordena os registros.

Por padrão, a ordenação é crescente (`ASC`).

```
SELECT *
FROM usuario
WHERE id IN (2, 4, 6)
ORDER BY id DESC;
```

Nesse exemplo, a ordenação será decrescente.

## **8.4. Corrigindo um erro de sintaxe**

O seguinte comando está incorreto:

```
SELECT *
FROM usuario
WHERE id = 2 OR id = 4 OR id 6;
```

Falta o operador de comparação antes do número 6.

Forma correta:

```
SELECT *
FROM usuario
WHERE id = 2 OR id = 4 OR id = 6;
```

Ou, preferencialmente:

```
SELECT *
FROM usuario
WHERE id IN (2, 4, 6);
```

# **9. Pesquisas com correspondência no final do texto**

Podemos utilizar `%` antes do texto para pesquisar registros que terminam com determinado conteúdo.

```
SELECT *
FROM autor
WHERE nome ILIKE '%Silva';
```

Retorna autores cujos nomes terminam com Silva.

Outro exemplo:

```
SELECT *
FROM autor
WHERE nome ILIKE '%Assis';
```

Retorna autores cujos nomes terminam com Assis.

# **10. Operações com datas**

O PostgreSQL oferece recursos para realizar operações envolvendo datas e horários.

## **10.1. Atualizando uma data e hora**

```
UPDATE jogo
SET data_hora = '1987-01-20 08:00:00'
WHERE id = 1;
```

Altera a data e hora do jogo com identificador 1.

Podemos realizar outra alteração:

```
UPDATE jogo
SET data_hora = '2027-01-20 08:00:00'
WHERE id = 1;
```

Nesse segundo comando, o valor anterior será substituído pelo novo.

O formato utilizado é:

```
AAAA-MM-DD HH:MM:SS
```

## **10.2. Diferença entre datas**

```
SELECT id,
       CURRENT_DATE - data_retirada
FROM emprestimo;
```

O comando calcula a diferença, em dias, entre a data atual e a data de retirada.

Podemos atribuir um nome à coluna calculada:

```
SELECT id,
       CURRENT_DATE - data_retirada AS dias
FROM emprestimo;
```

O `AS` define um apelido (alias) para a coluna do resultado.

## **10.3. Utilizando AGE()**

```
SELECT id,
       AGE(data_retirada)
FROM emprestimo;
```

A função `AGE()` retorna um intervalo de tempo entre a data informada e a data/hora atual.

Diferentemente da subtração direta de duas datas, seu resultado é apresentado em anos, meses e dias, conforme o intervalo.

## **10.4. Filtrando os resultados**

```
SELECT id,
       (CURRENT_DATE - data_retirada) AS dias
FROM emprestimo emp
WHERE emp.id = 1;
```

Nesse exemplo:

- `emp` é um alias para a tabela `emprestimo`;
- `emp.id` identifica a coluna `id` da tabela;
- `WHERE` restringe a consulta ao empréstimo de identificador 1.

# **11. Atualização de registros – UPDATE**

O comando `UPDATE` permite modificar informações existentes.

## **11.1. Alterando uma coluna**

```
UPDATE usuario
SET telefone = '51888888888'
WHERE id = 2;
```

Altera o telefone do usuário de identificador 2.

## **11.2. Alterando várias colunas**

```
UPDATE usuario
SET telefone = '51888888888',
    senha = 'oi'
WHERE id = 2;
```

É possível modificar várias colunas em uma única instrução.

## **11.3. Utilizando funções durante a atualização**

```
UPDATE usuario
SET telefone = '51888888888',
    senha = MD5('oi')
WHERE id = 2;
```

A função `MD5()` calcula o hash MD5 do texto informado.

**Observação importante:** MD5 não é adequado para armazenar senhas em sistemas reais. Para aplicações, devem ser utilizadas funções específicas para armazenamento seguro de senhas, como Argon2id ou bcrypt.

## **11.4. Atualizando todos os registros**

```
UPDATE livro
SET titulo = '-Atualizado';
```

Cuidado

Como não existe uma cláusula `WHERE`, todos os registros da tabela terão seus títulos substituídos por `-Atualizado`.

Uma forma diferente de atualização é concatenar o conteúdo existente com um novo texto:

```
UPDATE livro
SET titulo = titulo || '-Atualizado';
```

O operador `||` realiza a concatenação de textos.

Por exemplo:

| Título original | Título atualizado         |
| --------------- | ------------------------- |
| PostgreSQL      | PostgreSQL-Atualizado     |
| Banco de Dados  | Banco de Dados-Atualizado |

Para visualizar as alterações:

```
SELECT * FROM livro;
```

# **12. Exclusão de registros – DELETE**

O comando `DELETE` permite excluir registros de uma tabela.

## **12.1. Excluir um usuário específico**

```
DELETE FROM usuario
WHERE id = 1;
```

Exclui o usuário cujo identificador é 1.

**Atenção:** se existirem registros em outras tabelas que referenciem esse usuário por meio de chaves estrangeiras, a exclusão poderá ser impedida por restrições de integridade referencial.

## **12.2. Verificando relacionamentos**

```
SELECT * FROM emprestimo;

\d usuario
```

Podemos consultar os registros relacionados e verificar as restrições da tabela antes de realizar a exclusão.

# **13. Integridade referencial: ON DELETE e ON UPDATE**

Quando uma tabela possui uma chave estrangeira (`FOREIGN KEY`) que referencia outra tabela, precisamos definir o que acontecerá com os registros relacionados quando o registro referenciado for excluído ou tiver sua chave atualizada.

O PostgreSQL permite definir diferentes comportamentos por meio das cláusulas `ON DELETE` e `ON UPDATE`.

## **13.1. Exemplo de relacionamento**

Imagine duas tabelas:

- `usuario`: armazena os usuários.
- `emprestimo`: armazena os empréstimos realizados pelos usuários.

Um empréstimo pertence a um usuário. Portanto, `emprestimo.usuario_id` é uma chave estrangeira que referencia `usuario.id`.

```
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE emprestimo (
    id SERIAL PRIMARY KEY,
    data_retirada DATE,
    usuario_id INTEGER,
    FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)
);
```

Nesse relacionamento, não podemos excluir um usuário que possua empréstimos associados, pois isso deixaria referências inválidas.

A restrição de chave estrangeira impede essa operação por padrão.

## **13.2. ON DELETE CASCADE**

Exclusão em cascata

Determina que, ao excluir um registro da tabela referenciada, os registros dependentes também serão excluídos automaticamente.

```
CREATE TABLE emprestimo (
    id SERIAL PRIMARY KEY,
    data_retirada DATE,
    usuario_id INTEGER,
    FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)
        ON DELETE CASCADE
);
```

Exemplo:

```
DELETE FROM usuario
WHERE id = 1;
```

O que acontece?

1. O usuário de identificador 1 é excluído.
2. Todos os empréstimos associados a esse usuário também são excluídos automaticamente.

Não precisamos executar manualmente:

```
DELETE FROM emprestimo
WHERE usuario_id = 1;
```

**Atenção:** o `CASCADE` pode provocar exclusões em várias tabelas relacionadas. Deve ser utilizado somente quando essa for realmente a regra de negócio desejada.

## **13.3. ON DELETE SET NULL**

Definir como NULL

Determina que, ao excluir o registro referenciado, a chave estrangeira dos registros dependentes será definida como `NULL`.

```
CREATE TABLE emprestimo (
    id SERIAL PRIMARY KEY,
    data_retirada DATE,
    usuario_id INTEGER,
    FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)
        ON DELETE SET NULL
);
```

Exemplo:

```
DELETE FROM usuario
WHERE id = 1;
```

O empréstimo não será excluído. Apenas o campo `usuario_id` será definido como `NULL`.

Antes:

| id | data_retirada | usuario_id |
| -- | ------------- | ---------- |
| 1  | 2026-10-10    | 1          |
| 2  | 2026-10-12    | 1          |

Depois:

| id | data_retirada | usuario_id |
| -- | ------------- | ---------- |
| 1  | 2026-10-10    | NULL       |
| 2  | 2026-10-12    | NULL       |

**Importante:** a coluna que recebe `NULL` não pode possuir uma restrição `NOT NULL`, caso contrário, a operação não poderá ser realizada.

## **13.4. ON DELETE SET DEFAULT**

Determina que a chave estrangeira receberá seu valor padrão quando o registro referenciado for excluído.

```
CREATE TABLE emprestimo (
    id SERIAL PRIMARY KEY,
    data_retirada DATE,
    usuario_id INTEGER DEFAULT 1,
    FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)
        ON DELETE SET DEFAULT
);
```

Ao excluir um usuário, os empréstimos associados terão `usuario_id` alterado para `1`.

Entretanto, o usuário de identificador 1 precisa continuar existindo. Caso contrário, a restrição de chave estrangeira impedirá a operação.

## **13.5. ON DELETE RESTRICT**

Impede a exclusão do registro referenciado enquanto existirem registros dependentes.

```
CREATE TABLE emprestimo (
    id SERIAL PRIMARY KEY,
    data_retirada DATE,
    usuario_id INTEGER,
    FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)
        ON DELETE RESTRICT
);
```

Exemplo:

```
DELETE FROM usuario
WHERE id = 1;
```

Se existirem empréstimos associados ao usuário 1, a exclusão será impedida.

É uma forma de preservar os registros dependentes.

## **13.6. ON DELETE NO ACTION**

É o comportamento padrão quando nenhuma ação é especificada.

```
CREATE TABLE emprestimo (
    id SERIAL PRIMARY KEY,
    data_retirada DATE,
    usuario_id INTEGER,
    FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)
        ON DELETE NO ACTION
);
```

O PostgreSQL verifica se a exclusão viola a integridade referencial.

A diferença importante em relação ao `RESTRICT` é que `NO ACTION` pode permitir que a verificação seja adiada quando a restrição é declarada como `DEFERRABLE`. Já `RESTRICT` não permite essa postergação.

## **13.7. ON UPDATE: quando a chave referenciada é alterada**

As mesmas ações podem ser utilizadas com `ON UPDATE`.

Imagine que o identificador de um usuário seja alterado:

```
UPDATE usuario
SET id = 10
WHERE id = 1;
```

Se existirem empréstimos associados ao usuário 1, o PostgreSQL precisará saber o que fazer com as respectivas chaves estrangeiras.

### **ON UPDATE CASCADE**

Atualiza automaticamente as chaves estrangeiras dos registros dependentes.

```
FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)
    ON UPDATE CASCADE
```

Se o usuário passar de `id = 1` para `id = 10`, todos os empréstimos associados também passarão a ter `usuario_id = 10`.

### **ON UPDATE SET NULL**

Define como `NULL` as chaves estrangeiras dos registros dependentes.

```
FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)
    ON UPDATE SET NULL
```

### **ON UPDATE SET DEFAULT**

Define o valor padrão da coluna da chave estrangeira.

```
FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)
    ON UPDATE SET DEFAULT
```

### **ON UPDATE RESTRICT e NO ACTION**

Impedem a alteração da chave referenciada enquanto houver dependências que provoquem violação da integridade referencial, observadas as diferenças de postergação já explicadas.

## **13.8. Resumo das ações referenciais**

| Ação          | Comportamento                                          |
| ------------- | ------------------------------------------------------ |
| `CASCADE`     | Propaga exclusão ou atualização                        |
| `SET NULL`    | Define a FK como NULL                                  |
| `SET DEFAULT` | Define a FK com seu valor padrão                       |
| `RESTRICT`    | Impede imediatamente a operação quando há dependências |
| `NO ACTION`   | Impede a operação se a verificação encontrar violação  |

## **13.9. Comparação prática**

Imagine que o usuário 1 possui três empréstimos.

| Ação                    | Resultado da exclusão do usuário                                 |
| ----------------------- | ---------------------------------------------------------------- |
| `ON DELETE CASCADE`     | Usuário e três empréstimos são excluídos                         |
| `ON DELETE SET NULL`    | Usuário é excluído; empréstimos permanecem com FK NULL           |
| `ON DELETE SET DEFAULT` | Usuário é excluído; empréstimos recebem o valor padrão na FK     |
| `ON DELETE RESTRICT`    | Exclusão do usuário é impedida                                   |
| `ON DELETE NO ACTION`   | Exclusão é impedida se houver violação no momento da verificação |

## **13.10. Como adicionar essas regras em uma tabela existente?**

Também podemos definir ou modificar as regras de uma chave estrangeira utilizando `ALTER TABLE`.

Primeiro, identificamos o nome da restrição:

```
\d emprestimo
```

Depois, podemos remover a restrição antiga:

```
ALTER TABLE emprestimo
DROP CONSTRAINT emprestimo_usuario_id_fkey;
```

E criar novamente com a ação desejada:

```
ALTER TABLE emprestimo
ADD CONSTRAINT fk_emprestimo_usuario
FOREIGN KEY (usuario_id)
REFERENCES usuario(id)
ON DELETE CASCADE
ON UPDATE CASCADE;
```

O nome `emprestimo_usuario_id_fkey` é ilustrativo: deve-se utilizar o nome efetivamente encontrado em `\d emprestimo`.

# **14. Transações com BEGIN, COMMIT e ROLLBACK**

Uma transação permite executar várias operações como uma única unidade lógica de trabalho.

Imagine que desejamos excluir um usuário e também seus empréstimos e reservas.

Podemos realizar essas operações dentro de uma transação:

```
BEGIN;

DELETE FROM emprestimo
WHERE usuario_id = 1;

DELETE FROM reserva
WHERE usuario_id = 1;

DELETE FROM usuario
WHERE id = 1;

COMMIT;
```

## **14.1. Entendendo cada comando**

| Comando    | Finalidade                                 |
| ---------- | ------------------------------------------ |
| `BEGIN`    | Inicia uma transação                       |
| `COMMIT`   | Confirma as alterações                     |
| `ROLLBACK` | Desfaz as alterações ainda não confirmadas |

A sequência executa três exclusões:

1. Exclui os empréstimos do usuário 1.
2. Exclui as reservas do usuário 1.
3. Exclui o próprio usuário 1.

Somente após o `COMMIT` as alterações são confirmadas.

## **14.2. Desfazendo uma transação**

Imagine que executamos:

```
BEGIN;

DELETE FROM usuario
WHERE id = 1;

ROLLBACK;
```

O `ROLLBACK` desfaz a exclusão, desde que a transação ainda não tenha sido confirmada.

## **14.3. Por que utilizar transações?**

As transações ajudam a preservar a integridade dos dados.

Se uma das operações apresentar um erro, podemos interromper a operação e executar `ROLLBACK`, evitando confirmar parcialmente as alterações.

**Observação:** o exemplo de exclusão depende de não existirem outros relacionamentos que impeçam a operação. Também é importante verificar as demais tabelas que possuem referências ao usuário.


# **16. Resumo dos principais comandos**

| Comando                 | Finalidade                                              |
| ----------------------- | ------------------------------------------------------- |
| `\c`                    | Conectar a outro banco                                  |
| `\dt`                   | Listar tabelas                                          |
| `\d`                    | Consultar estrutura de tabela                           |
| `\h`                    | Consultar ajuda SQL                                     |
| `SELECT`                | Consultar registros                                     |
| `WHERE`                 | Filtrar registros                                       |
| `LIKE`                  | Pesquisar padrões textuais                              |
| `ILIKE`                 | Pesquisar padrões sem diferenciar maiúsculas/minúsculas |
| `AND`                   | Exigir todas as condições                               |
| `OR`                    | Aceitar pelo menos uma condição                         |
| `IN`                    | Comparar com uma lista de valores                       |
| `ORDER BY`              | Ordenar resultados                                      |
| `ALTER TABLE`           | Modificar estrutura                                     |
| `ADD COLUMN`            | Adicionar coluna                                        |
| `IS NULL`               | Verificar valores nulos                                 |
| `IS NOT NULL`           | Verificar valores não nulos                             |
| `UPDATE`                | Atualizar registros                                     |
| `DELETE`                | Excluir registros                                       |
| `BEGIN`                 | Iniciar transação                                       |
| `COMMIT`                | Confirmar transação                                     |
| `ROLLBACK`              | Desfazer transação                                      |
| `AGE()`                 | Calcular intervalo entre datas                          |
| `CURRENT_DATE`          | Obter a data atual                                      |
| `MD5()`                 | Calcular hash MD5                                       |
| `ON DELETE CASCADE`     | Excluir registros dependentes                           |
| `ON DELETE SET NULL`    | Definir FK como NULL                                    |
| `ON DELETE SET DEFAULT` | Definir FK com valor padrão                             |
| `ON DELETE RESTRICT`    | Impedir exclusão de registros referenciados             |
| `ON DELETE NO ACTION`   | Impedir violação da integridade referencial             |
| `ON UPDATE CASCADE`     | Propagar atualização da chave                           |
| `ON UPDATE SET NULL`    | Definir FK como NULL na atualização                     |
| `ON UPDATE SET DEFAULT` | Definir FK com valor padrão na atualização              |
| `\q`                    | Sair do psql                                            |

# **17. Cuidados importantes durante a execução**

1. Sempre confira a cláusula `WHERE` antes de executar um `UPDATE` ou `DELETE`.
2. Um `UPDATE` sem `WHERE` modifica todas as linhas da tabela.
3. Um `DELETE` sem `WHERE` exclui todos os registros da tabela.
4. Utilize `IS NULL` e `IS NOT NULL` para testar valores nulos.
5. Utilize `ILIKE` quando a pesquisa não deve diferenciar letras maiúsculas e minúsculas.
6. Utilize transações quando várias operações precisarem ser confirmadas em conjunto.
7. Antes de excluir registros, verifique as chaves estrangeiras e os relacionamentos existentes.
8. Utilize `ON DELETE CASCADE` somente quando a exclusão dos registros dependentes fizer sentido para a regra de negócio.
9. Verifique se uma coluna permite `NULL` antes de utilizar `ON DELETE SET NULL`.
10. Garanta que o valor padrão de uma chave estrangeira corresponda a um registro existente ao utilizar `SET DEFAULT`.

