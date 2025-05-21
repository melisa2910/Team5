% Rover Simulation - 4 Wheel Steering + Driving
clear; 
clc; 
close all;

%% Initialisierung Roverparameter

% Simulationszeit
simTime = 10;


l = 2;  % [m]       Länge Rover Körper
b = 1;  % [m]       Breite Rover Körper
h = 0.5;  % [m]       Höhe Rover Körper
r = 0.2;  % [m]       Rad Radius
w = 0.2;  % [m]       Breite der Räder

z = 1;      % Höhe im Raum


% Initialisierung Anfangszustände
dtheta = ones(4,1);

phi = ones(4,1);

dq = zeros(3,1);

q0 = zeros(3,1);




%% Initialisierung der Umgebung

% Erstelle ein Koordinatensystem im 3D-Raum
figure;
hold on;
grid on;
axis equal;

% Setze die Größe 
xlim([0 10]);
ylim([0 10]);
zlim([0 5]);

fct_plotvehicle(1, 1, 1, 2, 1, 0.5, 0.2, 0.2);


% Hindernis 1
fct_plotobstacle(3, 3, 0, 0.4, 1.5);

% Hindernis 2
fct_plotobstacle(7, 1, 0, 0.5, 2);

% Hindernis 3
fct_plotobstacle(5, 6, 0, 0.3, 1);



% Start- und Endpunkt
start_pos = [1, 1, 0];
end_pos   = [8, 7, 0];
fct_plot_start_end(start_pos, end_pos);


