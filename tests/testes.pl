:- begin_tests(sistema_notas).

:- use_module('../src/dados').
:- use_module('../src/regras').

% Como as contas envolvem ponto flutuante, usamos uma comparacao
% com tolerancia em vez de igualdade exata.
aproximadamente_igual(A, B) :-
    Diferenca is abs(A - B),
    Diferenca < 0.001.

% --- media_disciplina/3 ---

test(media_disciplina_ana_plp) :-
    media_disciplina(ana, plp, Media),
    aproximadamente_igual(Media, 7.75).

test(media_disciplina_bruno_matematica) :-
    media_disciplina(bruno, matematica, Media),
    aproximadamente_igual(Media, 6.25).

% --- aprovado_direto/2 ---

test(aprovado_direto_ana_plp) :-
    aprovado_direto(ana, plp).

test(nao_aprovado_direto_bruno_plp, [fail]) :-
    aprovado_direto(bruno, plp).

% --- nota_necessaria_final/3 ---

test(nota_necessaria_bruno_plp) :-
    nota_necessaria_final(bruno, plp, Nota),
    aproximadamente_igual(Nota, 9.25).

% --- situacao_aluno_disciplina/3 ---

test(situacao_ana_plp_aprovado_direto) :-
    situacao_aluno_disciplina(ana, plp, aprovado_direto).

test(situacao_bruno_plp_em_final) :-
    situacao_aluno_disciplina(bruno, plp, em_final).

test(situacao_carla_plp_aprovado_final) :-
    situacao_aluno_disciplina(carla, plp, aprovado_final).

test(situacao_diego_plp_reprovado) :-
    situacao_aluno_disciplina(diego, plp, reprovado).

% --- media_geral_aluno/2 ---

test(media_geral_aluno_ana) :-
    media_geral_aluno(ana, Media),
    aproximadamente_igual(Media, 8.125).

test(media_geral_aluno_diego) :-
    media_geral_aluno(diego, Media),
    aproximadamente_igual(Media, 4.875).

% --- media_geral_turma/1 ---

test(media_geral_turma) :-
    media_geral_turma(Media),
    aproximadamente_igual(Media, 6.5).

% --- aluno_aprovado/1 ---

test(aluno_aprovado_ana) :-
    aluno_aprovado(ana).

test(diego_nao_aprovado, [fail]) :-
    aluno_aprovado(diego).

% --- porcentagem_aprovacao/1 ---

test(porcentagem_aprovacao) :-
    porcentagem_aprovacao(Porcentagem),
    aproximadamente_igual(Porcentagem, 75.0).

% --- maior_media/2 ---

test(maior_media_e_ana) :-
    maior_media(Aluno, Media),
    Aluno == ana,
    aproximadamente_igual(Media, 8.125).

% --- ranking_alunos/1 ---

test(ranking_alunos_ordenado) :-
    ranking_alunos(Ranking),
    Ranking = [_-ana, _-carla, _-bruno, _-diego].

% --- disciplina_mais_dificil/1 ---

test(disciplina_mais_dificil_e_plp) :-
    disciplina_mais_dificil(Disciplina),
    Disciplina == plp.

:- end_tests(sistema_notas).