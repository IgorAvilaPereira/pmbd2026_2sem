<!--
Modelagem Lógica (Modelo Relacional)

[Modelagem Conceitual (ER) + Modelagem Lógica (Modelo Relacional Incompleto) da Universidade](https://github.com/IgorAvilaPereira/pmbd2024_2sem/blob/main/universidade.dia)

[Implementação Física Incompleta - Universidade (script.sql)](https://github.com/IgorAvilaPereira/pmbd2024_2sem/blob/main/sql.sql)

[Lista 1](https://github.com/IgorAvilaPereira/pmbd2024_2sem/wiki/Listas#lista-er)

**Conversão - ER para Modelo Relacional**

* [Slides](https://github.com/IgorAvilaPereira/pmbd2024_2sem/raw/main/transformacao-er-modelo-relacional.pdf)

* [Principais Tipos de Dados - PostgreSQL](https://github.com/IgorAvilaPereira/pmbd2024_2sem/blob/main/principais-tiposdedados-postgresql.png)

-->

[Vídeo da Aula](https://www.youtube.com/watch?v=o7b207X2Pf0)

[Vídeos](https://youtube.com/playlist?list=PLvT8P1q6jMWdCXVwsdO3UAPAn743vHccK)


<!--[Dicionário de Dados](https://github.com/IgorAvilaPereira/pmbd2023_1sem/blob/main/10dicionario-de-dados.md)-->

<!--
**Leitura Complementar:**

* [Introdução a Modelagem Lógica - Modelo Relacional](modelo-relacional.md)

* [Conversão - DER para Modelo Relacional (_em texto_)](https://github.com/IgorAvilaPereira/pmbd2024_2sem/blob/main/8conversao-entre-modelos-er-e-relacional.md)

-->

<!--
[Conversão - DER para Modelo Relacional (Herança)](https://github.com/IgorAvilaPereira/pmbd2023_1sem/blob/main/9conversao-entre-modelos-er-e-relacional-heranca.md)
-->


**Resumo (usar com cautela):**

* Entidades Forte, Fraca e Associativa tornam-se, com grande frequência, tabelas.
* Atributos identificadores tornam-se chaves primárias.
* Relacionamentos _1:n_ exigem a criação de uma coluna adicional na tabela referente ao _n_ do relacionamento, denominada de chave estrangeira.
* Relacionamentos com atributos, geralmente, fazem com que estes relacionamentos sejam mapeados como tabelas.
* Relacionamentos _n:m_ (muitos para muitos) devem ser quebrados em 2 relacionamentos _1:n_ e exigem a criação de uma tabela intermediária 
* Atributos multivalores tornam-se tabelas.
* Atributos compostos podem se transformar em 1) colunas (o que a literatura diz) ou em uma 2) nova tabela + um relacionamento _1:n_ com a tabela resultante da entidade que, anteriormente, tinha o atributo composto (solução prática que permite mais uma instância do atributo composto).
* Especialização/Generalização podem gerar (1) uma única tabela, (2) uma tabela para cada entidade filha ou (3) uma tabela para cada entidade.



[Baixar todo o material da aula](https://download-directory.github.io/?url=http://github.com/IgorAvilaPereira/pmbd2026_2sem/tree/main/./05_modelagem_logica)
