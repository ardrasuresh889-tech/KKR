% =====================================================================
% Jealous Husbands Puzzle - ASP Encoding (Clingo)
% =====================================================================

% Individuals
individual(m1).
individual(m2). 
individual(m3).
individual(w1). 
individual(w2). 
individual(w3).

% Husbands and Wives
husband(m1). 
husband(m2). 
husband(m3).
wife(w1). 
wife(w2). 
wife(w3).

% Couples
couple(m1,w1). 
couple(m2,w2). 
couple(m3,w3).

% Boat
boat(boat).

% Shores
shore(left). 
shore(right).
opposite_shore(left,right). 
opposite_shore(right,left).

% Time Horizon (0..10 steps)
time(0..10).


% Initial State All individuals and boat start on the left shore
at_bank(left, boat, 0).
at_bank(left, X, 0) :- individual(X).


% Fluents 
at_bank(B, X, T+1) :- at_bank(B, X, T), not -at_bank(B,X,T+1), time(T).


% Goal State
goal_completed :- at_bank(right, boat, T), at_bank(right, P, T) : individual(P).
:- not goal_completed.

% Actions
{ cross(X,T) : individual(X) } 2 :- time(T).


% Action Constraints
:- cross(X,T), at_bank(B,X,T), at_bank(OTHER, boat,T), opposite_shore(B, OTHER).

% Only married couples can cross together
:- cross(W,T), cross(H,T), wife(W), husband(H), not couple(H,W).

% A woman cannot be left with other men unless her husband is present
:- at_bank(B,W,T), wife(W), at_bank(B,M,T), husband(M), not couple(M,W),
   not at_bank(B,H,T), couple(H,W), shore(B), time(T).

% Action Effects
at_bank(B,X,T+1) :- cross(X,T), at_bank(OTHER, X, T), at_bank(OTHER, boat,T),shore(B), shore(OTHER), opposite_shore(B,OTHER).
at_bank(B, boat, T+1) :- cross(X,T), at_bank(OTHER, boat,T),shore(B), shore(OTHER), opposite_shore(B,OTHER).

% Individuals and boat leave original shore after crossing
-at_bank(OTHER, X, T+1) :- cross(X,T), at_bank(OTHER,X,T), at_bank(OTHER, boat,T), shore(OTHER).
-at_bank(OTHER, boat, T+1) :- cross(X,T), at_bank(OTHER, boat,T), shore(OTHER).

% Output
#show cross/2.