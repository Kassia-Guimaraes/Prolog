find_max(X, Y, X) :- X >= Y, !.
find_max(X, Y, Y) :- X < Y.

find_min(X, Y, X) :- (X < Y; X = Y), !.
find_min(X, Y, Y) :- X > Y.

maximun :-
    write("Primeiro número: "),
    read(A),
    write("Segundo número: "),
    read(B),
    find_max(A, B, Max),
    write("O maior número é:"), tab(1), write(Max).

minimun :-
    write("Primeiro número: "),
    read(A),
    write("Segundo número: "),
    read(B),
    find_min(A, B, Min),
    write("O menor número é:"), tab(1), write(Min).
