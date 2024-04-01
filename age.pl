idade :- 
    write("Em que ano nasceu?"), nl,
    read(X),
    date(Year, Month, Day),
    Age is Year - X,
    write("Você tem"), tab(1), write(Age),tab(1), write("anos").

date(Year, Month, Day):-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(year, DateTime, Year),
    date_time_value(month, DateTime, Month),
    date_time_value(day, DateTime, Day).