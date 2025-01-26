function[T_tr, X_tr, Y_tr, Z_tr, Psi_tr, Theta_tr, Phi_tr] =TrajPred_Amit(init_stat,fin_stat,X,Y,Z,Psi)
%% This function generate prediction time-optimal trajectory
grav = 9.81;
N = size(X,1);
M = size(X,2);
[Input_TrajPred] = DefineIn(init_stat,fin_stat);
T_tr = BlackBox_T(Input_TrajPred); %Predict optimal flight time
% Predict Trajectory Coefficients
Ax_tr = BlackBox_X(Input_TrajPred); %Get Neural Network Output
Ay_tr = BlackBox_Y(Input_TrajPred); %Get Neural Network Output
Az_tr = BlackBox_Z(Input_TrajPred); %Get Neural Network Output
Apsi_tr = BlackBox_Psi(Input_TrajPred); %Get Neural Network Output
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
[Apsi_refit] = PolyRefit(Az_tr,Psi,T_tr);%Fix initial and end point
[Psi_tr] = TrajRefit(Apsi_refit,T_tr); %Predict time-optimal trajectory
% Time vector
for i = 1:M
t(:,i) = linspace(0,T_tr(i),N)';
Cv = [zeros(N,1),ones(N,1),2*t(:,i),3*t(:,i).^2,4*t(:,i).^3,...
5*t(:,i).^4];
Ca = [zeros(N,1),zeros(N,1),2*ones(N,1),6*t(:,i),12*t(:,i).^2,...
20*t(:,i).^3];
Cpsi = [zeros(N,1),ones(N,1),2*t(:,i),3*t(:,i).^2,4*t(:,i).^3,5*t(:,i).^4];
Cdpsi = [zeros(N,1),zeros(N,1),2*ones(N,1),6*t(:,i),12*t(:,i).^2];
end
V_psitr = Cpsi*Apsi_refit; % Psi dot
V_xtr = Cv*Ax_refit; % X velocity
V_ytr = Cv*Ay_refit; % Y velocity
V_ztr = Cv*Az_refit; % Z velocity
a_xtr = Ca*Ax_refit; % X accelaration
a_ytr = Ca*Ay_refit; % Y accelaration
a_ztr = Cv*Az_refit; % Z accelaration
% Calculate theta and phi
for i = 1:M
Theta_tr(:,i)=(-atan(1./(grav*ones(N,1)-a_ztr(:,i)).*(a_xtr(:,i).*cos(Psi_tr(:,i))+a_ytr(:,i).*sin(Psi_tr(:,i)))));
Phi_tr(:,i)=(atan(-(a_xtr(:,i).*sin(Psi_tr(:,1))-a_ytr(:,i).*cos(Psi_tr(:,i)))./sqrt((grav*ones(N,1)-a_ztr(:,i)).^2.+...
(a_xtr(:,i).*cos(Psi_tr(:,i))+a_ytr(:,i).*sin(Psi_tr(:,i))).^2)));
end
end