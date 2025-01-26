% Set the size of the matrix
rows = 500;
cols = 3;

% Generate random data for the second and third rows
random_data_row1 = 10 + (50-10) * rand(rows, 1);
random_data_row3 = 200 + (300-200) * rand(rows, 1);
random_data_row2 = (random_data_row1+ random_data_row3)/2;

% Create the matrix X_input
X_input(:,1) = random_data_row1;
X_input(:, 2) = random_data_row2;
X_input(:,3) = random_data_row3;


random_data_row1 = 10 + (50-10) * rand(rows, 1);
random_data_row3 = 200 + (300-200) * rand(rows, 1);
random_data_row2 = (random_data_row1+ random_data_row3)/2;

% Create the matrix Y_input
Y_input = random_data_row1
Y_input(:, 2) = random_data_row2;
Y_input(:,3) = random_data_row3;

random_data_row1 = 10 + (20-10) * rand(rows, 1);
random_data_row2 = 20 + (40-20) * rand(rows, 1);
random_data_row3 = 40 + (50-40) * rand(rows, 1);

% Create the matrix X_input
Z_input = zeros(rows, cols);
Z_input(:, 2) = 30 + (40-30) * rand(rows, 1);

%save input
save('input_data_genaration.mat');



