N = 1000; %Number of trajectories in test sample
Test = TrajGenerate(N); %Form input for Neural Network
64
%% Predict waypoint to waypoint trajectory
[T tr, X tr, Y tr, Z tr,Psi tr, Theta tr, Phi tr] =...
TrajPred(Test,X,Y,Psi);
%% Visualize the Fitting by one Example
i=110;
figure(1)
tt = linspace(0,T opt(i),201); % optimal flight time
t tr = linspace(0,T tr(i),201); % predicted flight time
plot(t tr,Y tr(:,i),'-b')
hold on
plot(tt,Y(:,i),'-r')
xlabel('Time(s)')
ylabel('Y Position(m)')
legend('Neural Network','Optimization')
figure FontSize=10;
set(get(gca,'XLabel'),'FontSize',figure FontSize,...
'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure FontSize,...
'Vertical','middle');
set(findobj('FontSize',10),'FontSize',...
figure FontSize);
set(findobj(get(gca,'Children'),'LineWidth',0.5)...
,'LineWidth',2);
grid on
%% Evaluate optimal time trainning error distribution
err = abs(T tr - T opt)./T opt;
figure(2)
px = linspace(0,100,100);
Yx = prctile(err,px);
plot(Yx,px)
set(gca,'yticklabel',{'0', '20%', '40%', '60%' , '80%', '100%'})
figure FontSize=10;
set(get(gca,'XLabel'),'FontSize',figure FontSize,...
'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure FontSize,...
'Vertical','middle');
set(findobj('FontSize',10),'FontSize',...
figure FontSize);
65
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
xlabel('e t')
ylabel('Percentile')
title('Percentile of tˆ* Prediction Error')
%% Evaluate MSE of the Flatness Output Prediction trajectory
% MSE of X Trajectory Prediction
for i = 1:N
MSEX(i) = immse(X tr(:,i),X(:,i));
end
% MSE of Y Trajectory Prediction
for i = 1:N
MSEY(i) = immse(Y tr(:,i),Y(:,i));
end
% MSE of Z Trajectory Prediction
for i = 1:N
MSEZ(i) = immse(Z tr(:,i),Z(:,i));
end
% MSE of Psi Trajectory Prediction
for i = 1:N
MSEPsi(i) = immse(Psi tr(:,i),Psi(:,i));
end
figure(3)
px = linspace(0,100,100);
Yx = prctile(MSEX,px);
plot(Yx,px)
title('Perecentile of X Prediction Errors')
xlabel('Prediction Error')
ylabel('Percetile')
figure(4)
py = linspace(0,100,100);
Yy = prctile(MSEY,py);
plot(Yy,py)
title('Perecentile of Y Prediction Errors')
xlabel('Prediction Error')
ylabel('Percetile')
66
figure(5)
pz = linspace(0,100,100);
Yz = prctile(MSEZ,pz);
plot(Yz,pz)
title('Perecentile of Z Prediction Errors')
xlabel('Prediction Error')
ylabel('Percetile')
figure(6)
ppsi = linspace(0,100,100);
Ypsi = prctile(MSEPsi,ppsi);
plot(Ypsi,ppsi)
title('Perecentile of \psi Prediction Errors')
xlabel('Prediction Error')
ylabel('Percetile')
% Plot Setting
set(gca,'yticklabel',{'0','10%', '20%','30%',...
'40%','50%' ,'60%','70%','80%','90%','100%'})
figure FontSize=8;
set(get(gca,'XLabel'),'FontSize',figure FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure FontSize,'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure FontSize);
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
%% Check Feasibility
% Theta
for i = 1:1000
Max theta(i) = max(180*theta tr(:,i)/pi);
Min theta(i) = min(180*theta tr(:,i)/pi);
end
figure(7)
plot([-15,-15],[0,350],'-r')
hold on
plot([15,15],[0,350],'-r')
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
h1=histogram(Max theta)
hold on
67
h2=histogram(Min theta)
xlabel('Minimum and Maximum \theta')
ylabel('Number of Samples')
% Phi
for i = 1:N
Max phi(i) = max(180*phi tr(:,i)/pi);
Min phi(i) = min(180*phi tr(:,i)/pi);
end
figure(8)
plot([-15,-15],[0,350],'-r')
hold on
plot([15,15],[0,350],'-r')
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
h1 = histogram(Max phi)
hold on
h2 = histogram(Min phi)
xlabel('Minimum and Maximum \phi()')
ylabel('Number of Samples')
%% Thrust (verified, never violated,usually above 5.886, below 19.62)
for i =1:N
T = sqrt(a xtr.ˆ2+a ytr.ˆ2+(grav-a ztr).ˆ2);
end
Thrust= max(T);
figure(9)
plot([19.6,19.6],[0,350],'-r')
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);
hold on
h=histogram(Thrust);
xlabel('Maximum Thrust(N)')
ylabel('Number of Samples')
legend(h,'Maximum Thrust(N)'