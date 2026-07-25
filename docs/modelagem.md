# Modelagem do Projeto

Este documento descreve a modelagem inicial do sistema de notas em Prolog.

## Ideia central

O sistema representa uma turma academica por meio de fatos e regras. Os fatos guardam os dados conhecidos, como alunos, disciplinas e notas. As regras permitem consultar informacoes derivadas, como medias, ranking, aprovacao e disciplina com menor desempenho.

## Entidades do dominio

- `aluno/1`: representa um aluno cadastrado.
- `disciplina/4`: representa uma disciplina, sua media de aprovacao e os pesos da media regular e da final.
- `prova/5`: representa uma nota obtida por um aluno em uma disciplina.
- `prova_final/3`: representa a situacao ou nota final de um aluno em uma disciplina.

## Exemplo de fatos

```prolog
aluno(ana).
aluno(bruno).

disciplina(plp, 7.0, 0.6, 0.4).

prova(ana, plp, prova1, 8.0, 1.0).
prova(ana, plp, prova2, 7.5, 1.0).

prova_final(ana, plp, sem_final).
```

## Regras planejadas

- `media_disciplina/3`
- `media_geral_aluno/2`
- `media_geral_turma/1`
- `aprovado_direto/2`
- `nota_necessaria_final/3`
- `situacao_aluno_disciplina/3`
- `aluno_aprovado/1`
- `porcentagem_aprovacao/1`
- `maior_media/2`
- `ranking_alunos/1`
- `disciplina_mais_dificil/1`

## Decisoes iniciais

1. Usar SWI-Prolog como interpretador principal.
2. Separar fatos e regras para deixar claro o que e dado conhecido e o que e inferido.
3. Priorizar consultas declarativas antes de criar um menu interativo.
4. Criar testes para as regras de calculo, pois erros de regra de negocio podem passar despercebidos mesmo quando o codigo carrega corretamente.
