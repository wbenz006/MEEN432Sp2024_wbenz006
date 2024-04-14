
% Initialize the model parameters
P4init;

% Set the simulation time
simTime = 300; % Example: 300 seconds

% Run the simulation
simOut = sim('Proj4WBenzModel.slx', ...
             'StartTime', '0', ...
             'StopTime', num2str(simTime));
whos 

% Plotting the XY graph
figure;
plot(X, Y); % Assuming X and Y are being directly logged to workspace
xlabel('X Position (m)');
ylabel('Y Position (m)');
title('XY Graph of Vehicle Trajectory');
grid on;

