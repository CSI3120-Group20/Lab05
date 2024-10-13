/* Parent-child relationships */
parent(john, mary).
parent(john, tom).
parent(mary, ann).
parent(mary, fred).
parent(tom, liz).

/* Genders*/
male(john).
male(tom).
male(fred).
female(mary).
female(ann).
female(liz).

% Task B
% Auxiliary predicate used to test if N is odd or even
odd(N) :- R is N mod 2, R == 1.

% Base case
sum_odd_numbers([],0).
% Recursive case (even)
sum_odd_numbers([H|T], Sum) :- not(odd(H)), sum_odd_numbers(T, Sum).
% Recursive case (odd)
sum_odd_numbers([H|T], Sum) :- odd(H), sum_odd_numbers(T, NewSum), Sum is NewSum + H.