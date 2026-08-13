# Lista de Exercícios — Modelagem Entidade-Relacionamento (ER)

## Orientações

Para cada problema, **construa um Diagrama Entidade-Relacionamento (ER)** que represente as regras de negócio apresentadas no enunciado.

O modelo deve identificar:

* entidades;
* atributos;
* identificadores;
* relacionamentos;
* cardinalidades mínima e máxima;
* participações obrigatórias e opcionais;
* atributos de relacionamentos, quando existirem;
* relacionamentos N:N;
* autorrelacionamentos, quando aplicável;
* especializações/generalizações, quando necessárias.

> **Atenção:** não é necessário criar o modelo relacional ou comandos SQL. O objetivo desta lista é trabalhar exclusivamente a **modelagem conceitual ER**.

---

# 🟢 Nível 1 — Fundamentos

Exercícios destinados à identificação de entidades, atributos e relacionamentos simples.

## 1. Administradora de imóveis

Construa um diagrama ER para a **administradora de imóveis** descrita abaixo:

* A administradora trabalha tanto com administração de condomínios quanto com administração de aluguéis.
* A administradora administra condomínios formados por unidades condominiais.
* Cada unidade condominial é de propriedade de uma ou mais pessoas.
* Uma pessoa pode possuir diversas unidades.
* Cada unidade pode estar alugada para, no máximo, uma pessoa.
* Uma pessoa pode alugar diversas unidades.

---

## 2. Escola e turmas

Uma escola deseja informatizar o controle de suas turmas.

* A escola possui diversas turmas.
* Cada turma possui um código, nome e número de alunos.
* Cada turma ocupa uma sala.
* Uma sala possui número, capacidade e localização.
* Uma turma ocorre em uma única sala.
* Uma sala pode ser utilizada por várias turmas, desde que em horários diferentes.

**Tarefa:** construa o modelo ER identificando as entidades, atributos e relacionamentos.

---

## 3. Berçário

Um berçário deseja informatizar suas operações.

* Quando um bebê nasce, são armazenadas informações como nome, data de nascimento, peso e altura.
* Para cada bebê, deve-se registrar sua mãe e o médico responsável pelo parto.
* Para cada mãe, são armazenados nome, endereço, telefone e data de nascimento.
* Para cada médico, são armazenados CRM, nome, telefone celular e especialidade.

**Tarefa:** construa o diagrama ER.

---

## 4. Biblioteca pessoal

Uma pessoa deseja criar um sistema para controlar sua biblioteca particular.

* Cada livro possui ISBN, título, ano de publicação e editora.
* Um livro possui um ou mais autores.
* Um autor pode escrever diversos livros.
* Cada livro possui uma categoria, como romance, ficção, técnico ou biografia.
* Uma categoria pode possuir diversos livros.
* A pessoa deseja registrar se um livro está disponível ou emprestado.

**Tarefa:** construa o modelo ER.

---

## 5. Floricultura

Uma floricultura deseja informatizar suas operações.

* Deve ser mantido um cadastro de clientes contendo RG, nome, telefone e endereço.
* Devem ser cadastrados os produtos vendidos pela floricultura.
* Para cada produto devem ser armazenados nome, tipo, preço e quantidade em estoque.
* Um cliente pode realizar diversas compras.
* Cada compra pertence a um único cliente.
* Para cada compra devem ser armazenadas a data e o valor total.
* Uma compra pode conter diversos produtos.
* Um produto pode aparecer em diversas compras.

---

# 🟡 Nível 2 — Relacionamentos e N:N

Exercícios que exigem maior atenção às cardinalidades e aos atributos de relacionamentos.

## 6. Academia

Construa um diagrama ER para uma **academia**:

* A academia possui diversos clientes, registrando nome, CPF, data de nascimento e telefone.
* Cada cliente recebe um código único.
* A academia possui diversas atividades.
* Cada atividade dura 45 minutos.
* Uma atividade pode possuir horários diferentes em diferentes dias da semana.
* Para cada horário de atividade há um professor alocado.
* Cada cliente pode se matricular em planos.
* Um plano pode reunir uma ou mais atividades.
* Um plano possui nome, valor mensal e duração em meses.
* Um cliente pode estar matriculado em mais de um plano.

---

## 7. Concessionária de veículos

Uma concessionária deseja criar uma base de dados para controlar a venda de veículos.

