genero(joao,masculino).
genero(manuel,masculino).
genero(pedro,masculino).
genero(ana,feminino).
genero(teresa,feminino).
cantor(fernando_daniel).
cantor(taylor_swift).
cantor(lana_del_rey).
filme(missao_impossivel).
filme(operacao_kandahar).
filme(nyad).
filme(the_hunger_games).

gosta(joao,lana_del_rey).
gosta(joao,missao_impossivel).
gosta(manuel,fernando_daniel).
gosta(manuel,missao_impossivel).
gosta(pedro,fernando_daniel).
gosta(pedro,nyad).
gosta(ana,taylor_swift).
gosta(ana,nyad).
gosta(teresa,taylor_swift).
gosta(teresa,the_hunger_games).

% se forem de generos diferentes

interessados(A,B) :- genero(A,X), genero(B,Y), X \= Y.

compativeis(A,B) :- 
    interessados(A,B), (
        (gosta(A,C), gosta(B,C), cantor(C)); 
        (gosta(A,F), gosta(B,F), filme(F))
    ).