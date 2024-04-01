%
% Movie database: movie.pl
%

% Escrever as regras:
%  a. released_after(M, Y) <- the movie was released after the given year.
%  b. released_before(M, Y) <- the movie was released before the given year.
%  c. same_year(M1, M2) <- the movies are released in the same year.
%  d. co_star(A1, A2) <- the actor/actress are in the same movie.

% released_after(M, 2000), write('O filme '), write(M), write(' foi lançado depois de 2000').

released_after(M, Y) :- movie(M,Ano), Ano > Y. 
released_before(M, Y) :- movie(M,Ano), Ano < Y.
same_year(M1, M2) :- movie(M1, Ano), movie(M2, Ano), M1 \= M2.
co_star(A1, A2) :- ( 
    (actress(M, A1, _), actor(M, A2, _));
    (actress(M, A1, _), actress(M, A2, _));
    (actor(M, A1, _), actor(M, A2, _))
    ), A1 \= A2.

%
% Listas
% 
% L = [1 | [2, 3]]
% L = [1, 2, 3]
% [H|T] = [1, 2, 3, 4].
% H = 1,
% T = [2, 3, 4]

tamanho([],0).
% tamanho([H|T],N) :- tamanho(T,Aux), N is Aux+1.
tamanho([_|T],N) :- tamanho(T,Aux), N is Aux+1.

somalista([],0).
somalista([H|T],S) :- somalista(T,Aux), S is Aux+H.

% tamanho([1,2,3,4,5], L).
% tamanho([ana,maria,luis,vasco], L).

%
% estudantes e professores
%
:- discontiguous
        studies/2,
        teaches/2.

teaches(manuel, programacao_imperativa).  
studies(joao, programacao_imperativa).
studies(tiago, programacao_imperativa).
studies(ana, programacao_imperativa).  
studies(sofia, programacao_imperativa).

teaches(maria, programacao_declarativa). 
studies(tiago, programacao_declarativa).
studies(ana, programacao_declarativa).  
studies(margarida, programacao_declarativa).  

teaches(afonso, algebra). 
studies(joao, algebra).
studies(ana, algebra).  
studies(sofia, algebra).  

teaches(afonso, calculo). 
studies(joao, calculo).
studies(ana, calculo).  
studies(sofia, calculo).  
studies(teresa, calculo). 

professor(Prof,Aluno) :- teaches(Prof,X), studies(Aluno,X).
% professor(Prof,Aluno) :- teaches(Prof,X), studies(Aluno,X), !.

% D1 e D2 frequentadas por A e B
colegas(A,B) :- studies(A,D1),studies(A,D2),
    studies(B,D1),studies(B,D2),A \= B, D1 \= D2.

% colegas(ana,X)
% setof(X, colegas(ana,X), Results).
% Results = [joao, sofia, tiago]

multiprofessor(P) :- teaches(P, D1), teaches(P, D2), D1 \= D2.  

% multiprofessor(X)
% X = afonso
% X = afonso
% setof(X, multiprofessor(X), Results).
% Results = [afonso]

% Queries

% professores:
% teaches(X,_)
% X = manuel
% X = maria
% X = afonso
% alunos de algebra
% studies(Aluno, algebra).
% Aluno = joao
% Aluno = ana
% Aluno = sofia

% Rules

% Escreva o predicado professor(X, Y) que nos diz se X é professor de Y
/*
professor(maria,tiago) → true
professor(maria,sofia) → falso

colegas(X,Y) → se ambos frequentam mais do que uma disciplina
colegas(joao,margarida) → falso
colegas(ana,sofia) → true

multiprofessor(X) → diz se o professor X dá mais do que uma disciplina
*/