:- module(dados, [
    aluno/1,
    disciplina/4,
    prova/5,
    prova_final/3
]).

:- dynamic aluno/1.
:- dynamic disciplina/4.
:- dynamic prova/5.
:- dynamic prova_final/3.

% Base de conhecimento inicial.

aluno(ana).
aluno(bruno).
aluno(carla).
aluno(diego).

disciplina(plp, 7.0, 0.6, 0.4).
disciplina(matematica, 7.0, 0.6, 0.4).
disciplina(banco_de_dados, 7.0, 0.6, 0.4).

prova(ana, plp, prova1, 8.0, 1.0).
prova(ana, plp, prova2, 7.5, 1.0).
prova_final(ana, plp, sem_final).

prova(bruno, plp, prova1, 5.0, 1.0).
prova(bruno, plp, prova2, 6.0, 1.0).
prova_final(bruno, plp, pendente).

prova(carla, plp, prova1, 5.5, 1.0).
prova(carla, plp, prova2, 6.0, 1.0).
prova_final(carla, plp, feita(9.0)).

prova(diego, plp, prova1, 4.0, 1.0).
prova(diego, plp, prova2, 5.0, 1.0).
prova_final(diego, plp, feita(4.0)).

prova(ana, matematica, prova1, 9.0, 1.0).
prova(ana, matematica, prova2, 8.0, 1.0).
prova_final(ana, matematica, sem_final).

prova(bruno, matematica, prova1, 6.0, 1.0).
prova(bruno, matematica, prova2, 6.5, 1.0).
prova_final(bruno, matematica, pendente).

prova(carla, banco_de_dados, prova1, 8.0, 1.0).
prova(carla, banco_de_dados, prova2, 9.0, 1.0).
prova_final(carla, banco_de_dados, sem_final).

prova(diego, banco_de_dados, prova1, 5.0, 1.0).
prova(diego, banco_de_dados, prova2, 5.5, 1.0).
prova_final(diego, banco_de_dados, pendente).
