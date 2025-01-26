function [Input] = DefineIn(InitStat, finalStat)
%% This function create the input vector to the blackbox model
% Vertical Position Z is set to start from 5 to avoid optimizer get stuck,
% convert Z to the true flight distance here
Ndash = size(finalStat,1);
Ndash
size(finalStat(:,7))
size(ones(Ndash,1))
z = -finalStat(:,7)-5*ones(Ndash,1);
Input = [finalStat(:,1),finalStat(:,4),z,InitStat(:,2),InitStat(:,5),InitStat(:,10)];
Input=Input.'
end