function [x,y,z,psi,v,phi,theta]=GetDerivative(b,N)
%GetDerivative this function get the derivative of the input
%y1 is the first trajectory for y
%y2 is the second trajectory for y
%z1 is the first trajectory for z
%z2 is the second trajectory for z
%b is the vector of input
%y is the time derivative of y
%z is the time derivative of z
% addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
import casadi.*
x=SX(N,3); %creates variable in casadi format
y=SX(N,3); %creates variable in casadi format
z=SX(N,3); %creates variable in casadi format
psi=SX(N,3); %creates variable in casadi format
v = SX(N,1); %creates variable in casadi format
phi=SX(N,3);
theta=SX(N,3);
x(1:N,1)=b(1:N); %x position
x(1:N,2)=b(N+1:2*N); %x speed
x(1:N,3)=b(2*N+1:3*N); %x accel
y(1:N,1)=b(3*N+1:4*N); %y position
y(1:N,2)=b(4*N+1:5*N); %y speed
y(1:N,3)=b(5*N+1:6*N); %y accel
z(1:N,1)=b(6*N+1:7*N); %z position
z(1:N,2)=b(7*N+1:8*N); %z speed
z(1:N,3)=b(8*N+1:9*N); %z accel
psi(1:N,1)=b(9*N+1:10*N); %yaw angle
psi(1:N,2)=b(10*N+1:11*N); %yaw velocity
psi(1:N,3)=b(11*N+1:12*N); %yaw accel
v(1:N,1) = b(12*N+1:13*N);
phi(1:N,1)=b(13*N+1:14*N);
phi(1:N,2)=b(14*N+1:15*N);
phi(1:N,3)=b(15*N+1:16*N);
theta(1:N,1)=b(16*N+1:17*N);
theta(1:N,2)=b(17*N+1:18*N);
theta(1:N,3)=b(18*N+1:19*N);
end