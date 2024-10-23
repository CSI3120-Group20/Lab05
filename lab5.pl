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

%Task A
%Two people are siblings if they share at least one parent and are not the same person
siblings(X,Y):-
    parent(P,X),
    parent(P,Y),
    X \= Y.
% A person is a grandparent if they are a parent of someone's parent
grandparent(GP,GC):-
    parent(GP,P),
    parent(P,GC).
% A person is an ancestor if they are either a firect parent or an ancestor of a paremt
ancestor(X,Y):-
    parent(X,Y). %Base case: X is a parent of Y
ancestor(X,Y):-
    parent(X,Z),
    ancestor(Z,Y). % Recursive case: X us an ancestor through Z
% Task B
% Auxiliary predicate used to test if N is odd or even
odd(N) :- R is N mod 2, R == 1.

% Base case
sum_odd_numbers([],0).
% Recursive case (even)
sum_odd_numbers([H|T], Sum) :- not(odd(H)), sum_odd_numbers(T, Sum).
% Recursive case (odd)
sum_odd_numbers([H|T], Sum) :- odd(H), sum_odd_numbers(T, NewSum), Sum is NewSum + H.


%Task C
% Helper Predicates
%checks whether two elements, X and Y, are adjacent
next_to(X, Y, List) :-
    append(_, [X, Y | _], List). %Y follows after X immediately


%checks if two elements are not adjacent
not_next_to(X, Y, List) :-
    %Y does not follow immediately after X and X does not follow immediately after Y
        \+ next_to(X, Y, List),
        \+ next_to(Y,X,List).

%Main predicate:solve puzzle
solve_puzzle(Houses, GreenIndex) :- 
    Houses = [H1,H2,H3,H4],
    %ensure all houses have unique color.
    permutation([red,blue,green,yellow], Houses),
    %Clue 1: The red house is immediately to the left of the blue house
    next_to(red,blue,Houses),
    %Clue 2: The treasure is in the green house
    nth1(GreenIndex,Houses,green),
    %Clue 3: The yellow house is not next to the green house
    not_next_to(yellow,green,Houses),
    % Clue 4: The green house is not in the second position from the left
    GreenIndex \= 2.


    
