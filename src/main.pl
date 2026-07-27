:- use_module(dados).
:- use_module(regras).

main :-
    loop.

loop :-
    nl,
    writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='),
    writeln('         Sistema de Notas          '),
    writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='),
    writeln('Selecione uma opcao:'), nl,
    writeln('Adicionar Aluno(A)'),
    writeln('Adicionar Disciplina(I)'),
    writeln('Adicionar Nota(N)'),
    writeln('Media Geral das Notas(M)'),
    writeln('Maior Media(T)'),
    writeln('Porcentagem de Aprovacao(P)'),
    writeln('Nota Necessaria na prova Final(F)'),
    writeln('Disciplina mais Dificil(D)'),
    writeln('Ranking de Notas(R)'),
    writeln('Sair(S)'), nl,
    get_single_char(Codigo),
    skip_line,
    char_code(Letra, Codigo),
    upcase_atom(Letra, LetraMaiuscula),
    escolha(LetraMaiuscula).

escolha('A') :- !, adicionar_aluno, loop.
escolha('I') :- !, adicionar_disciplina, loop.
escolha('N') :- !, adicionar_nota, loop.
escolha('M') :- !, mostrar_media_geral, loop.
escolha('T') :- !, mostrar_maior_media, loop.
escolha('P') :- !, mostrar_porcentagem_aprovacao, loop.
escolha('F') :- !, mostrar_nota_necessaria, loop.
escolha('D') :- !, mostrar_disciplina_mais_dificil, loop.
escolha('R') :- !, mostrar_ranking, loop.
escolha('S') :- !, nl, writeln('Ate Mais!').
escolha(_) :- nl, writeln('Resposta Invalida'), loop.

% --- Leitura auxiliar ---

ler_atom(Prompt, Atomo) :-
    write(Prompt),
    read_line_to_string(user_input, Texto),
    atom_string(Atomo, Texto).

ler_numero(Prompt, Numero) :-
    write(Prompt),
    read_line_to_string(user_input, Texto),
    number_string(Numero, Texto).

% --- Acoes do menu ---

adicionar_aluno :-
    ler_atom('Nome do aluno: ', Nome),
    ( aluno(Nome)
    -> (nl, writeln('Aluno ja existe.'))
    ;  (assertz(aluno(Nome)), nl, writeln('Aluno adicionado com sucesso!'))
    ).

adicionar_disciplina :-
    ler_atom('Nome da disciplina: ', Nome),
    ler_numero('Media de aprovacao: ', MediaAprovacao),
    ler_numero('Peso da media: ', PesoMedia),
    ler_numero('Peso da final: ', PesoFinal),
    assertz(disciplina(Nome, MediaAprovacao, PesoMedia, PesoFinal)),
    nl, writeln('Disciplina adicionada com sucesso!').

adicionar_nota :-
    ler_atom('Nome do aluno: ', Aluno),
    ler_atom('Nome da disciplina: ', Disciplina),
    ler_atom('Identificador da prova (ex: prova1): ', IdProva),
    ler_numero('Nota: ', Nota),
    ler_numero('Peso: ', Peso),
    assertz(prova(Aluno, Disciplina, IdProva, Nota, Peso)),
    nl, writeln('Nota adicionada com sucesso!').

mostrar_media_geral :-
    ( media_geral_turma(Media)
    -> format('~nMedia geral da turma: ~2f~n', [Media])
    ;  (nl, writeln('Nao ha dados suficientes.'))
    ).

mostrar_maior_media :-
    ( maior_media(Aluno, Media)
    -> format('~nMaior media: ~w com ~2f~n', [Aluno, Media])
    ;  (nl, writeln('Nao ha dados suficientes.'))
    ).

mostrar_porcentagem_aprovacao :-
    ( porcentagem_aprovacao(Porcentagem)
    -> format('~nPorcentagem de aprovacao: ~2f%~n', [Porcentagem])
    ;  (nl, writeln('Nao ha dados suficientes.'))
    ).

mostrar_nota_necessaria :-
    ler_atom('Nome do aluno: ', Aluno),
    ler_atom('Nome da disciplina: ', Disciplina),
    ( aprovado_direto(Aluno, Disciplina)
    -> (nl, writeln('Aluno ja esta aprovado direto, nao precisa de final.'))
    ;  ( nota_necessaria_final(Aluno, Disciplina, Nota)
       -> format('~nNota necessaria na final: ~2f~n', [Nota])
       ;  (nl, writeln('Nao foi possivel calcular (verifique os dados).'))
       )
    ).

mostrar_disciplina_mais_dificil :-
    ( disciplina_mais_dificil(Disciplina)
    -> format('~nDisciplina mais dificil: ~w~n', [Disciplina])
    ;  (nl, writeln('Nao ha dados suficientes.'))
    ).

mostrar_ranking :-
    ( ranking_alunos(Ranking)
    -> ( nl, writeln('Ranking de alunos:'),
         forall(member(Media-Aluno, Ranking),
                format('~w: ~2f~n', [Aluno, Media]))
       )
    ;  (nl, writeln('Nao ha dados suficientes.'))
    ).

:- initialization(main).

