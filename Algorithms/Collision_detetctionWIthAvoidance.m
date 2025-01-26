
load("Data.m")

X_new = X;
Y_new = Y;
Z_new = Z;

num_drones = 500; % Number of drones
num_waypoints = 201; % Number of waypoints
collision_threshold = 1; % Collision threshold

% Initialize a counter for the number of trajectory changes for each drone
trajectory_changes = zeros(1, num_drones);
batching_list=[];



n = 6; % Replace 5 with the desired number of values
correction = linspace(0, 1.5, n);
c2=linspace(1.5, 0, n);
c2(1)=[];
correction=horzcat(correction,c2);




% Collision detection and avoidance loop
while true
    % Store the current trajectory_changes for comparison
    prev_trajectory_changes = trajectory_changes;

    % Collision detection and avoidance loop
    for drone1 = 1:num_drones
        if ismember(drone1,batching_list)
            continue
        end
        for drone2 = drone1 + 1:num_drones
            % Skip if comparing the same drone
                if drone1 == drone2 || ismember(drone2,batching_list)
                    continue;
                end
                for waypoint = 1:num_waypoints
                    
                    % Calculate differences between X, Y, Z, and Euclidean distance for the two drones
                    diff_X = abs(X_new(waypoint, drone1) - X_new(waypoint, drone2));
                    diff_Y = abs(Y_new(waypoint, drone1) - Y_new(waypoint, drone2));
                    diff_Z = abs(Z_new(waypoint, drone1) - Z_new(waypoint, drone2));
                    diff_Euclidean = sqrt(diff_X^2 + diff_Y^2 + diff_Z^2);

                    % Check for collision
                    if diff_Euclidean < collision_threshold
                        X_new;Y_new; Z_new; batching_list=collision_avoidance(X_new,Y_new,Z_new, drone1, drone2,waypoint, correction,trajectory_changes, batching_list);
                        if ismember(drone2,batching_list) || ismember(drone1,batching_list)
                            break
                        end 
                    end

                end          
        end
    end

    % Check if there were no changes in the trajectory_changes array
    if all(trajectory_changes == prev_trajectory_changes)
        break;  % Break the loop if there are no changes
    end
end
