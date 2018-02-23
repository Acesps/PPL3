% Principles of programming languages assignment 3
% Team Members:
% 
% 2015A7PS0030H : Sachet Shandilya
% 2015A7PS0119H : Afroz Ahamad Siddiqui
% 2015A7PS0168H : Shubham Singal
% 2015A7PS0179H : Nikhil Joshi

digit(0).
digit(1) :- write(one).
digit(2) :- write(two).
digit(3) :- write(three).
digit(4) :- write(four).
digit(5) :- write(five).
digit(6) :- write(six).
digit(7) :- write(seven).
digit(8) :- write(eight).
digit(9) :- write(nine).

% for numbers between 10 and 19
ten_to_twenty(0) :- write(ten).
ten_to_twenty(1) :- write(eleven).
ten_to_twenty(2) :- write(twelve).
ten_to_twenty(3) :- write(thirteen).
ten_to_twenty(4) :- write(fourteen).
ten_to_twenty(5) :- write(fifteen).
ten_to_twenty(6) :- write(sixteen).
ten_to_twenty(7) :- write(seventeen).
ten_to_twenty(8) :- write(eighteen).
ten_to_twenty(9) :- write(nineteen).

% multiples of ten for numbers between 20 and 99
multiple_of_ten(2) :- write(twenty).
multiple_of_ten(3) :- write(thirty).
multiple_of_ten(4) :- write(fourty).
multiple_of_ten(5) :- write(fifty).
multiple_of_ten(6) :- write(sixty).
multiple_of_ten(7) :- write(seventy).
multiple_of_ten(8) :- write(eighty).
multiple_of_ten(9) :- write(ninety).

% ten_to_hundred deals with only 2 digits, B and C
ten_to_hundred([B, C]) :-
    B = 0, !, digit(C).
ten_to_hundred([B, C]) :-
    B = 1, !, ten_to_twenty(C).
ten_to_hundred([B, 0]) :-
    !, multiple_of_ten(B).
ten_to_hundred([B, C]) :-
    multiple_of_ten(B), write(' '), digit(C).


% hundred_to_thousand deals with 3 digits
hundred_to_thousand([A, B, C]) :-
    A = 0, !, ten_to_hundred([B, C]).
hundred_to_thousand([A, 0, 0]) :-
    !, digit(A), write(' hundred').
hundred_to_thousand([A, B, C]) :-
    digit(A), write(' hundred '), ten_to_hundred([B, C]).


% thousand_to_million deals with 6 digits
thousand_to_million([A, B, C, D, E, F]) :-
    A = 0, B = 0, C = 0, !,
    hundred_to_thousand([D, E, F]).
thousand_to_million([A, B, C, D, E, F]) :-
    hundred_to_thousand([A, B, C]),
    write(' thousand '),
    hundred_to_thousand([D, E, F]).

% million_to_billion deals with 9 digits
million_to_billion([A, B, C, D, E, F, G, H, I]) :-
    A = 0, B = 0, C = 0, !,
    thousand_to_million([D, E, F, G, H, I]).
million_to_billion([A, B, C, D, E, F, G, H, I]) :-
    hundred_to_thousand([A, B, C]),
    write(' million '),
    thousand_to_million([D, E, F, G, H, I]).

convert_to_words(X) :-
    get_list_of_digits(X, 9, L),
    reverse(L, Digits),
    million_to_billion(Digits).

get_list_of_digits(_, 0, []) :- !.
get_list_of_digits(X, N, L) :-
    Q is X // 10,
    R is X mod 10,
    N1 is N - 1,
    get_list_of_digits(Q, N1, L1),
    L = [R | L1].