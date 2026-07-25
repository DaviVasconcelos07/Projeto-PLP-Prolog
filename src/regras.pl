:- module(regras, [
    media_disciplina/3,
    media_geral_aluno/2,
    media_geral_turma/1,
    aprovado_direto/2,
    nota_necessaria_final/3,
    situacao_aluno_disciplina/3,
    aluno_aprovado/1,
    porcentagem_aprovacao/1,
    maior_media/2,
    ranking_alunos/1,
    disciplina_mais_dificil/1
]).

:- use_module(dados).

% As regras principais do sistema serao implementadas aqui.

media_disciplina(_Aluno, _Disciplina, _Media) :-
    throw(error(not_implemented(media_disciplina/3), _)).

media_geral_aluno(_Aluno, _Media) :-
    throw(error(not_implemented(media_geral_aluno/2), _)).

media_geral_turma(_Media) :-
    throw(error(not_implemented(media_geral_turma/1), _)).

aprovado_direto(_Aluno, _Disciplina) :-
    throw(error(not_implemented(aprovado_direto/2), _)).

nota_necessaria_final(_Aluno, _Disciplina, _Nota) :-
    throw(error(not_implemented(nota_necessaria_final/3), _)).

situacao_aluno_disciplina(_Aluno, _Disciplina, _Situacao) :-
    throw(error(not_implemented(situacao_aluno_disciplina/3), _)).

aluno_aprovado(_Aluno) :-
    throw(error(not_implemented(aluno_aprovado/1), _)).

porcentagem_aprovacao(_Porcentagem) :-
    throw(error(not_implemented(porcentagem_aprovacao/1), _)).

maior_media(_Aluno, _Media) :-
    throw(error(not_implemented(maior_media/2), _)).

ranking_alunos(_Ranking) :-
    throw(error(not_implemented(ranking_alunos/1), _)).

disciplina_mais_dificil(_Disciplina) :-
    throw(error(not_implemented(disciplina_mais_dificil/1), _)).
