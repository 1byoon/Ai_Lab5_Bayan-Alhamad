% ---------------------------
% Lab 5 - Bayan Qasim Alhamad
% ---------------------------

% Male facts
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Female facts
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent facts
parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).


% =========================
% Rules
% =========================

% Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Son
son(X, Y) :-
    parent(Y, X),
    male(X).

% Daughter
daughter(X, Y) :-
    parent(Y, X),
    female(X).

% Brother
brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

% Sister
sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

% Grandfather
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% Aunt
aunt(X, Y) :-
    parent(P, Y),
    sister(X, P).

% Uncle
uncle(X, Y) :-
    parent(P, Y),
    brother(X, P).

% Helper rule for cousin
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Cousin
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% Ancestor - base case
ancestor(X, Y) :-
    parent(X, Y).

% Ancestor - recursive case
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% =========================
% Rule Testing
% =========================

% 1. Father
% ?- father(homer, bart).
% true.
%
% ?- father(X, lisa).
% X = homer.

% 2. Mother
% ?- mother(marge, bart).
% true.
%
% ?- mother(X, homer).
% X = mona.

% 3. Son
% ?- son(bart, homer).
% true.
%
% ?- son(X, abraham).
% X = herb ;
% X = homer.

% 4. Daughter
% ?- daughter(lisa, homer).
% true.
%
% ?- daughter(X, clancy).
% X = marge ;
% X = patty ;
% X = selma.

% 5. Brother
% ?- brother(bart, lisa).
% true.
%
% ?- brother(herb, homer).
% true.

% 6. Sister
% ?- sister(lisa, bart).
% true.
%
% ?- sister(patty, marge).
% true.

% 7. Grandfather
% ?- grandfather(abraham, bart).
% true.
%
% ?- grandfather(clancy, lisa).
% true.

% 8. Aunt
% ?- aunt(patty, bart).
% true.
%
% ?- aunt(selma, lisa).
% true.

% 9. Uncle
% ?- uncle(herb, bart).
% true.
%
% ?- uncle(herb, maggie).
% true.

% 10. Cousin
% ?- cousin(ling, bart).
% true.
%
% ?- cousin(ling, lisa).
% true.

% 11. Ancestor
% ?- ancestor(abraham, bart).
% true.
%
% ?- ancestor(X, maggie).
% X = homer ;
% X = marge ;
% X = abraham ;
% X = mona ;
% X = clancy ;
% X = jackie.
