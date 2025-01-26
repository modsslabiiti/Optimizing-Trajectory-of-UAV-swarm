function[]=Zpredict(InitStat, finalStat,Y,Time)
%For X axis predection
Input=DefineIn(InitStat, finalStat);
[A,Atrain]=Polyfitting5(Y,Time);
x = Input;
t = A;
%% Choose a Training Function
trainFcn = 'trainlm'; % Levenberg-Marquardt backpropagation.
%% Create a Fitting Network
% The hidden layer size is adjusted to find the best number of nodes
hiddenLayerSize = 10;
% hiddenLayerSize = 5;
% hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize,trainFcn);
%% Choose Input and Output Pre/Post-Processing Functions
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};
%% Setup Division of Data for Training, Validation, Testing
net.divideFcn = 'dividerand'; % Divide data randomly
net.divideMode = 'sample'; % Divide up every sample
net.divideParam.trainRatio = 70/100; % Percentage of Training
net.divideParam.valRatio = 15/100; % Percentage of Validation
net.divideParam.testRatio = 15/100; % Percentage of Testing
%% Choose a Performance Function
net.performFcn = 'mse'; % Performance = Mean Squared Error
%% Choose Plot Functions
net.plotFcns = {'plotperform','plottrainstate','ploterrhist','plotregression', 'plotfit'};
%% Train the Network

[net,tr] = train(net,x,t);
%% Test the Network
y = net(x);
e = gsubtract(t,y); %substraction of two matrix in element wise menner
performance = perform(net,t,y) % Network Performance
%% Recalculate Training, Validation and Test Performance
trainTargets=t.* tr.trainMask{1};
valTargets=t.* tr.valMask{1};
testTargets = t .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,y) % Training Performance
valPerformance = perform(net,valTargets,y) % Validation Performance
testPerformance = perform(net,testTargets,y) % Test Performance
%% Plots
figure, plotperform(tr) % Plot training performance
figure, plotregression(t,y) % Plot Data Regression
%% Generate a matrix-only MATLAB function for neural network code
genFunction(net,'BlackBox_Z','MatrixOnly','yes');
Z_blackbox = BlackBox_Z(x);