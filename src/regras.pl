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

media_disciplina(Aluno, Disciplina, Media) :-
    findall(Nota-Peso, prova(Aluno, Disciplina, _, Nota, Peso), Provas),
    Provas \= [],
    soma_provas(Provas, SomaNotas, SomaPesos),
    SomaPesos > 0,
    Media is SomaNotas / SomaPesos.

soma_provas([], 0, 0).
soma_provas([Nota-Peso | Resto], SomaNotas, SomaPesos) :-
    soma_provas(Resto, SomaNotasResto, SomaPesosResto),
    SomaNotas is SomaNotasResto + Nota * Peso,
    SomaPesos is SomaPesosResto + Peso.

media_geral_aluno(_Aluno, _Media) :-
    findall(D, prova(Aluno, D, _, _, _), DisciplinasComRepeticao),
    sort(DisciplinasComRepeticao, Disciplinas),
    findall(M, (member(D, Disciplinas), media_disciplina(Aluno, D, M)), Medias),
    Medias \= [],
    sum_list(Medias, Soma),
    length(Medias, Quantidade),
    Media is Soma / Quantidade.

media_geral_turma(_Media) :-
    throw(error(not_implemented(media_geral_turma/1), _)).

aprovado_direto(Aluno, Disciplina) :-
    media_disciplina(Aluno, Disciplina, Media),
    disciplina(Disciplina, MediaAprovacao, _, _),
    Media >= MediaAprovacao.

nota_necessaria_final(Aluno, Disciplina, Nota) :-
    media_disciplina(Aluno, Disciplina, Media),
    disciplina(Disciplina, MediaAprovacao, PesoMedia, PesoFinal),
    PesoFinal > 0,
    TotalPesos is PesoMedia + PesoFinal,
    NotaCalculada is (MediaAprovacao * TotalPesos - Media * PesoMedia) / PesoFinal,
    Nota is max(0, NotaCalculada).

situacao_aluno_disciplina(Aluno, Disciplina, aprovado_direto) :-
    aprovado_direto(Aluno, Disciplina).

situacao_aluno_disciplina(Aluno, Disciplina, em_final) :-
    \+ aprovado_direto(Aluno, Disciplina),
    prova_final(Aluno, Disciplina, pendente),
    nota_necessaria_final(Aluno, Disciplina, Nota),
    Nota =< 10.

situacao_aluno_disciplina(Aluno, Disciplina, reprovado) :-
    \+ aprovado_direto(Aluno, Disciplina),
    prova_final(Aluno, Disciplina, pendente),
    nota_necessaria_final(Aluno, Disciplina, Nota),
    Nota > 10.

situacao_aluno_disciplina(Aluno, Disciplina, aprovado_final) :-
    \+ aprovado_direto(Aluno, Disciplina),
    prova_final(Aluno, Disciplina, feita(NotaFinal)),
    media_final(Aluno, Disciplina, NotaFinal, MediaFinal),
    disciplina(Disciplina, MediaAprovacao, _, _),
    MediaFinal >= MediaAprovacao.

situacao_aluno_disciplina(Aluno, Disciplina, reprovado) :-
    \+ aprovado_direto(Aluno, Disciplina),
    prova_final(Aluno, Disciplina, feita(NotaFinal)),
    media_final(Aluno, Disciplina, NotaFinal, MediaFinal),
    disciplina(Disciplina, MediaAprovacao, _, _),
    MediaFinal < MediaAprovacao.

media_final(Aluno, Disciplina, NotaFinal, MediaFinal) :-
    media_disciplina(Aluno, Disciplina, Media),
    disciplina(Disciplina, _, PesoMedia, PesoFinal),
    TotalPesos is PesoMedia + PesoFinal,
    TotalPesos > 0,
    MediaFinal is (Media * PesoMedia + NotaFinal * PesoFinal) / TotalPesos.

aluno_aprovado(_Aluno) :-
    aluno(Aluno),
    findall(D, prova(Aluno, D, _, _, _), DisciplinasComRepeticao),
    sort(DisciplinasComRepeticao, Disciplinas),
    forall(
        member(D, Disciplinas),
        situacao_aluno_disciplina(Aluno, D, Situacao)
    ),
    \+ (member(D, Disciplinas), situacao_aluno_disciplina(Aluno, D, reprovado)).

porcentagem_aprovacao(_Porcentagem) :-
    throw(error(not_implemented(porcentagem_aprovacao/1), _)).

maior_media(_Aluno, _Media) :-
    findall(M-A, (aluno(A), media_geral_aluno(A, M)), Pares),
    Pares \= [],
    max_member(Media-Aluno, Pares).

ranking_alunos(_Ranking) :-
    throw(error(not_implemented(ranking_alunos/1), _)).

disciplina_mais_dificil(_Disciplina) :-
    throw(error(not_implemented(disciplina_mais_dificil/1), _)).