* Para qualquer veículo, são conhecidos número do chassi, placa, cor, ano de fabricação e quilometragem.
* Todo veículo pertence a um modelo.
* Cada modelo pertence a uma marca.
* A concessionária deseja manter cadastros independentes de marcas e modelos.
* Para cada comprador devem ser registrados CPF, nome e estado civil.
* Caso o comprador seja casado, também devem ser registrados os dados do cônjuge.
* Para cada venda devem ser armazenadas data e valor da venda.

---

## 8. Clube do livro

Uma turma deseja criar um sistema para controlar um **clube do livro**.

* Cada aluno pode disponibilizar livros que possui em casa.
* Os livros são organizados por áreas, como romance, ficção e policial.
* Deve existir um cadastro de áreas.
* Sobre cada livro devem ser armazenados nome, autor, editora, ano de publicação e ISBN.
* Não pode haver livros repetidos.
* Para cada aluno devem ser armazenados matrícula, nome, telefone e turma.
* Os livros podem ser emprestados aos alunos cadastrados.
* Para cada empréstimo devem ser registradas data do empréstimo e data da devolução.
* Deve ser mantido o histórico dos empréstimos.

---

## 9. Estabelecimento comercial

Um estabelecimento comercial deseja controlar seus produtos, fornecedores, vendas e clientes.

* Cada produto possui código, nome, preço e quantidade em estoque.
* Cada produto possui um fornecedor.
* Para cada fornecedor devem ser armazenados nome, CNPJ e telefone.
* Devem ser registradas as vendas realizadas.
* Cada venda possui uma nota fiscal associada.
* Cada nota fiscal possui um ou mais itens.
* Para cada item deve ser registrada a quantidade comprada.
* Cada item está associado a um produto.
* Cada venda é realizada para um cliente.
* Para cada cliente devem ser armazenados CPF, nome e telefone.

---

## 10. Artigos científicos

Construa um diagrama ER para uma **base de dados de artigos científicos**.

* Cada artigo possui código, título, resumo, número de páginas e nome do arquivo.
* Cada artigo está associado a uma ou mais palavras-chave.
* Cada artigo possui um ou mais autores.
* Para cada autor devem ser armazenados nome, código de registro e e-mail.
* Cada autor está associado a uma instituição.
* Para cada instituição devem ser registrados código, nome e endereço.
* Cada artigo está associado a um periódico.
* Para cada periódico devem ser armazenados nome, código e nível de qualificação na CAPES.

---

## 11. Escola, professores e turmas

Uma escola possui várias turmas.

* Uma turma possui vários professores.
* Um professor pode ministrar aulas em mais de uma turma.
* Cada turma possui uma única sala.
* Uma sala pode estar associada a várias turmas, desde que em horários diferentes.
* Para cada professor devem ser registrados código, nome, CPF e formação.
* Para cada turma devem ser registrados código, série e turno.
* Para cada sala devem ser registrados número, capacidade e localização.

**Tarefa:** construa o modelo ER e identifique os relacionamentos N:N.

---

## 12. Firma de produtos de limpeza

Uma firma vende produtos de limpeza e deseja controlar seus produtos, clientes e pedidos.

* Cada produto possui código, nome, categoria e preço.
* A categoria é uma classificação criada pela própria firma.
* Cada cliente possui código, nome, endereço, telefone, status e limite de crédito.
* Cada pedido possui número e data de elaboração.
* Um cliente pode realizar diversos pedidos.
* Cada pedido pertence a um único cliente.
* Cada pedido pode envolver um ou vários produtos.
* Para cada produto incluído em um pedido deve ser registrada a quantidade solicitada.

---

# 🟠 Nível 3 — Regras de negócio e modelos mais complexos

Aqui os exercícios exigem maior cuidado com cardinalidades, relacionamentos opcionais, autorrelacionamentos e atributos associados aos relacionamentos.

## 13. Seguradora de automóveis

Uma seguradora deseja armazenar informações sobre seus clientes, carros e acidentes.

* Cada cliente possui um ou mais carros.
* Um carro pode estar associado a diversos acidentes.
* Um carro pode não possuir nenhum acidente registrado.
* Para cada cliente devem ser armazenados nome, CPF, número da CNH, endereço e telefone.
* Para cada carro devem ser armazenados descrição, placa, chassi e quilometragem.
* Para cada acidente devem ser registrados descrição, data, hora, local e valor total dos danos.

---

## 14. Hospital

Construa um diagrama ER para um **hospital**.

* Para cada paciente devem ser armazenados nome, CPF, RG, data de nascimento, endereço e telefone.
* Para cada médico devem ser armazenados nome, telefone e número do CRM.
* Cada médico pode possuir uma ou mais especialidades.
* Para cada especialidade devem ser armazenados código e nome.
* Devem ser registrados os exames realizados pelos pacientes.
* Cada exame deve ser requisitado por um médico.
* Para cada exame devem ser registrados data, hora, valor e descrição.

