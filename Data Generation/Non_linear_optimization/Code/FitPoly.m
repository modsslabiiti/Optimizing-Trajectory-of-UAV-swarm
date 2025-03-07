function [Ax] = FitPoly(T,X)
%% This function fits the X,Y,Z trajectry with 5th order polynomials
% T - The optimal time of flights [T1,T2......TN];
% X - The optimal trajectory of x
N = size(X,1); % Number of nodes
M = size(X,2); % Number of samples
Ax = zeros(6,M);
% fitting the samples
for i = 1:M
t(:,M) = linspace(0,T(M),N);
C = [ones(N,1),t(:,M),t(:,M).^2,t(:,M).^3,t(:,M).^4,t(:,M).^5];
d = X(:,i);
% restrict the end point of the trajectory
Aed = [1,0,0,0,0,0;1,T(i),T(i)^2,T(i)^3,T(i)^4,T(i)^5];
bed = [0;X(end,i)];
Aed
bed
AX = lsqlin(C,d,[],[],Aed,bed,[],[]);
Ax(:,i) =AX;
end