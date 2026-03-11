%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model-Based Diagnosis: Numeric Circuit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Components and types
type(c1, mult). 
type(c2, mult).  
type(c3, mult).  
type(c4, plus).  
type(c5, plus).  
comp(C) :- type(C,_).

% Connections
conn(x1, inp1(c1)). 
conn(x2, inp2(c1)).  
conn(x2, inp1(c2)).  
conn(x3, inp2(c2)). 
conn(x3, inp1(c3)). 
conn(x4, inp2(c3)).  
conn(out(c1), inp1(c4)).  
conn(out(c2), inp2(c4)).  
conn(out(c4), y1).        
conn(out(c2), inp1(c5)).  
conn(out(c3), inp2(c5)).  
conn(out(c5), y2).        

% Domain & Arithmetic
int(0..100).
mult(X, Y, X*Y) :- int(X), int(Y).  % Z = X * Y
plus(X, Y, X+Y) :- int(X), int(Y).  % Z = X + Y

% Gate behavior 
val(out(C), Z) :- type(C, mult), nab(C), val(inp1(C), X), val(inp2(C), Y), mult(X, Y, Z).      
val(inp1(C), 1) :- type(C, mult), nab(C), val(out(C), 1).
val(inp2(C), 1) :- type(C, mult), nab(C), val(out(C), 1).
val(inp1(C), X) :- type(C, mult), nab(C), val(inp2(C), Y), val(out(C), Z), Z != 0, mult(X, Y, Z).      
val(inp2(C), Y) :- type(C, mult), nab(C), val(inp1(C), X), val(out(C), Z), Z != 0, mult(X, Y, Z).      
val(inp1(C), 0) :- type(C, mult), nab(C), val(inp2(C), Y), Y != 0, val(out(C), 0).           
val(inp2(C), 0) :- type(C, mult), nab(C), val(inp1(C), X), X != 0, val(out(C), 0).           

% same way i defined addition gates also
val(out(C), Z) :- type(C, plus), nab(C), val(inp1(C), X), val(inp2(C), Y), plus(X, Y, Z).  
val(inp1(C), X) :- type(C, plus), nab(C), val(inp2(C), Y), val(out(C), Z), plus(X, Y, Z).      
val(inp2(C), Y) :- type(C, plus), nab(C), val(inp1(C), X), val(out(C), Z), plus(X, Y, Z).      

% propagation of values
val(To, V) :- conn(From, To), val(From, V).
val(From, V) :- conn(From, To), val(To, V).

% Integrity constraints
:- val(P, _), #count{V : val(P, V)} > 1.
:- comp(C), nab(C), val(out(C), _), not val(inp1(C), _).
:- comp(C), nab(C), val(out(C), _), not val(inp2(C), _).
:- comp(C), nab(C), val(inp1(C), _), val(inp2(C), _), not val(out(C), _).

% diagnoses of fixed size
#const n = 0.
nab(C) :- comp(C), not ab(C).
{ ab(C) : comp(C) } = n.

% The goal is to have only minimal diagnosis subsets included, kindly remove the commented code segments.
% Adding all those up will give us c5, c1+c2, c2+c4 . Then fix the constant to 1 c5 is the only solution . 
% Exclude all components containing c5 and increased the constant to 2, then get c1+c2 and c2+c4.
% Increase the constant to n =3 and added another line

%:- ab(c5).
%:- ab(c2), ab(c4).
%:- ab(c1), ab(c2).

% output
#show ab/1.