---

## 15. Universidade e disciplinas

Uma universidade deseja armazenar o QSL de cada curso.

* Todos os cursos são semestrais.
* Para cada curso devem ser armazenados código, nome, turno e nível.
* Os níveis possíveis são graduação, especialização, mestrado e doutorado.
* Cada curso é mantido por um departamento.
* Para cada departamento devem ser armazenados código e nome.
* Cada curso possui um conjunto de uma ou mais disciplinas.
* Para cada disciplina devem ser armazenados código, nome, créditos, carga horária, ementa e semestre de oferecimento.
* Uma disciplina pode possuir zero ou mais pré-requisitos.
* Um pré-requisito é outra disciplina que deve ser concluída antes da matrícula.

**Desafio:** represente corretamente o **autorrelacionamento de disciplina com disciplina**.

---

## 16. Escritório de advocacia

Um escritório de advocacia deseja armazenar dados de clientes, processos e advogados.

* Cada cliente possui código, nome, CPF, telefone e endereço.
* Cada processo possui código, data de abertura e descrição.
* Cada processo é aberto por um cliente.
* Um cliente pode possuir diversos processos.
* Um processo pode ser atendido por um ou mais advogados.
* Um advogado pode atender diversos processos.
* Para cada advogado devem ser armazenados código, nome, telefone, data de entrada na empresa e número da OAB.
* Cada processo pode possuir diversas audiências.
* Para cada audiência devem ser registrados código, data, hora e local.

---

## 17. Sistema de eventos

Uma empresa deseja desenvolver um banco de dados para gerenciar **eventos, participantes, palestrantes e inscrições**.

* Cada evento possui código, nome, descrição, data de início, data de término e local.
* Um evento possui uma ou mais atividades.
* Cada atividade possui código, título, descrição, data, horário de início e horário de término.
* Cada atividade pertence a exatamente um evento.
* Uma pessoa pode se cadastrar como participante.
* Para cada participante devem ser registrados código, nome, CPF, e-mail e telefone.
* Uma pessoa pode realizar inscrições em diversos eventos.
* Para cada inscrição devem ser registrados data da inscrição, status e valor pago.
* Um evento pode possuir diversos participantes.
* Uma atividade pode ser ministrada por um ou mais palestrantes.
* Um palestrante pode participar de diversas atividades.
* Para cada palestrante devem ser registrados código, nome, e-mail, telefone e instituição.
* Um participante inscrito em um evento pode participar de diversas atividades daquele evento.
* Deve ser registrada a presença do participante em cada atividade.
* Algumas atividades possuem limite de vagas.
* Algumas atividades exigem inscrição prévia.

**Desafio:** identifique os atributos que pertencem aos **relacionamentos**, e não às entidades.

---

# 🔴 Nível 4 — Modelagem avançada

Exercícios para consolidar os principais conceitos de modelagem ER.

## 18. Liga de basquete

A Jonesburgh County Basketball Conference (JCBC) é uma liga amadora de basquete.

* Cada cidade possui uma equipe representante.
* Cada equipe possui entre 9 e 12 jogadores.
* Cada equipe possui até 3 técnicos.
* Os técnicos podem atuar como técnico ofensivo, defensivo ou geral.
* Durante a temporada, cada equipe joga duas partidas contra cada uma das demais equipes:

  * uma como mandante;
  * uma como visitante.
* Para cada equipe devem ser armazenados código, nome e cidade.
* Para cada jogador devem ser armazenados código, nome, posição e data de nascimento.
* Para cada técnico devem ser armazenados código, nome e especialidade.
* Para cada partida devem ser registradas data, horário, equipe mandante, equipe visitante e placar.

**Desafio:** modele corretamente o relacionamento entre equipes e partidas, considerando que uma equipe pode aparecer em uma mesma partida em papéis diferentes: **mandante e visitante**.

---

## 19. Streaming de música

Modele um sistema de gerenciamento de um serviço de **streaming de música**, semelhante ao Spotify.

