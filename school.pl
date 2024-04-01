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

/*Rules*/
/*Lista de professores T e a cadeira C*/
professores(T,C) :-
    teaches(T,C).

/*Escreva o predicado professor(T, S) que nos diz se T é professor de S*/
professor(T, S) :-
    teaches(T,C), studies(S,C).

/*colegas(x,Y) → se ambos frequentam mais do que uma disciplina*/
colegas(S1,S2) :-
    (studies(S1,C1), studies(S2,C1)),
    ( studies(S1,C2), studies(S2,C2)),  
    S1 \= S2, 
    C1 \= C2.

multiprofessor(T) :-
    teaches(T, D1), teaches(T, D2), D1\=D2.