% Parameters for the track
straight_length = 900; % Length of the straight sections
curve_radius = 200;    % Radius of the curved sections
straightaway_resolution = 100; % Number of points for the straight sections
curve_resolution = 100; % Number of points for the curves

% First straight section from (0,0) to (900,0)
bottom_straight_x = linspace(0, straight_length, straightaway_resolution);
bottom_straight_y = zeros(1, straightaway_resolution);

% Angles for the 180-degree turns
theta1 = linspace(-pi/2, pi/2, curve_resolution); % Curve at the right
theta2 = linspace(3*pi/2, pi/2, curve_resolution); % Curve at the left

% Calculate the coordinates for Turn 1 (right curve, 180-degree)
turn1_x = straight_length + curve_radius * cos(theta1);
turn1_y = curve_radius + curve_radius * sin(theta1);

% Calculate the coordinates for Turn 2 (left curve, 180-degree)
turn2_x = curve_radius * cos(theta2);
turn2_y = curve_radius * sin(theta2);

% Combine coordinates to form the track
track_x = [bottom_straight_x, turn1_x, fliplr(bottom_straight_x), fliplr(turn2_x)];
track_y = [bottom_straight_y, turn1_y, ones(1, straightaway_resolution) * 2 * curve_radius, fliplr(turn2_y)];

% Plot the track
figure;
plot(track_x, track_y, 'LineWidth', 2);
axis equal;
grid on;
title('Oval Track');
xlabel('Distance in meters');
ylabel('Distance in meters');

% Highlight the starting/ending point
hold on;
plot(0, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Start/Finish at (0,0)

% Ensure the plot stays open for viewing
hold off;