* Um artista é identificado por um ID e possui um nome.
* Uma música possui ID, título e duração.
* Uma gravadora possui ID, nome, endereço, telefone, contato e site.
* Um álbum possui ID, título, preço ou tipo de licença e data de lançamento.
* Um usuário possui ID, nome, e-mail e tipo de assinatura.
* Uma playlist possui ID, nome e data de criação.
* Um artista pode compor várias músicas.
* Uma música pode ter vários artistas.
* Uma música pode existir sem artista cadastrado.
* Uma música pode fazer parte de vários álbuns.
* Um álbum pode conter várias músicas.
* Deve ser registrado o número da faixa da música dentro de cada álbum.
* Uma gravadora pode lançar vários álbuns.
* Um álbum pertence exclusivamente a uma gravadora.
* Um álbum pode recomendar outro álbum já cadastrado.
* Um usuário pode criar várias playlists.
* Cada playlist pertence a apenas um usuário.
* Uma playlist pode conter várias músicas.
* Uma música pode estar presente em várias playlists.

**Desafios:**

1. Identifique todos os relacionamentos N:N.
2. Identifique os atributos dos relacionamentos.
3. Modele o autorrelacionamento entre álbuns.
4. Considere corretamente a participação opcional de músicas em artistas.

---

## 20. Locadora de veículos

Construa um modelo ER para uma empresa de **locação de veículos**.

A empresa aluga automóveis, camionetas de passageiros e camionetas de carga.

* A empresa atende pessoas físicas e jurídicas.
* Cada cliente possui um código interno.
* Para pessoas físicas são armazenados nome, sexo, data de nascimento, endereço e CPF.
* Para pessoas jurídicas são armazenados nome, CNPJ e endereço.
* A empresa possui diversas filiais.
* Um veículo encontra-se sob responsabilidade de uma filial em determinado momento.
* Um veículo pode mudar de filial.
* Cada veículo possui placa, chassi, número do motor, tipo e cor.
* O sistema deve permitir consultar os veículos disponíveis em uma filial.
* Devem ser registradas as reservas de veículos.
* As reservas são realizadas para um **tipo de veículo**, e não para uma marca ou modelo específico.
* Deve ser possível consultar os veículos alugados, o ponto de entrega e a data prevista de devolução.
* Os veículos são classificados por tipos.
* Os tipos de automóveis possuem informações como tamanho, número de passageiros, número de portas, ar-condicionado, rádio e direção hidráulica/elétrica.
* Para camionetas de carga deve ser registrada a capacidade de carga.
* Cada tipo de veículo possui um tempo necessário para limpeza e revisão entre locações.
* Para cada veículo alugado deve ser registrada a identificação do motorista, número da habilitação e data de vencimento.

**Desafio:** avalie se o problema exige o uso de **generalização/especialização** para representar os diferentes tipos de clientes e/ou veículos.

---

## 21. Plataforma de cursos on-line

Uma empresa deseja desenvolver uma plataforma de cursos on-line.

* Cada curso possui código, título, descrição, carga horária e preço.
* Um curso pode possuir diversos módulos.
* Cada módulo pertence a exatamente um curso.
* Cada módulo possui código, título e ordem de apresentação.
* Um módulo pode possuir diversas aulas.
* Cada aula possui código, título, duração e URL.
* Um professor pode ministrar diversos cursos.
* Um curso pode possuir um ou mais professores.
* Um aluno pode se matricular em diversos cursos.
* Um curso pode possuir diversos alunos matriculados.
* Para cada matrícula devem ser registradas data de matrícula, situação e percentual de conclusão.
* Um aluno pode assistir a diversas aulas.
* Para cada aula assistida deve ser registrada a data do acesso e o percentual assistido.
* Um curso pode possuir avaliações.
* Cada avaliação possui código, descrição e nota máxima.
* Um aluno pode realizar diversas avaliações.
* Para cada avaliação realizada devem ser registradas a data e a nota obtida.

**Desafio:** identifique quais informações pertencem às entidades e quais pertencem aos relacionamentos.

---

## 22. Sistema de biblioteca universitária

Uma universidade deseja informatizar sua biblioteca.

* A biblioteca possui diversos exemplares de livros.
* Um livro possui ISBN, título, edição, ano de publicação e editora.
* Um livro pode possuir vários autores.
* Um autor pode escrever vários livros.
* Um livro pode possuir vários exemplares físicos.
* Cada exemplar possui um código patrimonial e uma situação.
* A biblioteca possui alunos e professores cadastrados como usuários.
* Cada usuário possui código, nome, CPF e e-mail.
* Um usuário pode realizar diversos empréstimos.
* Cada empréstimo está associado a um único exemplar.
* Para cada empréstimo devem ser registradas data de retirada, data prevista de devolução e data efetiva de devolução.
* Um exemplar pode ser emprestado diversas vezes ao longo do tempo.
* Um usuário pode reservar um livro que esteja indisponível.
* Deve ser mantido o histórico das reservas.

**Desafio:** diferencie corretamente **livro** de **exemplar**, evitando representar cada cópia física como um livro diferente.

