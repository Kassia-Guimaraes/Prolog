equipa(braga).
equipa(benfica).
equipa(rio_ave).
equipa(valadares).
equipa(maritimo).
equipa(famalicao).
jogador(braga,dolores_silva).
jogador(braga,laura_luis).

jogo(valadares,braga,1,0,"05/11/2023").
jogo(famalicao,braga,1,1,"11/11/2023").
jogo(braga,benfica,0,1,"19/11/2023").
jogo(maritimo,braga,4,1,"25/11/2023").
jogo(rio_ave,braga,0,7,"09/12/2023").

pontuacao_jogo(E,X) :- jogo(E,_,M,S,_), M > S, X is 3. 
pontuacao_jogo(E,X) :- jogo(_,E,S,M,_), M > S, X is 3. 
pontuacao_jogo(E,X) :- jogo(E,_,M,S,_), M < S, X is 0. 
pontuacao_jogo(E,X) :- jogo(_,E,S,M,_), M < S, X is 0. 
pontuacao_jogo(E,X) :- jogo(E,_,M,S,_), M == S, X is 1. 
pontuacao_jogo(E,X) :- jogo(_,E,S,M,_), M == S, X is 1.

pontuacao(E,Soma) :- bagof( X, pontuacao_jogo(E,X), Pontos), sumlist(Pontos, Soma).

pontos :-
   write('Equipa: '),
   read(Equipa),
   pontuacao(Equipa,Soma),
   write('Tem '), write(Soma), write(' pontos').