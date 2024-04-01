loves(vicente, mia).
loves(marcelo, mia).
loves(marcelo, sara).
loves(diogo, sara).

loves(sara, diogo).
loves(sara, vincente).
loves(mia, vincente).
loves(abigail, marcelo).

jealous(X, Y) :- % verifica se as duas pessoas mencionadas gostam da mesma pessoa
    loves(X, Z), % a vírgula significa 'e' lógico
    loves(Y, Z),
    X\=Y.

verif_love(X, Y) :- % verifica se as duas pessoas se gostam
    loves(X, Y),
    loves(Y, X).