---

## 23. Sistema de recrutamento e seleção

Uma empresa deseja criar um sistema para gerenciar processos seletivos.

* A empresa possui diversas vagas.
* Cada vaga possui código, título, descrição, salário previsto, data de abertura e status.
* Uma vaga pertence a um único departamento.
* Um departamento pode possuir diversas vagas.
* Cada candidato possui código, nome, CPF, e-mail e telefone.
* Um candidato pode se candidatar a diversas vagas.
* Uma vaga pode receber candidaturas de diversos candidatos.
* Para cada candidatura devem ser registrados data da candidatura, situação e observações.
* Cada vaga pode possuir diversas etapas de seleção.
* As etapas possuem ordem, descrição e tipo.
* Um candidato pode participar de diversas etapas de uma vaga.
* Para cada participação devem ser registradas data, resultado e observação.
* Um candidato pode ser contratado para uma vaga.
* A empresa deseja manter o histórico dos processos seletivos encerrados.

**Desafio:** determine quais relacionamentos precisam possuir atributos próprios.

---

# ⭐ Desafio Final — Modelagem completa

## 24. Plataforma de delivery

Uma empresa deseja desenvolver uma plataforma de **delivery de alimentos**.

O sistema deverá controlar clientes, restaurantes, produtos, pedidos, entregadores e pagamentos.

* Cada cliente possui código, nome, CPF, telefone e endereço.
* Um cliente pode possuir vários endereços cadastrados.
* Cada endereço possui código, rua, número, complemento, bairro, cidade e CEP.
* Um restaurante possui código, nome, CNPJ, telefone e endereço.
* Um restaurante possui diversos produtos em seu cardápio.
* Cada produto possui código, nome, descrição, preço e disponibilidade.
* Um produto pertence a um único restaurante.
* Um cliente pode realizar diversos pedidos.
* Cada pedido possui número, data, hora, status e valor total.
* Um pedido pode possuir vários produtos.
* Para cada produto do pedido deve ser registrada a quantidade e o preço praticado no momento da compra.
* Cada pedido utiliza um dos endereços cadastrados pelo cliente.
* Um pedido pode possuir um pagamento.
* Para cada pagamento devem ser registradas forma de pagamento, valor, data e status.
* Um pedido pode ser associado a um entregador.
* Um entregador pode realizar diversos pedidos.
* Para cada entregador devem ser registrados código, nome, CPF, telefone e situação.
* O sistema deve registrar a data e hora de retirada do pedido pelo entregador.
* O sistema deve registrar a data e hora de entrega.
* Um restaurante pode receber avaliações dos clientes.
* Cada avaliação possui nota, comentário e data.
* Um cliente pode avaliar diversos restaurantes.
* Um restaurante pode receber avaliações de diversos clientes.

### Desafios adicionais

1. Identifique todas as entidades.
2. Identifique os relacionamentos 1:1, 1:N e N:N.
3. Identifique os atributos que pertencem aos relacionamentos.
4. Identifique relacionamentos opcionais.
5. Verifique se existe alguma entidade que dependa da existência de outra.
6. Identifique possíveis situações de histórico.
7. Justifique as principais cardinalidades escolhidas.
8. Avalie se alguma entidade poderia ser especializada/generalizada.

---

<!--
# 📊 Progressão sugerida

| Nível                     | Exercícios | Principal objetivo                                              |
| ------------------------- | ---------- | --------------------------------------------------------------- |
| 🟢 **1 — Fundamentos**    | 1–5        | Entidades, atributos e relacionamentos simples                  |
| 🟡 **2 — Intermediário**  | 6–12       | N:N, cardinalidades e atributos de relacionamentos              |
| 🟠 **3 — Avançado**       | 13–17      | Autorrelacionamentos, regras de negócio e participação opcional |
| 🔴 **4 — Muito avançado** | 18–23      | Modelagem complexa, papéis, histórico e especialização          |
| ⭐ **Desafio final**       | 24         | Integração de todos os conceitos                                |

## Sugestão de aplicação

Uma sequência interessante para as aulas seria:

**Aula 1:** exercícios 1–3
**Aula 2:** exercícios 4–6
**Aula 3:** exercícios 7–10
**Aula 4:** exercícios 11–14
**Aula 5:** exercícios 15–17
**Aula 6:** exercícios 18–20
**Aula 7:** exercícios 21–23
**Avaliação/desafio:** exercício 24

> Os exercícios 18 a 24 podem ser utilizados como atividades de maior complexidade ou como preparação para uma avaliação prática de modelagem ER.
-->
