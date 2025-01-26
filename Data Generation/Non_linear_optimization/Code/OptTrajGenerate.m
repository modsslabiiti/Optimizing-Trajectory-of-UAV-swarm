function [X,Y,Z,V_x,V_y,V_z,A_x,A_y,A_z,Psi,Phi,Theta,Time] =OptTrajGenerate(Init,Fin,angle,Thrust_L,Thrust_U,Vh,Vv,av)
%% This Function Generate Time-optimal Trajectory
% Input: Init - Initial States of Quadcopter
% Fin - Final States of Quadcopter
% Angle - Maximum Roll/Pitch Angle
% Output: X - Time-optimal X Trajectories
% Y - Time-optimal Y Trajectories
% Z - Time-optimal Z Trajectories
% Psi - Time-optimal Psi Trajectories
M=size(Init,1);
Quad_state_init=Init;
Quad_state_fin=Fin;
S = 1;
E = 201;
N = 201;
Iter = 1;
X = zeros(N,M);
Y = zeros(N,M);
Z = zeros(N,M);
Psi = zeros(N,M);
Time = zeros(N,M);
Phi = zeros(N,M);
Theta = zeros(N,M);
for ii = 1:M
quad_state_init = Quad_state_init(ii,:);
quad_state_fin = Quad_state_fin(ii,:);
x0_traj = [];
time0 = 0;
S = 1;
E = 201;
N = 201;
Iter = 1;
for i = 1:Iter
[x_opt,g_opt] = pathplanner(quad_state_init,x0_traj,N,angle,Thrust_L,Thrust_U,Vh,Vv,av,quad_state_fin);
for j= 1:12
x_init(1,j)= x_opt(N*(j-1)+1+10);
end
x0_traj = [];
for k= 1:13
x0_traj =[ x0_traj; x_opt((k-1)*N+11:k*N)];
end
x0_traj = [x0_traj; x_opt(13*N+1)-10*x_opt(13*N+1)/(N-1)];
if i>1
x(1:(i-1)*10,i) =x(1:(i-1)*10,i-1);
y(1:(i-1)*10,i) =y(1:(i-1)*10,i-1);
end
x((i-1)*10+1:E,i) =x_opt(1:N);
v_x((i-1)*10+1:E,i) =x_opt(N+1:2*N);
a_x((i-1)*10+1:E,i) =x_opt(2*N+1:3*N);
y((i-1)*10+1:E,i) =x_opt(3*N+1:4*N);
v_y((i-1)*10+1:E,i) =x_opt(4*N+1:5*N);
a_y((i-1)*10+1:E,i) =x_opt(5*N+1:6*N);
z((i-1)*10+1:E,i) =x_opt(6*N+1:7*N);
v_z((i-1)*10+1:E,i) =x_opt(7*N+1:8*N);
a_z((i-1)*10+1:E,i) =x_opt(8*N+1:9*N);
psi((i-1)*10+1:E,i) =x_opt(9*N+1:10*N);
psi_dot((i-1)*10+1:E,i) =x_opt(10*N+1:11*N);
psi_ddot((i-1)*10+1:E,i) =x_opt(11*N+1:12*N);
v((i-1)*10+1:E,i) =x_opt(12*N+1:13*N);
Ts(:,i) =x_opt(19*N+1)/(N-1);
theta((i-1)*10+1:E,i) = x_opt(16*N+1:17*N);
phi((i-1)*10+1:E,i) = x_opt(13*N+1:14*N);
time((i-1)*10+1:E,i) = time0*ones(N,1)+(0:(x_opt(19*N+1)/(N-1)):x_opt(19*N+1))';
time0 = time(i*10+1,i);
N=N-10;
end
X(:,ii) = x;
Y(:,ii) = y;
Z(:,ii) = -z-201*ones(201,1);
V_x(:,ii)=v_x;
V_y(:,ii)=v_y;
V_z(:,ii) = v_z;
A_x(:,ii)=a_x;
A_y(:,ii)=a_y;
A_z(:,ii)=a_z;
Psi(:,ii) = psi;
Time(:,ii) = time;
Phi(:,ii) = phi;
Theta(:,ii) = theta;
end
end