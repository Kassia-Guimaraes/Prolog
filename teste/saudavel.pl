caminha(ana).
natacao(manuel).
ginasio(vera).
burnout(joao).
burnout(vera).
workaholic(joao).
workaholic(manuel).

desporto(X) :- caminha(X), !.
desporto(X) :- natacao(X), !.
desporto(X) :- ginasio(X).

saudavel(Name) :- 
    desporto(Name), 
    \+burnout(Name), 
    \+workaholic(Name).