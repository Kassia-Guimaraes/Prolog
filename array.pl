/* adiciona(X,L1,L2) – onde L2 é a lista que contém o elemento X e a lista L1. */
append(ToAdd, List, [ToAdd|List]):-!.

/* apaga(X,L1,L2) – onde L2 é a lista L1 sem o elemento X. */
delete(ToExclude, [ToExclude|RestList], RestList).
delete(ToExclude, [_|Rest_1], [_|Rest_2]):-
    delete(ToExclude, Rest_1, Rest_2).

/* membro(X,L) – que é verdadeiro se X pertencer à lista L. */
member(Member, [Member|_]).
member(Member, [_|RestList]):- member(Member, RestList).

/* concatena(L1,L2,L3) – onde L3 é resultado da junção das listas L2 e L1. */
concat([], List_1, List_1).
concat([_|List_1], List_2, [_|List_3]):-
    concat(List_1, List_2, List_3).

/* comprimento(X,L) – onde X é o número de elementos da lista L. */
size(0, []).
size(NumberElements, [_|RestList]):-
    size(Counter, RestList), NumberElements is Counter+1.

/* maximo(X,L) – onde X é o valor máximo da lista L (assumir que L contém
somente números). */
max_value(Unique, [Unique]).
max_value(Maximum, [Head|RestList]):-
    max_value(Maximum, RestList), Maximum > Head, !.
max_value(Head, [Head|_]).

/* media(X,L) – onde X é o valor médio da lista L (assumir que L contém
somente números). */
sum_list(0, []).
sum_list(Sum, [Head|RestList]):-
    sum_list(Counter, RestList), Sum is Counter+Head.

media(Media, [Head|RestList]):-
    sum_list(Sum, [Head|RestList]),
    size(NumberElements, [Head|RestList]),
    Media is Sum / NumberElements.

/* nelem(N,L,X) – onde N é um número e X é o elemento da lista L na posição
L. */
nelem(Position,List,Element):- nelem(Position,1,List,Element).
nelem(Position,Position,[Head|_],Head): -!.
nelem(Position,Value,[_|RestList],Element):- Index is Value+1,
    nelem(Position,Index,RestList,Element).