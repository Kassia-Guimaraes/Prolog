%
% Factos
% Regras
%

loves(vincente, mia).
loves(marcelo, mia).
loves(sara, diogo).
loves(diogo, sara).

% jealous(X, Y) :- loves(X, Z), loves(Y, Z).
jealous(X, Y) :- loves(X, Z), loves(Y, Z), X \= Y.

% Testes:
% jealous(marcelo, marcelo)

% ano bissexto
% https://pt.wikipedia.org/wiki/Ano_bissexto
% São bissextos todos os múltiplos de 4, exceto se for múltiplo de 100 mas não de 400, p.ex.: 1996, 2000, 2004, 2008, 2012, 2016, 2020, 2024, 2028...
% São bissextos todos os anos múltiplos de 400, p.ex.: 1600, 2000, 2400, 2800...
% versão A
bissesto(Year) :- (Year mod 4=:=0, Year mod 100=\=0); Year mod 400=:=0.
% versão B
bissesto(Year) :- Year mod 4=:=0, Year mod 100=\=0.
bissesto(Year) :- Year mod 400=:=0.

% idade

idade :-
   write('Ano de nascimento: '),
   read(Ano),
   Idade is 2023 - Ano,
   write('Tem '), write(Idade), write(' anos').

% idade com cálculo do ano actual

idade :-
   write('Ano de nascimento: '),
   read(Ano),
   year(AnoAtual),
   Idade is 2023 - Ano,
   write('Tem '), write(Idade), write(' anos').
year(Year) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(year, DateTime, Year).

% find_max, com !

find_max(X, Y, X) :- X >= Y, !.
find_max(X, Y, Y) :- X < Y.

find_min(X, Y, X) :- X =< Y, !.
find_min(X, Y, Y) :- X > Y.
