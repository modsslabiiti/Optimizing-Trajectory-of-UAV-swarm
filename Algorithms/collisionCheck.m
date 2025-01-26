% Load the data file
load("/MATLAB Drive/Dataset_new/Source_code-2/Data Generation/Simulink/Code/Data_generate_30_12_.mat")

X_new=X;
Y_new=Y;
Z_new=Z;

num_drones = 500; % Number of drones
num_waypoints = 201; % Number of waypoints
collision_threshold = 0.5; % Collision threshold

% Initialize a single list to store drones with potential collisions
collision_list = [];

% Collision detection loop
for drone1 = 1:num_drones
    
        % Initialize a flag to check if a collision occurred between drone1 and drone2
        collision_detected = false;     
        for drone2 = drone1 + 1:num_drones
            for waypoint = 1:num_waypoints
                % Calculate differences between X, Y, Z, and Euclidean distance for the two drones
                diff_X = abs(X_new(waypoint, drone1) - X_new(waypoint, drone2));
                diff_Y = abs(Y_new(waypoint, drone1) - Y_new(waypoint, drone2));
                diff_Z = abs(Z_new(waypoint, drone1) - Z_new(waypoint, drone2));
                diff_Euclidean = sqrt(diff_X^2 + diff_Y^2 + diff_Z^2);
    
                % Check for collision and add drone1 to the collision list if a collision is detected
                if diff_Euclidean < collision_threshold
                    collision_list = [collision_list, drone1];
                    collision_detected = true; % Set the flag to true
                    break; % Exit the waypoint loop since a collision is detected
                end
            end
        
            % If a collision is detected between drone2 and drone1, break and move on to the next drone
            if collision_detected
                break;
            end
        end
end

% Remove duplicate entries from the collision list
collision_list = unique(collision_list);

% Print the size of the collision list
fprintf('Size of the collision list: %d\n', numel(collision_list));

% Print the collision list
fprintf('Drones with potential collisions with their neighbors: %s\n', num2str(collision_list));

% Save the collision list to a file
save('collision_list.mat', 'collision_list');