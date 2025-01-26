

for i=1:500

    wpts = [X_input(i,:); Y_input(i,:); Z_input(i,:)];
    tpts = 0:100:200;
    %Specify the number of samples in the output trajectory.
    numsamples = 201;
    %Compute minimum jerk trajectories. The function outputs the trajectory positions (q), velocity (qd), acceleration (qdd), and jerks (qddd) at the given number of samples.
    [q,qd,qdd,qddd,pp,timepoints,tsamples] = minjerkpolytraj(wpts,tpts,numsamples);
    X(:,i)=q(1,:);
    Y(:,i)=q(2,:);
    Z(:,i)=q(3,:);
    tsample(:,i)=tsamples(1,:);
end

save('Data_generate_30_12_24.mat');

