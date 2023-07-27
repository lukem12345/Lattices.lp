%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose which relations to output. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%#show leq/3.
%#show meet/4.
%#show join/4.
%#show maximal/2.
#show top/2.
%#show minimal/2.
#show bot/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Open relations for interpretation for all lattices. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

1 {meet(W, X, Y, Z) : v(Z)} 1 :- lat(W), v(X), v(Y).
% achieved: each two nodes has exactly one meet.

1 {maximal(W, X) : v(X) } 1 :- lat(W).
% achieved: each lattice has exactly one maximal element.

1 {top(W, X) : v(X) } 1 :- lat(W).
% achieved: each lattice has exactly one top.

1 {join(W, X, Y, Z) : v(Z)} 1 :- lat(W), v(X), v(Y).
% achieved: each two nodes has exactly one join.

1 {minimal(W, X) : v(X) } 1 :- lat(W).
% achieved: each lattice has exactly one minimal element.

1 {bot(W, X) : v(X) } 1 :- lat(W).
% achieved: each lattice has exactly one bot.

%%%%%%%%%%%%%%%%%%%%%%%
% Define leq and geq. %
%%%%%%%%%%%%%%%%%%%%%%%

% TODO: Check this rule
e(W,X,Y) :- leq(W,X,Y), X != Y, leq(W,X,Z), leq(W,Z,Y), X != Z, Y != Z : v(Z).
% achieved: an edge exists if an element is leq than another, and none is between them.

leq(W,X,Y) :- e(W,X,Y).
% achieved: an element is leq another if there is an edge from one to the other.

geq(W,X,Y) :- e(W,Y,X).
% achieved: an element is geq another if there is an edge to one from the other.

leq(W,X,X) :- lat(W), v(X).
% achieved: leq is reflexive.

leq(W,X,Z) :- leq(W,X,Y), leq(W,Y,Z).
% achieved: leq is transitive.

X = Y :- leq(W,X,Y), leq(W,Y,X).
% achieved: leq is antisymmetric.

geq(W,X,X) :- lat(W), v(X).
% achieved: geq is reflexive.

geq(W,X,Z) :- geq(W,X,Y), geq(W,Y,Z).
% achieved: geq is transitive.

X = Y :- geq(W,X,Y), geq(W,Y,X).
% achieved: geq is antisymmetric.

%%%%%%%%%%%%%%%%%%%%%%%%%
% Define meet and join. %
%%%%%%%%%%%%%%%%%%%%%%%%%

:- meet(W,X,Y,Z), not leq(W,Z,X).
:- meet(W,X,Y,Z), not leq(W,Z,Y).
% achieved: meet is leq the two elements.

meet(W,X,X,X) :- lat(W), v(X).
% achieved: meet of an element and itself is itself.

:- meet(W,X,Y,Z), leq(W,A,X), leq(W,A,Y), leq(W,Z,A), A != Z : v(Z).
% achieved: meet is greater than all other elements leq the two.

:- join(W,X,Y,Z), not geq(W,Z,X).
:- join(W,X,Y,Z), not geq(W,Z,Y).
% achieved: join is geq the two elements.

join(W,X,X,X) :- lat(W), v(X).
% achieved: join of an element and itself is itself.

:- join(W,X,Y,Z), geq(W,A,X), geq(W,A,Y), geq(W,Z,A), A != Z : v(Z).
% achieved: join is lesser than all other elements geq the two.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define maximal, minimal, top, and bot. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- maximal(W,X), leq(W,X,Y), X != Y.
% achieved: a maximal element is only leq itself.

:- minimal(W,X), geq(W,X,Y), X != Y.
% achieved: a minimal element is only geq itself.

maximal(W,X) :- top(W,X).
% achieved: top is maximal.

minimal(W,X) :- bot(W,X).
% achieved: bot is minimal.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Open variables for the bridgified lattice, b. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%1 {meet(W, X, Y, Z) : v(Z)} 1 :- lat(W), v(X), v(Y).
%% achieved: each two nodes has exactly one meet.
%
%1 {maximal(W, X) : v(X) } 1 :- lat(W).
%% achieved: each lattice has exactly one maximal element.
%
%1 {top(W, X) : v(X) } 1 :- lat(W).
%% achieved: each lattice has exactly one top.
%
%1 {join(W, X, Y, Z) : v(Z)} 1 :- lat(W), v(X), v(Y).
%% achieved: each two nodes has exactly one join.
%
%1 {minimal(W, X) : v(X) } 1 :- lat(W).
%% achieved: each lattice has exactly one minimal element.
%
%1 {bot(W, X) : v(X) } 1 :- lat(W).
%% achieved: each lattice has exactly one bot.

%leq(o,0,0).
%leq(o,1,1).
%leq(o,2,2).
%leq(o,3,3).
%leq(o,1,0).
%leq(o,2,0).
%leq(o,3,1).
%leq(o,3,2).
%leq(o,3,0).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declare properties bridgification preserves. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%meet(b,X,Y,Z) :- meet(o,X,Y,Z).
%% achieved: bridgification preserves meets.
