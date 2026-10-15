# Lista de Exercícios SQL — Biblioteca

Considere o banco de dados da biblioteca apresentado em aula.

---

# Exercícios de SELECT

## SELECT básico

1. Liste todos os leitores cadastrados.

2. Liste apenas o nome dos leitores.

3. Liste o nome e email dos leitores.

4. Liste todos os livros cadastrados.

5. Liste apenas os títulos dos livros.

6. Liste todas as categorias.

7. Liste todos os autores.

8. Liste todos os empréstimos.

9. Liste todos os exemplares disponíveis (`status = true`).

10. Liste todos os exemplares indisponíveis (`status = false`).

---

# Exercícios com WHERE

11. Liste os leitores cujo nome seja “Maria”.

12. Liste os livros publicados após 2020.

13. Liste os leitores com telefone iniciando em “53”.

14. Liste os leitores cujo email contenha “gmail”.

15. Liste os autores cujo nome termina com “Silva”.

16. Liste os livros publicados antes de 2010.

17. Liste os empréstimos sem data de devolução.

18. Liste as categorias cuja descrição contenha a letra “a”.

---

# Exercícios com ORDER BY

19. Liste os leitores ordenados pelo nome.

20. Liste os livros do mais recente para o mais antigo.

21. Liste os autores em ordem alfabética decrescente.

22. Liste os empréstimos ordenados pela data de empréstimo.

---

# Exercícios com funções de STRING

23. Liste o nome dos leitores em letras maiúsculas.

24. Liste o nome dos autores em letras minúsculas.

25. Mostre o tamanho do nome de cada leitor.

26. Mostre os 3 primeiros caracteres do nome dos autores.

27. Substitua “gmail” por “hotmail” nos emails dos leitores utilizando SELECT.

28. Concatene nome e telefone dos leitores em uma única coluna.

29. Liste os títulos dos livros em letras maiúsculas.

30. Mostre apenas os 5 primeiros caracteres do título dos livros.

31. Remova espaços antes e depois do nome dos autores usando `TRIM`.

32. Mostre quantas letras possui cada título de livro.

---

# Exercícios com funções de DATA

33. Liste apenas o ano de publicação dos livros.

34. Liste o mês dos empréstimos realizados.

35. Liste o dia atual usando SQL.

36. Mostre quantos dias se passaram desde cada empréstimo.

37. Liste os livros publicados no ano de 2024.

38. Mostre a data atual e a data atual mais 7 dias.

39. Liste os empréstimos realizados no mês atual.

40. Mostre apenas a hora dos empréstimos.

41. Liste os livros publicados nos últimos 5 anos.

42. Mostre a diferença entre data de devolução e data de empréstimo.

---

# Exercícios de UPDATE

43. Atualize o telefone de um leitor.

44. Atualize o email de um leitor.

45. Atualize o nome de um autor.

46. Atualize a descrição de uma categoria.

47. Atualize o título de um livro.

48. Atualize o status de um exemplar.

49. Atualize a data de devolução de um empréstimo.

50. Acrescente “ - Atualizado” no título de todos os livros.

---

# Exercícios de DELETE

51. Remova um leitor específico.

52. Remova um empréstimo.

53. Remova um exemplar indisponível.

54. Remova livros publicados antes de 2000.

55. Remova categorias sem descrição.

56. Remova autores cujo nome esteja vazio.

57. Remova empréstimos já devolvidos.

58. Remova leitores com email contendo “teste”.

---

# Exercícios de ALTER TABLE

59. Adicione uma coluna `cpf` na tabela `leitor`.

60. Adicione uma coluna `editora` na tabela `livro`.

61. Adicione uma coluna `cidade` na tabela `leitor`.

62. Adicione uma coluna `isbn` na tabela `livro`.

63. Renomeie a coluna `descricao` da tabela `categoria` para `nome_categoria`.

64. Renomeie a tabela `autor` para `escritor`.

65. Altere o tamanho da coluna `telefone` para `VARCHAR(20)`.

66. Defina a coluna `isbn` como UNIQUE.

67. Remova a coluna `cidade` da tabela `leitor`.

68. Adicione uma coluna `ativo BOOLEAN` na tabela `leitor`.

69. Defina valor padrão `true` para a coluna `ativo`.

70. Adicione uma coluna `data_cadastro TIMESTAMP` na tabela `leitor`.

71. Remova a coluna `ativo`.

72. Altere o tipo da coluna `telefone` para `TEXT`.

73. Adicione uma restrição `NOT NULL` na coluna `nome` da tabela `autor`.

74. Renomeie a tabela `emprestimo` para `locacao`.

75. Adicione uma coluna `observacao TEXT` na tabela `emprestimo`.

