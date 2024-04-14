% Parameters for the track
straight_length = 900; % Length of the straight sections
curve_radius = 200;    % Radius of the curved sections
straightaway_resolution = 100; % Number of points for the straight sections
curve_resolution = 100; % Number of points for the curves
track_width = 15;

outer_curve_radius = curve_radius + track_width / 2;
inner_curve_radius = curve_radius - track_width / 2;


% First straight section from (0,0) to (900,0)
bottom_straight_x = linspace(0, straight_length, straightaway_resolution);
bottom_straight_y = zeros(1, straightaway_resolution);

bottom_straight_outer_y = bottom_straight_y - track_width / 2;
top_straight_outer_y = ones(1, straightaway_resolution) * (2 * curve_radius + track_width / 2);

bottom_straight_inner_y = bottom_straight_y + track_width / 2;
top_straight_inner_y = ones(1, straightaway_resolution) * (2 * curve_radius - track_width / 2);


% Angles for the 180-degree turns
theta1 = linspace(-pi/2, pi/2, curve_resolution); % Curve at the right
theta2 = linspace(3*pi/2, pi/2, curve_resolution); % Curve at the left


% Calculate the coordinates for Turn 1 (right curve, 180-degree)
turn1_x = straight_length + curve_radius * cos(theta1);
turn1_y = curve_radius + curve_radius * sin(theta1);

turn1_outer_x = straight_length + outer_curve_radius * cos(theta1);
turn1_outer_y = outer_curve_radius * sin(theta1) + curve_radius;

turn1_inner_x = straight_length + inner_curve_radius * cos(theta1);
turn1_inner_y = inner_curve_radius * sin(theta1) + inner_curve_radius + track_width / 2;


% Calculate the coordinates for Turn 2 (left curve, 180-degree)
turn2_x = curve_radius * cos(theta2);
turn2_y = curve_radius * sin(theta2);

turn2_inner_x = inner_curve_radius * cos(theta2);
turn2_inner_y = inner_curve_radius * sin(theta2) + inner_curve_radius + track_width / 2;  % Adjust for the vertical offset

turn2_outer_x = outer_curve_radius * cos(theta2);
turn2_outer_y = outer_curve_radius * sin(theta2) + curve_radius;  % Adjust for the vertical offset


% Combine coordinates to form the track
track_x = [bottom_straight_x, turn1_x, fliplr(bottom_straight_x), fliplr(turn2_x)];
track_y = [bottom_straight_y, turn1_y, ones(1, straightaway_resolution) * 2 * curve_radius, fliplr(turn2_y) + curve_radius];

track_inner_x = [bottom_straight_x, turn1_inner_x, fliplr(bottom_straight_x), fliplr(turn2_inner_x)];
track_inner_y = [bottom_straight_inner_y, turn1_inner_y, top_straight_inner_y, fliplr(turn2_inner_y)];

track_outer_x = [bottom_straight_x, turn1_outer_x, fliplr(bottom_straight_x), fliplr(turn2_outer_x)];
track_outer_y = [bottom_straight_outer_y, turn1_outer_y, top_straight_outer_y, fliplr(turn2_outer_y)];


% Plot the track
figure;
% Plot the inner track with dashed green line
plot(track_inner_x, track_inner_y, 'g--', 'LineWidth', 1);
hold on; % Keep the plot for further additions
% Plot the outer track with dashed green line
plot(track_outer_x, track_outer_y, 'g--', 'LineWidth', 1);

axis equal;
grid on;
title('Oval Track');
xlabel('Distance in meters');
ylabel('Distance in meters');

% Highlight the starting/ending point
plot(0, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Start/Finish at (0,0)

hold off;
