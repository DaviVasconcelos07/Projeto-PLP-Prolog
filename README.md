# Sistema de Notas de Alunos em Prolog

Projeto academico desenvolvido para a disciplina de Paradigmas de Linguagem de Programacao, com foco no paradigma logico usando Prolog.

## Objetivo

Modelar uma turma academica em Prolog, permitindo consultar informacoes sobre alunos, disciplinas, notas, medias, aprovacao e desempenho geral a partir de uma base de conhecimento.

O sistema sera construido a partir de fatos e regras, permitindo que o interpretador Prolog deduza informacoes como medias, situacoes academicas, ranking e desempenho das disciplinas.

## Funcionalidades Planejadas

| ID | Funcionalidade | Descricao |
|----|----------------|-----------|
| 1 | Media ponderada por disciplina | Calcula a media de um aluno em uma disciplina com base nas provas e pesos cadastrados. |
| 2 | Situacao do aluno | Infere se o aluno esta aprovado direto, em final, aprovado apos final ou reprovado. |
| 3 | Nota necessaria na final | Calcula quanto o aluno precisa tirar na prova final para atingir a media de aprovacao. |
| 4 | Ranking de alunos | Lista os alunos ordenados da maior para a menor media geral. |
| 5 | Porcentagem de aprovacao | Calcula o percentual de alunos aprovados na turma. |
| 6 | Maior media | Identifica o aluno com melhor desempenho geral. |
| 7 | Media geral da turma | Calcula a media geral considerando os alunos cadastrados. |
| 8 | Disciplina mais dificil | Identifica a disciplina com menor media entre os alunos. |

---

## Estrutura do Projeto

```text
Projeto-PLP-Prolog/
├── README.md
├── docs/
│   └── modelagem.md
├── src/
│   ├── dados.pl
│   ├── regras.pl
│   └── main.pl
└── tests/
    └── testes.pl
```

## Papel de Cada Arquivo

| Arquivo | Responsabilidade |
|---------|------------------|
| `src/dados.pl` | Base de conhecimento com fatos sobre alunos, disciplinas, provas e finais. |
| `src/regras.pl` | Regras logicas para calcular medias, aprovacoes, rankings e consultas derivadas. |
| `src/main.pl` | Ponto de entrada para consultas interativas ou menu em terminal. |
| `tests/testes.pl` | Testes automatizados das regras principais. |
| `docs/modelagem.md` | Explicacao da modelagem logica do sistema. |

## Modelagem Inicial

A base de conhecimento deve representar entidades do dominio como fatos Prolog:

```prolog
aluno(ana).
disciplina(plp, 7.0, 0.6, 0.4).
prova(ana, plp, prova1, 8.0, 1.0).
prova_final(ana, plp, sem_final).
```

As regras devem permitir consultas como:

```prolog
media_disciplina(ana, plp, Media).
situacao_aluno_disciplina(ana, plp, Situacao).
nota_necessaria_final(ana, plp, Nota).
ranking_alunos(Ranking).
disciplina_mais_dificil(Disciplina).
```

---

## Conceitos de Prolog Evidenciados

- **Fatos**: representam dados conhecidos do sistema, como alunos, disciplinas e notas.
- **Regras**: descrevem relacoes que podem ser inferidas a partir dos fatos.
- **Consultas**: permitem perguntar ao sistema o que pode ser deduzido.
- **Unificacao**: associa variaveis aos valores que satisfazem uma regra.
- **Backtracking**: explora multiplas respostas possiveis para uma consulta.
- **Recursao**: pode ser usada para processar listas e agregacoes.

---

## Como Executar

O projeto foi pensado para SWI-Prolog.

### Instalar no macOS

```bash
brew install swi-prolog
```

### Instalar no Linux

```bash
sudo apt install swi-prolog
```

### Abrir o projeto

```bash
swipl src/main.pl
```

### Executar testes

```bash
swipl -q -l tests/testes.pl -t run_tests
```

---

## Autores

- Davi de Lucena Vasconcelos
- Antonio Farias Lopes Neto
- Carlos Alberto Leal Do Nascimento
- Joao Victor Fernandes Martins
- Gabriel Cavalcante Alves Costa
- Filipe Costa de Morais

Desenvolvido como projeto academico para a disciplina de Paradigmas de Linguagem de Programacao.
