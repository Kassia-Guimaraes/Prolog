/* Factos */
men(custódio).
men(josé).
men(nuno).
men(joão).
men(jorge).
men(filipe).
men(kevin).
men(bernardo).
men(miguel).

woman(ana).
woman(irene).
woman(celina).
woman(lúcia).
 
/* irene's parents: custódio and ana */
parent(irene,custódio).
parent(irene,ana).
parent(lúcia,custódio).
parent(lúcia,ana).
parent(nuno,josé).
parent(nuno,irene).
parent(celina,josé).
parent(celina,irene).
parent(bernardo,celina).
parent(bernardo,kevin).
parent(miguel,celina).
parent(miguel,kevin).
parent(martim,nuno).

/* Rules */
father(X,Y):- men(Y),
    parent(X,Y).
 

mother(X,Y):- woman(Y),
    parent(X,Y).
 
gfather(X,Y):- men(Y),
    parent(X,Z),
    parent(Z,Y).

gmother(X,Y):- woman(Y),
    parent(X,Z),
    parent(Z,Y).
 
sister(X,Y):- 
    woman(Y),
    father(Y, F), father(X, F),X \= Y.
 
sister(X,Y):- 
    woman(Y),
    mother(Y, F), mother(X, F),X \= Y.
 
tia(X,Y):- woman(Y),
    parent(X,Z), sister(Z,Y).
 
brother(X,Y):- 
    men(Y),
    father(Y,F), father(X,F),X \= Y.
 
brother(X,Y):- 
    men(Y),
    mother(Y,M), mother(X,M),X \= Y.
 
uncle(X,Y):- men(Y),
    parent(X,Z), brother(Z,Y).

antepassado(X,Y):- parent(X,Y).
antepassado(X,Y):- parent(X,Z),
    antepassado(Z,Y).

descendente(P,F):-antepassado(F,P).    