% Number of UAVs
load("Data_after_collision_avoidance.mat")


% Initialize batches as a cell array
batches = {};

% Iterate through each UAV in the batching list
for i = 1:length(batching_list)
    uav1 = batching_list(i);

    % If batches are empty, create the first batch
    if isempty(batches)
        batches{1} = uav1;
        continue;
    end

    % Check existing batches
    assigned = false;
    for j = 1:length(batches)
        batch = batches{j};
        is_collision = false;

        % Check collision with all UAVs in the current batch
        for k = 1:length(batch)
            uav2 = batch(k);
            collision = false;

            % Check collision at all waypoints
            for waypoint = 1:201
                % Calculate differences between X, Y, Z, and Euclidean distance for the two UAVs
                diff_X = abs(X_new(waypoint, uav1) - X_new(waypoint, uav2));
                diff_Y = abs(Y_new(waypoint, uav1) - Y_new(waypoint, uav2));
                diff_Z = abs(Z_new(waypoint, uav1) - Z_new(waypoint, uav2));
                diff_Euclidean = sqrt(diff_X^2 + diff_Y^2 + diff_Z^2);

                % Check for collision
                if diff_Euclidean < collision_threshold
                    collision = true;
                    break;
                end
            end

            % If a collision is detected, break out of the batch loop
            if collision
                is_collision = true;
                break;
            end
        end

        % If no collision, add UAV to the current batch
        if ~is_collision
            batches{j}(end + 1) = uav1;
            assigned = true;
            break;
        end
    end

    % If not assigned to any batch, create a new batch
    if ~assigned
        batches{end + 1} = uav1;
    end
end

% Display results
for i = 1:length(batches)
    fprintf('Batch %d: UAV indices %s\n', i, mat2str(batches{i}));
end
