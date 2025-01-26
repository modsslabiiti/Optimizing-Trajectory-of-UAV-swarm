function [Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv)
%% This function generates uniformly randomly distributed Initial and
% Final States for Quadcopters
% Sample States for Quadcopters
% Input : N - Number of Samples
% U - Upper Bound of sampling Distance
% L - Lower Bound of Sampling Distance
% Output: Init - Initial State of Quadcopter
% Fin - Final State of Quadcopter
% The 16 States we specified are:
% x,y,z,V_x,V_y,V_z,a_x,a_y,a_z,
% psi, psi_dot, psi_ddot
% phi, phi_dot and theta, theta dot
Init = zeros(N,16);
Fin = zeros(N,16);
for i = 1:N
x_init = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
x_fin = [(Uh-Lh)*rand+Lh 0 0 (Uh-Lh)*rand+Lh 0 0 (Uv-Lv)*rand+Lv 0 0 0 0 0 0 0 0 0];
Init(i,:) = x_init;
Fin(i,:) = x_fin;
end
end