function [A_refit] = PolyRefit(A_train,X,T_tr)
% This function will change the coefficient of the first order term
n = size(X,2); % number of training samples
a6 = zeros(1,n);
for i = 1:n
aa = A_train(:,i);
tt = T_tr(i);
a6(i) = (X(end,i) - aa(1)- aa(3)*tt^2 - aa(4)*tt^3 -...
aa(2)*tt-aa(5)*tt^4)/tt^5;
end
A_refit = A_train;
A_refit(6,:) = a6;
% A refit(2,:) = a2;
end