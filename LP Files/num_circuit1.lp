%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model-Based Diagnosis: Numeric Circuit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Components and types
comp(c1;c2;c3;c4;c5).
type(c1,mult). type(c2,mult). type(c3,mult).
type(c4,plus). type(c5,plus).

% Connections
conn(x1,in1(c1)). conn(x2,in2(c1)). conn(x2,in1(c2)).
conn(x3,in2(c2)). conn(x3,in1(c3)). conn(x4,in2(c3)).
conn(out(c1),in1(c4)). conn(out(c2),in2(c4)).
conn(out(c2),in1(c5)). conn(out(c3),in2(c5)).
conn(out(c4),y1). conn(out(c5),y2).

% Domain & Arithmetic
int(0..100). 
mult(X,Y,Z):-int(X),int(Y),int(Z),Z=X*Y.
plus(X,Y,Z):-int(X),int(Y),int(Z),Z=X+Y.

% Fault model
#const n=0. { ab(C):comp(C) }<=n.
nab(C):-comp(C),not ab(C).

% Wiring & Value propagation
wire(A,B):-conn(A,B).
val(B,V):-wire(A,B),val(A,V),int(V). 
val(A,V):-wire(A,B),val(B,V),int(V).

% Gate behavior (non-faulty)
val(out(C),Z):-nab(C),type(C,mult),val(in1(C),X),val(in2(C),Y),mult(X,Y,Z).
val(in1(C),X):-nab(C),type(C,mult),val(in2(C),Y),val(out(C),Z),Y!=0,mult(X,Y,Z).
val(in2(C),Y):-nab(C),type(C,mult),val(in1(C),X),val(out(C),Z),X!=0,mult(X,Y,Z).

val(out(C),Z):-nab(C),type(C,plus),val(in1(C),X),val(in2(C),Y),plus(X,Y,Z).
val(in1(C),X):-nab(C),type(C,plus),val(in2(C),Y),val(out(C),Z),plus(X,Y,Z).
val(in2(C),Y):-nab(C),type(C,plus),val(in1(C),X),val(out(C),Z),plus(X,Y,Z).

% Integrity constraints
:-val(_,V),not int(V). :-val(W,V1),val(W,V2),V1!=V2.
:-nab(C),type(C,mult),val(in1(C),X),val(in2(C),Y),val(out(C),Z),not mult(X,Y,Z).
:-nab(C),type(C,plus),val(in1(C),X),val(in2(C),Y),val(out(C),Z),not plus(X,Y,Z).
:-val(in1(C),V),comp(C),not int(V). :-val(in2(C),V),comp(C),not int(V). :-val(out(C),V),comp(C),not int(V).

% Optional: block c3
% :- ab(c3).

% Minimize faults
#minimize {1,C:ab(C)}.

% Output
satisfiable:-#true.
#show satisfiable/0.
#show ab/1.