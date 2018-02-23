student(arpit).
student(manoj).
student(shrishti).
student(dhruv).
major(computer_science).
major(electronics).
major(mechanical).
major(civil).
tvshow(house_of_cards).
tvshow(black_mirror).
tvshow(mr_robot).
tvshow(suits).
birth(1994).
birth(1995).
birth(1996).
birth(1997).

puzzle:-
    major(ArpitM),major(ShrishtiM),major(ManojM),major(DhruvM),distinct([ArpitM,ManojM,ShrishtiM,DhruvM]),
    tvshow(ArpitT),tvshow(ShrishtiT),tvshow(ManojT),tvshow(DhruvT),distinct([ArpitT,ShrishtiT,ManojT,DhruvT]),
    birth(ArpitB),birth(ShrishtiB),birth(ManojB),birth(DhruvB),distinct([ArpitB,ShrishtiB,ManojB,DhruvB]),
Solution = [[arpit,ArpitM,ArpitT,ArpitB],[shrishti,ShrishtiM,ShrishtiT,ShrishtiB],[manoj,ManojM,ManojT,ManojB],[dhruv,DhruvM,DhruvT,DhruvB]],

    %1.
    member([_,_,suits,1996],Solution),
    %2.
   \+ member([_,_,house_of_cards,1994],Solution),
   \+ member([_,electronics,_,1997],Solution),
   %3
    \+ member([shrishti,computer_science,_,_],Solution),
    %4
    ((member([_,electronics,_,1996],Solution),member([dhruv,_,_,1995],Solution));
     (member([_,electronics,_,1995],Solution),member([dhruv,_,_,1996],Solution))
    ),
    %5
    \+ member([manoj,_,_,1995],Solution),
    %6
    member([_,computer_science,black_mirror,_],Solution),
    %7
    (
     member([dhruv,mechanical,_,_],Solution);
     member([arpit,mechanical,_,_],Solution)
     ),
    %8
    \+member([shrishti,_,house_of_cards,_],Solution),
    \+member([arpit,_,house_of_cards,_],Solution),

 %9
    \+member([_,computer_science,_,1997],Solution),
    \+member([dhruv,_,_,1994],Solution),
    \+member([dhruv,computer_science,_,_],Solution),
    %10
    (
     member([_,civil,suits,_],Solution);
     member([_,mechanical,suits,_],Solution)
     ),

    writer(arpit,ArpitM,ArpitT,ArpitB),
writer(dhruv,DhruvM,DhruvT,DhruvB),
writer(shrishti,ShrishtiM,ShrishtiT,ShrishtiB),
writer(manoj,ManojM,ManojT,ManojB).

    distinct([X|Rest]):- member(X,Rest),!,fail.
    distinct([_|Rest]):-distinct(Rest).
    distinct([_]).

writer(S,M,T,B):-
    write(S),write('= ['),write(M),write(', '),write(T),write(', '),write(B),write(']'),nl.














