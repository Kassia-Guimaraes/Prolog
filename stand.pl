:- dynamic(stand/2).
% 1: representacao da base de dados
stand(vegas,[
            client(rui,2324,23,medico,[carro(audi,a2,20000),
                                        carro(bmw,serie3,30000)]),
             client(rita,2325,32,advogado,[carro(audi,a3,30000)]),
             client(joao,2326,26,professor,[moto(honda,gl1800,26000)]),
             client(ana,2327,49,medico,[carro(audi,a4,40000),
                                         carro(bmw,serie3,32000),
                                         carro(ford,focus,24000)])
]).
stand(miami,[
            client(rui,3333,33,operario,[carro(fiat,panda,12000)]),
            client(paulo,3334,22,advogado,[carro(audi,a4,36000)]),
            client(pedro,3335,46,advogado,[carro(honda,accord,32000),
                                           carro(audi,a2,20000)])
]).

/* membro(X,L) – que é verdadeiro se X pertencer à lista L */
member(Member, [Member|_]).
member(Member, [_|RestList]):- member(Member, RestList).

/* comprimento(X,L) – onde X é o número de elementos da lista L. */
size(0, []).
size(NumberElements, [_|RestList]):-
    size(Counter, RestList), NumberElements is Counter+1.

/* media(X,L) – onde X é o valor médio da lista L (assumir que L contém
somente números). */
sum_list(0, []).
sum_list(Sum, [Head|RestList]):-
    sum_list(Counter, RestList), Sum is Counter+Head.

media(Media, [Head|RestList]):-
    sum_list(Sum, [Head|RestList]),
    size(NumberElements, [Head|RestList]),
    Media is Sum / NumberElements.

/* adiciona(X,L1,L2) – onde L2 é a lista que contém o elemento X e a lista L1. */
append(ToAdd, List, [ToAdd|List]):-!.

/* listar_clientes(X,LC) – devolve a lista LC com o nome de todos clientes do
stand X */
client_list(StandName, ClientsList):-
    stand(StandName, StandValue),
    findall(ClientName, member(client(ClientName,_,_,_,_), StandValue), ClientsList).

/* listar_dados(X,C,D) – devolve a lista D com todos dados (i.e.: numero, idade
e profissão) do cliente com o nome C do stand X */
data_list(StandName, Client, DataList):-
    stand(StandName, StandValue),
    findall((Id, Age, Occupation), 
            member(client(Client, Id, Age, Occupation, _), StandValue), DataList).

/* listar_carros(X,LM) – devolve a lista LM com o nome de todas as marcas de
carros vendidos pelo stand X */
car_list(StandName, BrandList):-
    stand(StandName, StandValue),
    findall((CarValue), member(client(_,_,_,_, CarValue), StandValue), CarList),
    flatten(CarList, AboutCar),
    findall((Brand), member(carro(Brand,_,_), AboutCar), BrandList).

/* listar_advogados(LA):- devolve a lista LA com o nome de todos os 
advogados de todos os stands */
lawyer_list(Lawyer):-
    findall(Clients, stand(_, Clients), ClientList),
    flatten(ClientList, ClientValue),
    findall(Name, member(client(Name,_,_,advogado,_),ClientValue),Lawyer).

/* preco_medio(X,Med) - devolve o preço médio (Med) de todos os carros 
vendidos por um stand. Nota: pode re-utilizar o predicado media(X,L) do 
exercício anterior */
media_price(StandName,Media):-
    stand(StandName, StandValue),
    findall(CarValue, member(client(_,_,_,_, CarValue), StandValue), CarList),
    flatten(CarList, AboutCar),
    findall(Price, member(carro(_,_,Price), AboutCar), PriceList),
    media(Media, PriceList).

/* altera_id(X,C,Id) – altera a idade do cliente C do stand X para Id. Nota: deve 
usar os predicados do Prolog assert e retract. */
change_age(StandName, ClientName, NewAge):-
    retract(stand(StandName, StandValue)),
    change_id(StandValue, NewStandValue, ClientName, NewAge),
    assert(stand(StandName, NewStandValue)).

change_age(StandValue, NewStandValue, ClientName, NewAge):-
    select(client(ClientName, Id, _,Occupation, CarValue), StandValue, StandChanged),
    append([client(ClientName, Id, NewAge, Occupation, CarValue)], StandChanged, NewStandValue).

test:- write('mudar idade da ana\nde:'),
 data_List(vegas,ana,D),write(D),
 change_age(vegas,ana,50),data_list(vegas,ana,D1),
 write(' para: '),write(D1).