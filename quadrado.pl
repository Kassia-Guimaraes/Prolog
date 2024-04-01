qd :-
   write('Write a number: '),
   read(X),
   Y is X * X, % atribuição de variável
   write('Quadrado é'),tab(1),write(Y),
   nl, qd. %faz voltar para a função