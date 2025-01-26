function[T_tr, X_tr, Y_tr, Z_tr, Psi_tr, Theta_tr, Phi_tr] =TrajPred(Test,X,Y,Psi)
%% This function generate prediction time-optimal trajectory
grav = 9.81;
N = size(X,1);
M = size(X,2);
[Input] = DefineIn(Test);
T_tr = BlackBox_t(Input); %Predict optimal flight time
% Predict Trajectory Coefficients
Ax_tr = BlackBox_X(Input); %Get Neural Network Output
Ay_tr = BlackBox_Y(Input); %Get Neural Network Output
Az_tr = BlackBox_Z(Input); %Get Neural Network Output
Apsi_tr = BlackBox_Psi(Input); %Get Neural Network Output
%% Predict waypoint to waypoint trajectory
% X
[Ax_refit] = PolyRefit(Ax_tr,X,T_tr);%Fix initial and end point
[X_tr] = TrajRefit(Ax_refit,T_tr); %Predict time-optimal trajectory
% Y
[Ay_refit] = PolyRefit(Ay_tr,Y,T_tr);%Fix initial and end point
[Y_tr] = TrajRefit(Ay_refit,T_tr); %Predict time-optimal trajectory
% Z
[Az_refit] = PolyRefit(Az_tr,Z,T_tr);%Fix initial and end point
[Z_tr] = TrajRefit(Az_refit,T_tr); %Predict time-optimal trajectory
% Psi
[Apsi_refit] = PsiRefit(Az_tr,Psi,T_tr);%Fix initial and end point
[Psi_tr] = TrajPsi(Apsi_refit, T_tr); %Predict time-optimal trajectory
% Time vector
for i = 1:M
t(:,i) = linspace(0,T_tr(i),N)';
Cv = [zeros(N,1),ones(N,1),2*t(:,i),3*t(:,i).^2,4*t(:,i).^3,...
5*t(:,i).^4];
Ca = [zeros(N,1),zeros(N,1),2*ones(N,1),6*t(:,i),12*t(:,i).^2,...
20*t(:,i).^3];
Cpsi = [zeros(N,1),ones(N,1),2*t(:,i),3*t(:,i).^2,4*t(:,i).^3];
Cdpsi = [zeros(N,1),zeros(N,1),2*ones(N,1),6*t(:,i),12*t(:,i).^2];
end
V_psitr = Cpsi*A_Psi_refit; % Psi dot
V_xtr = Cv*A_x_refit; % X velocity
V_ytr = Cv*A_y_refit; % Y velocity
V_ztr = Cv*A_z_refit; % Z velocity
a_xtr = Ca*A_x_refit; % X accelaration
a_ytr = Ca*A_y_refit; % Y accelaration
a_ztr = Cv*A_z_refit; % Z accelaration
% Calculate theta and phi
for i = 1:M
Theta_tr(:,i)=(-atan(1./(grav*ones(N,1)-a_ztr(:,i)).*(a_xtr(:,i).*cos(psi_tr(:,i))+a_ytr(:,i).*...
sin(psi_tr(:,i)))));
Phi_tr(:,i)=(atan(-(a_xtr(:,i).*sin(psi_tr(:,1))-...
a_ytr(:,i).*cos(psi_tr(:,i)))...
./sqrt((grav*ones(N,1)-a_ztr(:,i)).^2.+...
(a_xtr(:,i).*cos(psi_tr(:,i))+a_ytr(:,i).*sin(psi_tr(:,i))).^2)));
end
end