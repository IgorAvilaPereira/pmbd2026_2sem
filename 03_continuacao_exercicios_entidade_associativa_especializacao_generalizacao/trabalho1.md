### Trabalho 1 — Modelagem de Dados

**(2,0) Questão 1 — Modelo Entidade-Relacionamento**

Uma empresa deseja desenvolver um sistema para gerenciar **eventos, participantes e atividades**.

Considere as seguintes regras de negócio:

* Cada evento possui código, nome, descrição, data de início, data de término e local.
* Um evento possui uma ou mais atividades.
* Cada atividade possui código, título, descrição, data, horário de início e horário de término.
* Uma pessoa pode se cadastrar como participante.
* Cada participante possui código, nome, CPF, e-mail e telefone.
* Um participante pode se inscrever em diversos eventos.
* Um evento pode possuir diversos participantes.
* Para cada inscrição devem ser registradas a data da inscrição, a situação e o valor pago.
* Um participante inscrito em um evento pode participar de diversas atividades daquele evento.
* Uma atividade pode possuir diversos participantes.
* Para cada participação em uma atividade deve ser registrada a presença do participante.

**Tarefa:**

Construa o **Diagrama Entidade-Relacionamento (ER)** do sistema, identificando:

* entidades e atributos;
* identificadores;
* relacionamentos;
* cardinalidades mínima e máxima;
* participações obrigatórias e opcionais;
* relacionamentos N:N;
* atributos pertencentes aos relacionamentos.

---

**(2,0) Questão 2 — Modelo Relacional**

A partir do Diagrama ER desenvolvido na Questão 1, realize a **transformação para o Modelo Relacional**.

Apresente:

* as relações (tabelas) resultantes;
* seus respectivos atributos;
* as chaves primárias (PK);
* as chaves estrangeiras (FK);
* a resolução dos relacionamentos N:N;
* os atributos que devem fazer parte das relações resultantes desses relacionamentos.

**Não é necessário escrever comandos SQL.**

---

**(1,0) Questão 3 — Análise da modelagem**

Responda:

a) Por que **data da inscrição, situação e valor pago** devem ser associados à inscrição, e não diretamente a `Participante` ou `Evento`?

b) Por que **presença** deve ser associada à participação do participante em uma atividade?

c) Indique quais são os relacionamentos N:N existentes no modelo e explique como eles são representados no Modelo Relacional.
