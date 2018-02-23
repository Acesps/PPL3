bubble(List,Sorted):-swap(List,List1),!,bubble(List1,Sorted).
bubble(Sorted,Sorted).
swap([X,Y | Rest],[Y,X | Rest]) :- X > Y.
swap([Z|Rest],[Z|Rest1]) :- swap(Rest,Rest1).

listcount([],0).
listcount([H|T],Cnt):- listcount(T,S),Cnt is S+1+H-H.

odd([],0).
odd(List,M):- listcount(List,S),1 is mod(S,2),M is 1.
odd(List,M):- listcount(List,S),0 is mod(S,2),M is 0.

medianposition(List1,Y):- odd(List1,Z),Z = 1,listcount(List1,S),Y is div(S,2)+1.
medianposition(List1,Y):- odd(List1,Z),Z = 0,listcount(List1,S),Y is div(S,2).

atposition([H|_],0,H):-!.
atposition([_|T],N,H):- N > 0,N1 is N-1,atposition(T,N1,H).

median(List2,Y):-odd(List2,Z),Z = 1,medianposition(List2,M),bubble(List2,Sorted),atposition(Sorted,M-1,N),Y is N.

median(List2,Y):-odd(List2,Z),Z=0,medianposition(List2,M),bubble(List2,Sorted),atposition(Sorted,M-1,N),atposition(Sorted,M,J),Y is N/2+J/2.
