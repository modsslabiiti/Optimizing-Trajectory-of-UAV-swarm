function g=ConstrFunIter(x,y,z,psi,v,phi,theta,b,N,finalStat,initStat)
%ConstrFun this is the function that generate the constraint
%b is the state
%g is the constraint
import casadi.*
grav=9.81;
g=SX(16*N+20,1); %number of the constraint equations
Ts=b(19*N+1)/(N-1); %time step
g(1:N-1)=x(2:N,1)-x(1:N-1,1)-Ts*(x(1:N-1,2))-Ts^2*(x(1:N-1,3))/2;
g(N:2*N-2)=x(2:N,2)-x(1:N-1,2)-Ts*(x(1:N-1,3));
g(2*N-1:3*N-3)=y(2:N,1)-y(1:N-1,1)-Ts*(y(1:N-1,2))-Ts^2*(y(1:N-1,3))/2;
g(3*N-2:4*N-4)=y(2:N,2)-y(1:N-1,2)-Ts*(y(1:N-1,3));
g(4*N-3:5*N-5)=z(2:N,1)-z(1:N-1,1)-Ts*(z(1:N-1,2))-Ts^2*(z(1:N-1,3))/2;
g(5*N-4:6*N-6)=z(2:N,2)-z(1:N-1,2)-Ts*(z(1:N-1,3));
g(6*N-5:7*N-7)=psi(2:N,1)-psi(1:N-1,1)-Ts*(psi(1:N-1,2))-Ts^2*(psi(1:N-1,3))/2;
g(7*N-6:8*N-8)=psi(2:N,2)-psi(1:N-1,2)-Ts*(psi(1:N-1,3));
% differential flatness contraint
g(8*N-7:9*N-8)=theta(1:N,1)-(-atan(1./(grav*ones(N,1)-z(1:N,3)).*(x(1:N,3).*cos(psi(1:N,1))+y(1:N,3).*sin(psi(1:N,1)))));
g(9*N-7:10*N-8)=phi(1:N,1)-(atan(-(x(1:N,3).*sin(psi(1:N,1))-y(1:N,3).*cos(psi(1:N,1)))./sqrt((grav*ones(N,1)-z(1:N,3)).^2.+(x(1:N,3).*cos(psi(1:N,1))+y(1:N,3).*sin(psi(1:N,1))).^2)));
g(10*N-7:11*N-8) = theta(1:N,2)-([initStat(16)*Ts;theta(2:N,1)]-[0;theta(1:N-1,1)])/(Ts);
g(11*N-7:12*N-8) = theta(1:N,3)-([0;theta(2:N,2)]-[0;theta(1:N-1,2)])/(Ts);
g(12*N-7:13*N-8) = phi(1:N,2)-([initStat(14)*Ts;phi(2:N,1)]-[0;phi(1:N-1,1)])/(Ts);
g(13*N-7:14*N-8) = phi(1:N,3)-([0;phi(2:N,2)]-[0;phi(1:N-1,2)])/(Ts);
g(14*N-7)=x(N,1)-finalStat(1);
g(14*N-6)=x(1,1)-initStat(1);
g(14*N-5)=x(N,2)-finalStat(2);
g(14*N-4)=x(1,2)-initStat(2);
g(14*N-3)=x(N,3)-finalStat(3);
g(14*N-2)=x(1,3)-initStat(3);
g(14*N-1)=y(N,1)-finalStat(4);
g(14*N) =y(1,1)-initStat(4);
g(14*N+1)=y(N,2)-finalStat(5);
g(14*N+2)=y(1,2)-initStat(5);
g(14*N+3)=y(N,3)-finalStat(6);
g(14*N+4)=y(1,3)-initStat(6);
g(14*N+5)=z(N,1)-finalStat(7);
g(14*N+6)=z(1,1)-initStat(7);
g(14*N+7)=z(N,2)-finalStat(8);
g(14*N+8)=z(1,2)-initStat(8);
g(14*N+9)=z(N,3)-finalStat(9);
g(14*N+10)=z(1,3)-initStat(9);
g(14*N+11)=psi(N,1)-finalStat(10);
g(14*N+12)=psi(1,1)-initStat(10);
g(14*N+13)=psi(N,2)-finalStat(11);
g(14*N+14)=psi(1,2)-initStat(11);
g(14*N+15)=psi(N,3)-finalStat(12);
g(14*N+16)=psi(1,3)-initStat(12);
g(14*N+17)=phi(1,2)-initStat(14);
g(14*N+18)=phi(N,2)-finalStat(14);
g(14*N+19)=theta(1,2)-initStat(16);
g(14*N+20)=theta(N,2)-finalStat(16);
g(14*N+21:15*N+20)=(x(1:N,2).^2+y(1:N,2).^2)-(v(1:N,1)).^2; % max v
% differential flatness contraint on max thrust
g(15*N+21:16*N+20)= sqrt(x(1:N,3).^2+y(1:N,3).^2+(ones(N,1)*grav-z(1:N,3)).^2);
end