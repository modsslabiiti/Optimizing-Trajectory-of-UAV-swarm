function arg=InitArg(inputArg,N,InitGuess,angle,Thrust_L,Thrust_U,Vh,Vv,av)
%InitArg this function initialize the arg
%inputArg is an empty structure
%arg is a structure
arg=inputArg;
% fileData=load('x optRes.mat');
% arg.x0=150*ones(19*N+1,1);
arg.x0=InitGuess;
% load('x opt.mat');
% arg.x0=x opt;
arg.lbx=[-inf*ones(N,1);-inf*ones(N,1);-inf*ones(N,1); %x
-inf*ones(N,1);-inf*ones(N,1);-inf*ones(N,1); %y
-inf*ones(N,1);-5*ones(N,1);-1*ones(N,1); %z
-175*pi/180*ones(N,1);-45*pi/180*ones(N,1);-40*pi/180*ones(N,1); %psi
0*ones(N,1); %net velocity
-angle*pi/180*ones(N,1);-150*pi/180*ones(N,1);-200*pi/180*ones(N,1);
-angle*pi/180*ones(N,1);-150*pi/180*ones(N,1);-150*pi/180*ones(N,1);
0]; %time
arg.ubx=[ inf*ones(N,1);inf*ones(N,1);inf*ones(N,1); %upper bounds
inf*ones(N,1);inf*ones(N,1);inf*ones(N,1);
0*ones(N,1);5*ones(N,1);1*ones(N,1);
175*pi/180*ones(N,1);45*pi/180*ones(N,1);40*pi/180*ones(N,1);
20*ones(N,1); %dji mavic max velocity
angle*pi/180*ones(N,1);150*pi/180*ones(N,1);200*pi/180*ones(N,1);
angle*pi/180*ones(N,1);150*pi/180*ones(N,1);150*pi/180*ones(N,1);
20];
arg.lbg=[zeros(8*N-8,1);zeros(6*N,1);zeros(24,1);zeros(4,1);zeros(N,1);0.6*9.81*ones(N,1)];
arg.ubg=[zeros(8*N-8,1);zeros(6*N,1);zeros(24,1);zeros(4,1);zeros(N,1);2*9.81*ones(N,1)];
end