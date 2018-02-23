father(disney,mickeymouse).
father(disney,donaldduck).
father(mickeymouse,minto).
father(mickeymouse,morley).
father(mickeymouse,morty).
father(mickeymouse,maisie).
father(donaldduck,goofy).
men(minto).
men(morley).
men(mickeymouse).
men(donaldduck).
men(goofy).
women(morty).
women(maisie).
women(nemo).
women(minniemouse).
women(daisyduck).
wife(minniemouse,mickeymouse).
wife(nemo,goofy).
wife(daisyduck,donaldduck).
mother(X,Y):- father(Z,Y),wife(X,Z).
brother(X,Y):- men(X),father(Z,X),father(Z,Y),not(X = Y).
grandson(X,Y):- father(W,Y),father(X,W),men(Y).
granddaughter(X,Y):- women(Y),father(W,Y),father(X,W).
uncle(X,Y):- father(Z,Y),brother(Z,X).
aunty(X,Y):- uncle(Z,Y),wife(X,Z).
cousins(X,Y):- father(Z,X),father(W,Y),brother(Z,W).
