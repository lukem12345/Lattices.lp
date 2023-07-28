%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define the original lattice. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lat(o).
v(o,0..5).
e(o,1,0).
e(o,2,1).
e(o,3,1).
e(o,4,2).
e(o,4,3).
e(o,5,4).
% achieved: represent the original lattice structure.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Open variables for the bridgified lattice, b. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

{ v(b, X) } :- X = 6..6.
% achieved: open more vertices in b for interpretation.

{ e(b, X, Y) } :- X = 0..6, Y=0..6.
% achieved: open more edges in b for interpretation.

