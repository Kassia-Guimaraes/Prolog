% diviível por 4
% não pode ser divisível por 100
% divisível por 400

bissexto(Y) :-
    Y mod 4 =:= 0, % essa igualdade é de comparação
    Y mod 100 =\= 0;
    Y mod 400 =:= 0.