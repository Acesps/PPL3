store(chai_coffee_company, [nike,nica, seth],
[ pastry(berry, [orange, blueberry, strawberry], 2),
pastry(tropical, [orange, banana, mango, guava], 3),
pastry(blue, [banana, blueberry], 3) ]).
store(bits_and_bytes, [coet,dos],
[ pastry(pinacolada, [orange,pineapple, coconut], 2),
pastry(green, [orange, banana, kiwi], 5),
pastry(purple, [orange, blueberry, strawberry], 2),
pastry(smooth, [orange, banana, mango],1) ]).
store(yumpys, [arvin,vino,kart],
[ pastry(combo1, [strawberry, orange, banana], 2),
pastry(combo2, [banana, orange], 5),
pastry(combo3, [orange, peach, banana], 2),
pastry(combo4, [guava, mango, papaya, orange],1),
pastry(combo5, [grapefruit, banana, pear],1) ]).

count([],0).
count([_|T],Cnt):- count(T,S),Cnt is S+1.
more_than_four(X):- store(X,_,List2),count(List2,Z),Z>3.

check([H|_],X):- pastry(X,_,_)= H.
check([_|T],X):- check(T,X).
exists(X):- store(_,_,List2),check(List2,X).
