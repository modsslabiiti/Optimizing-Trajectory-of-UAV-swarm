function [x_opt,g_opt] = pathplanner(x_init,x0_traj,N,angle,Thrust_L,Thrust_U,Vh,Vv,av,finalStat)
%% This function
import casadi.*
b=SX.sym('b',19*N+1,1); %creates matrix with size
maxS=1;
initStat =x_init;
% obstStat =x obst;
if isempty(x0_traj)
% InitGuess = GetInitialGuess(N,initStat,finalStat);
InitGuess = [-10*ones(19*N,1);5];

else
InitGuess = x0_traj;
end
[f]=CostFun(b,N); %???
[x,y,z,psi,v,phi,theta]=GetDerivative(b,N);
g=ConstrFunIter(x,y,z,psi,v,phi,theta,b,N,finalStat,initStat); %
nlp = struct('x',b,'f',f,'g',g);
options.ipopt.max_iter = 700; %number of iterations
solver=nlpsol('solver','ipopt',nlp,options); %building solver
arg=struct; %creates empty structure
arg=InitArg(arg,N,InitGuess,angle);
tstart=tic();
res=solver('x0',arg.x0,'lbx',arg.lbx,'ubx',arg.ubx,'lbg',arg.lbg,'ubg',arg.ubg);
tstop=toc(tstart);
disp(tstop);
f_opt=full(res.f); %res.f
x_opt=full(res.x); %res.x
g_opt=full(res.g); %res.g
lam_x_opt=full(res.lam_x); %res.lam_x
lam_g_opt=full(res.lam_g); %res.lam_g
end
function [f]=CostFun(b,N)
%CostFun this is the cost function
%b is the state
%f is the value
import casadi.*
f=b(19*N+1); %flight time
end