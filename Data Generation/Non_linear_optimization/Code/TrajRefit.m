function [pp] = TrajRefit(A_refit,T)
N = 201; % Number of nodes
M = size(A_refit,2); % Number of samples
for i = 1:M
t(:,M) = linspace(0,T(M),N)';
C = [ones(N,1),t(:,M),t(:,M).^2,t(:,M).^3,t(:,M).^4,t(:,M).^5];
end
pp = C*A_refit;
end