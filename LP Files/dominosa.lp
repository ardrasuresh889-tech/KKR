% To run this code, invoke through python as follows : 
% python -m clingo .\dominosa.lp .\dominosa-instance.lp
% To log the output, invoke python as follows : 
% python -m clingo .\dominosa.lp .\dominosa-instance.lp > Output.txt

% Set values for row and column length (Changed from static length to dynamic length)
row(Min..Max) :- Min = #min { R : cell(R, _, _) }, Max = #max { R : cell(R, _, _) }.
column(Min..Max) :- Min = #min { C : cell(_, C, _) }, Max = #max { C : cell(_, C, _) }.

% Guessing pair for a cell where the cell should have 1 adjacent cell
{ pair(R1,C1,R2,C2): adjacent(R1,C1,R2,C2) } = 1 :- cell(R1,C1,N).

% Adjacent relation+++++ between row and column
adjacent(R1,C1,R1,C2) :- row(R1),column(C1),column(C2),C2 = C1+1.
adjacent(R1,C1,R2,C1) :- row(R1),column(C1),row(R2),R2 = R1+1.
adjacent(R1,C1,R1,C2) :- row(R1),column(C1),column(C2),C2 = C1-1.
adjacent(R1,C1,R2,C1) :- row(R1),column(C1),row(R2),R2 = R1-1.

% Check for symmetry
pair(R1,C1,R2,C2) :- pair(R2,C2,R1,C1).

% Relation between domino and cells ==> N2 >= N1
domino(N1,N2) :- 
    pair(R1,C1,R2,C2), 
    cell(R1,C1,N1), 
    cell(R2,C2,N2), 
    N2 >= N1.

% Make sure all cells are covered
:- not pair(R1,C1,R2,C2), cell(R1,C1,N1), cell(R2,C2,N2), N2 >= N1, not domino(N1,N2).

% Make sure similar pairs do not exist
:- pair(R,C,R1,C1), pair(R,C,R2,C2), pair(R,C,R1,C1) != pair(R,C,R2,C2).

#show pair/4.