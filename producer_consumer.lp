%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define the original lattice. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lat(o).
v(o,0..3).
e(o,1,0).
e(o,2,0).
e(o,3,1).
e(o,3,2).
% achieved: represent the original lattice structure.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Open variables for the bridgified lattice, b. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

{ v(b, X) } :- X = 4..4.
% achieved: open more vertices in b for interpretation.

{ e(b, X, Y) } :- X = 0..4, Y=0..4.
% achieved: open more edges in b for interpretation.

