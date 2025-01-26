function [A,Atrain] = Polyfitting4(X,Time)
%% This function Fits scattered points by 4th Order Polynomials
% Input:
% N - Order of Polynomials
% X - Trajectory
% Time - Corresponding Time vector
% Output:
% A - Coefficients of fitted trajectories
M1 = size(X,1); % Number of Discretized Nodes in Trajectory
M2 = size(X,2); % Number of Sample Trajectories in sample set
A = zeros(5,M2); % Initialize Coefficient Matrix
T = Time(end,:);
for i = 1:M2
t = Time(:,i);
C = [t.^4,t.^3,t.^2,t,ones(201,1)];
d = X(:,i);
Aed = [0,0,0,0,1;T(i)^4,T(i)^3,T(i)^2,T(i),1];% Constraint Ends
bed = [0,X(end,i)];
Ax = lsqlin(C,d,[],[],Aed,bed,[],[]);
A(:,i) =Ax;
end
Atrain = A(2:4,:); % Extract the coefficients used in NN training
end