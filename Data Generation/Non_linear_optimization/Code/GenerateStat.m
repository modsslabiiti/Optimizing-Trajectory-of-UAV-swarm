function[x_init,finalStat] = GenerateStat()
%% This function randomly generated uniformly distributed samples
% in certain area
% v0 x = rand;
% v0 y = rand;
% yaw = atan2(v0 y,v0 x);
% x init = [0 v0 x 0 0 v0 y 0 -5 0 0 yaw 0 0 0 0 0 0];
%% Final state, note that location is uniformly distributed
% in the sample area
x=5+5*rand;
y=5+5*rand;
z = -10 - 5*rand;
% x = 20 + 20*rand;
% y = 20 + 20*rand;
% z = -25 - 20*rand;
% yaw = pi/2*rand;
finalStat = [x 0 0 y 0 0 z 0 0 0 0 0 0 0 0 0];
% finalStat = [x 0 0 y 0 0 z 0 0 yaw 0 0 0 0 0 0];
yaw_0 = pi/2*rand;
v0 = 5*rand;
v0_x = v0*cos(yaw_0);
v0_y = v0*sin(yaw_0);
% yaw 0 = atan2(y,x);
x_init = [0 v0_x 0 0 v0_y 0 -5 0 0 yaw_0 0 0 0 0 0 0];
%x_init = [0 v0 x 0 0 v0 y 0 -5 0 0 yaw_0 0 0 0 0 0 0];
end