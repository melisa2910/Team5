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


%% Initialisierung der Umgebung und der Map

% Erstelle ein Koordinatensystem im 3D-Raum
figure;
hold on;
grid on;
axis equal;

% Variablen zum setzen der Größe (werden auch für Rastermap verwendet)
xlim_end = 20;
ylim_end = 20;

xlim([0 xlim_end]);
ylim([0 ylim_end]);
zlim([0 5]);

% Rastermap für Pfadplannung vorbereiten
% [Zeilen, Spalten] der Matrix (entspricht 1m pro Zelle)
mapSize = [ylim_end, xlim_end];
map = zeros(mapSize);               % 0 = frei

% Rover visualisieren
fct_plotvehicle(1, 1, 1, 2, 1, 0.5, 0.2, 0.2);

% Parameter und Funktionen für Hindernis 1

X_value_obs1 = 6;
Y_value_obs1 = 6;
r1 = 1.4;

fct_plotobstacle(X_value_obs1, Y_value_obs1, 0, r1, 1.5);
% Eintragen der Hindernisse in Rastermap
map = fct_markCircularObstacle(map, X_value_obs1, Y_value_obs1, r1);

% Hindernis 2

X_value_obs2 = 11;
Y_value_obs2 = 15;
r2 = 1.5;

fct_plotobstacle(X_value_obs2, Y_value_obs2, 0, r2, 2);
map = fct_markCircularObstacle(map, X_value_obs2, Y_value_obs2, r2);

% Hindernis 3

X_value_obs3 = 17;
Y_value_obs3 = 8;
r3 = 1.3;

fct_plotobstacle(X_value_obs3, Y_value_obs3, 0, r3, 1);
map = fct_markCircularObstacle(map, X_value_obs3, Y_value_obs3, r3);

% Start- und Endpunkt
% Evtl. Belegung von Start und Ziel auf einem Hindernis mit if-Abfrage
% absichern

start_pos = [1, 1, 0];
end_pos   = [15, 15, 0];
fct_plot_start_end(start_pos, end_pos);

