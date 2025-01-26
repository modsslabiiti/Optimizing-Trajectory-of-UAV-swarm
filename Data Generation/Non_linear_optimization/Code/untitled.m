
%% Section 1
addpath(genpath('C:\Users\Pranjay Sidhwani\Documents\MATLAB\casadi-windows-matlabR2016a-v3.5.5'));
addpath(genpath('C:\Users\Pranjay Sidhwani\Desktop\UAV Path Planner'));
import casadi.*
%% Generate Sample Set for Quadcopter States
%N = 20;
%Uh = 30; Lh =20;
%Uv = 20; Lv = 10;
%[Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);

%% Specify Fixed Constraints for Quadcopter
%angle = 10; % Maximum Roll/Pitch Angle
%Thrust_L = 0.2*9.81; % Minimum Thrust
%Thrust_U=2*9.81; % Maximum Thrust
%Vv = 5; av = 1; % Maximum Verticle Velocity and Accelaration
%Vh = 5; % Maximum Horizontal Velocity
%% Generate Optimization-Based Time Optimal Trajectory
%[X,Y,Z,V_x,V_y,V_z,A_x,A_y,A_z,Psi,Phi,Theta,Time] =OptTrajGenerate(Init,Fin,angle,Thrust_L,Thrust_U,Vh,Vv,av);
%save('Sample Traj test 2030 1020 10degree')
%% Section 2
%clear all; close all;
N = 500;
Uh = 20; Lh = 10;
Uv = 5; Lv = 0;
[Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
% Specify Fixed Constraints for Quadcopter
angle = 10; % Maximum Roll/Pitch Angle
Thrust_L = 0.2*9.81; % Minimum Thrust
Thrust_U=2*9.81; % Maximum Thrust
Vv = 5; av = 1; % Maximum Verticle Velocity and Accelaration
Vh = 5; % Maximum Horizontal Velocity
% Generate Optimization-Based Time Optimal Trajectory
[X,Y,Z,V_x,V_y,V_z,A_x,A_y,A_z,Psi,Phi,Theta,Time] = OptTrajGenerate(Init,Fin,angle,Thrust_L,Thrust_U,Vh,Vv,av);
save('Sample Traj 500 1020 05 10degree')
 %% Section 3
 clear all; close all;
 N = 500;
 Uh = 30; Lh = 20;
 Uv = 5; Lv = 0;
 [Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
 % Specify Fixed Constraints for Quadcopter
 angle = 10; % Maximum Roll/Pitch Angle
 Thrust L = 0.2*9.81; % Minimum Thrust
 Thrust U=2*9.81; % Maximum Thrust
 Vv = 5; av = 1; % Maximum Verticle Velocity and Accelaration
 Vh = 5; % Maximum Horizontal Velocity
% % Generate Optimization-Based Time Optimal Trajectory
 [X,Y,Z,V x,V y,V z,A x,A y,A z,Psi,Phi,Theta,Time] = OptTrajGenerate(Init,Fin,angle,Thrust_L,Thrust_U,Vh,Vv,av);
save('Sample Traj 500 2030 05 10degree')
% %% section 4
% clear all; close all;
% N = 500;
% Uh = 10; Lh = 5;
% Uv = 10; Lv = 5;
% [Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
% % Specify Fixed Constraints for Quadcopter
% angle = 10; % Maximum Roll/Pitch Angle
% Thrust_L = 0.2*9.81; % Minimum Thrust
% Thrust_U=2*9.81; % Maximum Thrust
% Vv = 5; av = 1; % Maximum Verticle Velocity and Accelaration
% Vh = 5; % Maximum Horizontal Velocity
% % Generate Optimization-Based Time Optimal Trajectory
% [X,Y,Z,V x,V y,V z,A x,A y,A z,Psi,Phi,Theta,Time] = ....
% OptTrajGenerate(Init,Fin,angle,Thrust_L,Thrust_U,Vh,Vv,av);
% save('Sample Traj 500 510 510 10degree')
% %% Section 5
% clear all; close all;
% N = 500;
% Uh = 20; Lh = 10;
% Uv = 10; Lv = 5;
% [Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
% % Specify Fixed Constraints for Quadcopter
% angle = 10; % Maximum Roll/Pitch Angle
% Thrust L = 0.2*9.81; % Minimum Thrust
% Thrust U=2*9.81; % Maximum Thrust
% Vv = 5; av = 1; % Maximum Verticle Velocity and Accelaration
% Vh = 5; % Maximum Horizontal Velocity
% % Generate Optimization-Based Time Optimal Trajectory
% [X,Y,Z,V x,V y,V z,A x,A y,A z,Psi,Phi,Theta,Time] = ....
% OptTrajGenerate(Init,Fin,angle,Thrust L,Thrust U,Vh,Vv,av);
% save('Sample Traj 500 1020 510 10degree')
% %% section 6
% clear all; close all;
% N = 500;
% Uh = 30; Lh = 20;
% Uv = 10; Lv = 5;
% [Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
% % Specify Fixed Constraints for Quadcopter
% angle = 10; % Maximum Roll/Pitch Angle
% Thrust L = 0.2*9.81; % Minimum Thrust
% Thrust U=2*9.81; % Maximum Thrust
% Vv = 5; av = 1; % Maximum Verticle Velocity and Accelaration
% Vh = 5; % Maximum Horizontal Velocity
% % Generate Optimization-Based Time Optimal Trajectory
% [X,Y,Z,V x,V y,V z,A x,A y,A z,Psi,Phi,Theta,Time] = ....
% OptTrajGenerate(Init,Fin,angle,Thrust L,Thrust U,Vh,Vv,av);
% save('Sample Traj 500 2030 510 10degree')
% %% section 7
% clear all; close all;
% N = 500;
% Uh = 50; Lh = 30;
% Uv = 10; Lv = 5;
% [Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
% % Specify Fixed Constraints for Quadcopter
% angle = 10; % Maximum Roll/Pitch Angle
% Thrust L = 0.2*9.81; % Minimum Thrust
% Thrust U=2*9.81; % Maximum Thrust
% Vv = 5; av = 1; % Maximum Verticle Velocity and Accelaration
% Vh = 5; % Maximum Horizontal Velocity
% % Generate Optimization-Based Time Optimal Trajectory
% [X,Y,Z,V x,V y,V z,A x,A y,A z,Psi,Phi,Theta,Time] = ....
% OptTrajGenerate(Init,Fin,angle,Thrust L,Thrust U,Vh,Vv,av);
% save('Sample Traj 500 3050 510 10degree')
%% Section 8
% Generate Sample Set for Quadcopter States
close all; clear all;
N = 500;
Uh = 20; Lh = 10;
Uv = 10; Lv = 5;
[Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
% Specify various constraint for quadcopter
[angle,TL,Tu,Vh,~,~] = ConstrGenerate(N);
Vv = 5*ones(N,1);
av = 1*ones(N,1);
[X,Y,Z,V_x,V_y,V_z,A_x,A_y,A_z,Psi,Phi,Theta,Time] = OptTrajGenerate_Var_Constr(Init,Fin,angle,TL,Tu,Vh,Vv,av);
save('Sample Traj 500 1020 510 var')
%% Section 9
% Generate Sample Set for Quadcopter States
close all; clear all;
N = 500;
Uh = 20; Lh = 10;
Uv = 10; Lv = 5;
[Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
% Specify various constraint for quadcopter
[angle,TL,Tu,Vh,~,~] = ConstrGenerate(N);
Vv = 5*ones(N,1);
av = 1*ones(N,1);
[X,Y,Z,V_x,V_y,V_z,A_x,A_y,A_z,Psi,Phi,Theta,Time] = OptTrajGenerate_Var_Constr(Init,Fin,angle,TL,Tu,Vh,Vv,av);
save('Sample Traj 500 1020 510 var')
%% Section 10
% Generate Sample Set for Quadcopter States
% close all; clear all;
% N = 500;
% Uh = 30; Lh = 20;
% Uv = 10; Lv = 5;
% [Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
% % Specify various constraint for quadcopter
% [angle,TL,Tu,Vh,~,~] = ConstrGenerate(N);
% Vv = 5*ones(N,1);
% av = 1*ones(N,1);
% [X,Y,Z,V x,V y,V z,A x,A y,A z,Psi,Phi,Theta,Time] = ....
% OptTrajGenerate Var Constr(Init,Fin,angle,TL,Tu,Vh,Vv,av);
% save('Sample Traj 500 2030 510 var')
% %% Section 11
% % Generate Sample Set for Quadcopter States
% close all; clear all;
% N = 500;
% Uh = 50; Lh = 30;
% Uv = 10; Lv = 5;
% [Init, Fin] = GenerateState(N,Uh,Lh,Uv,Lv);
% % Specify various constraint for quadcopter
% [angle,TL,Tu,Vh,~,~] = ConstrGenerate(N);
% Vv = 5*ones(N,1);
% av = 1*ones(N,1);
% [X,Y,Z,V x,V y,V z,A x,A y,A z,Psi,Phi,Theta,Time] = ....
% OptTrajGenerate Var Constr(Init,Fin,angle,TL,Tu,Vh,Vv,av);
% save('Sample Traj 500 3050 510 var')



%Y
%Z
%Time




