# Entidade Fraca

Entidade Fraca é um tipo de entidade que não possui atributo identificador (chave) por si só. Isso significa que não é possível definir um identificador, nem simples e nem composto, para uma entidade.

Além disso, uma entidade fraca é dependente de uma outra entidade, e o relacionamento entre a entidade fraca e a outra entidade é normalmente 1:N, e o N fica junto à entidade fraca.

A entidade **Contato** da figura é uma entidade fraca porque não possui um atributo (ou conjunto de atributos) que identifique suas instâncias como únicas em relação a todas as possíveis instâncias (representantes daquela entidade). Assim, ela é dependente da entidade **Aluno**, porque só existe um contato se existir o aluno para aquele contato. Finalmente, o relacionamento entre as duas entidades (**Aluno** e **Contato**) é 1:N, ou seja, um aluno pode ter vários contatos, mas um contato pertence a apenas um aluno.

<!--
Livros de banco de dados, geralmente, representam a entidade fraca por um retângulo duplo e o relacionamento entre a entidade fraca e a outra entidade por losango duplo.
-->

**Entidades fracas são representadas por meio de retângulos com bordas duplas**. Os **relacionamentos envolvendo entidades fracas são representados por meio de losangos com bordas duplas**. Normalmente, **os identitficadores parciais (também chamados de chaves parciais) são sublinhados com linhas pontilhadas**.

![entidade_fraca](imagens/entidade_fraca.png)

<!--
Os tipos de entidades que não possuem atributos-chaves são denominados de fracas, diferente dos tipos de entidades que possuem (ao menos um) atributo-chave, denominadas entidades fortes (ou regulares).

Um tipo de entidade fraca sempre atende a restrição de participação total no seu relacionamento com o tipo de entidade identificante. Isso porque uma entidade fraca não pode ser identificada unicamente sem uma entidade forte correspondente.
-->

<!--Uma de entidade fraca tem, normalmente, uma **chave parcial** (também conhecido como atributo identificador parcial). -->

O identificador parcial corresponde ao conjunto de atributos que pode identificar unicamente as entidades fracas relacionadas à mesma entidade forte proprietária. Abaixo apresentamos um ER com uma entidade fraca que contém um um identificador parcial (**Nome**). Os atributos parciais são representados graficamente por um sublinhado pontilhado. Neste exemplo é possível identificar um **Dependente** a partir da combinação de seu identificador parrcial (da própria Entidade **Dependente** (**Nome**)) + o **atributo identificador da Entidade forte relacionada**, ou seja, observando a entidade **Empregado** (e seu atributo identificador **Cpf**) e o atributo (ou chave) parcial **Nome** da entidade **Dependente** é possível identificar (fisgar no mar de possíveis instâncias de Dependente) um representante (ou instância) único de Dependente.

Além disso, com frequência, sinalizamos a participação total entre a entidade fraca e sua entidade forte. Mas, o que seria participação total? É quando em um relacionamento todas as instância de uma entidade devem estar associada alguma outra instância de outra entidade. E isso é exatamente o que acontece entre entidades que participam de um relacionamento entre entidades forte e fraca. Obs: a participação total pode acontecer também entre relacionamentos de entidades fortes (onde a cardinalidade mínima seja 1).

<!--![image](https://github.com/user-attachments/assets/bf55f7f7-a01b-493c-a546-fc63816fd624)-->

![entidade_fraca](imagens/entidade_fraca2.png)

## OFF-TOPIC: Entidade Fraca - Uma Forma alternativa de Pensar

Se um **Empregado** é excluído:

* Excluem-se todos os **dependentes**

Perceba na tabela abaixo que tanto o empregado com CPF:**000.000.000-00** como o empregado com CPF:**111.111.111-11** possuem 2 filhos (sendo **João** um nome em comum, ou seja, tanto **000.000.000-00** com **111.111.111-11** possuem um filho **João** ). Entretanto, mediante a combinação de valores da **chave forte** de **Empregado** com a **chave parcial** da entidade fraca **Dependente** é possível identificar com clareza qual **João** é filho do **Empregado** com CPF:**000.000.000-00** e qual **João** é filho do empregado com CPF:**111.111.111-11**.

|**cpf_empregado**|**nome_dependente** |
|---------------|------------------|
|000.000.000-00       |Pedro            |
|**000.000.000-00**        |**João**            |
|111.111.111-11   |Fernando|
|**111.111.111-11**   |**João**    |


