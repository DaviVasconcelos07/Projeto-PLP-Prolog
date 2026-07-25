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
% Os fatos reais do projeto serao definidos aqui.

% aluno(Nome).

% disciplina(Nome, MediaAprovacao, PesoMediaRegular, PesoProvaFinal).

% prova(Aluno, Disciplina, Identificador, Nota, Peso).

% prova_final(Aluno, Disciplina, Situacao).
% Situacao pode ser:
% - sem_final
% - pendente
% - feita(Nota)
