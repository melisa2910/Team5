% Rover Simulation - 4 Wheel Steering + Driving
clear; 
clc; 
close all;

%% Initialisierung Roverparameter

% Simulationszeit
simTime = 10;

l = 2;  % [m]         Länge Rover Körper
b = 1;  % [m]         Breite Rover Körper
h = 0.5;  % [m]       Höhe Rover Körper
r = 0.2;  % [m]       Rad Radius
w = 0.2;  % [m]       Breite der Räder

z = 1;      % Höhe im Raum


% Initialisierung Anfangszustände
dthetas = ones(4,1);

phi = ones(4,1);

q0 = zeros(3,1);

% i_in = 1;

q = zeros(3,1);


%% Initialisierung der Umgebung und der Map

% Variablen zum setzen von x und y (werden auch für Rastermap verwendet)
xlim_end = 40;
ylim_end = 40;

% Rastermap für Pfadplannung vorbereiten

% Auflösung der Rastermap [m]
cellSize = 0.5;

% [Zeilen, Spalten] der Matrix
mapSize = [ylim_end, xlim_end] / cellSize;
map = zeros(mapSize);

% Sicherheitsabstand für Pfadplannung
safety = b / 2;

% Start- und Endpunkt [X,Y,Z]
% Evtl. Belegung von Start und Ziel auf einem Hindernis mit if-Abfrage
% absichern

start_pos = [1, 1, 0];

end_pos   = [30, 30, 0];



% Parameter und Funktionen für Hindernisse

% Zentrum Hindernisse [Obs1,Obs2,Obs3]
X_value_obs = [11, 4, 16];
Y_value_obs = [11, 6, 15];

% Radius Hindernisse [H1,H2,H3]
r_obs = [1.4, 1.5, 1.3];

% Eintragen der Hindernisse in Rastermap
map = fct_markCircularObstacle(map, X_value_obs(1), Y_value_obs(1), r_obs(1) + safety, cellSize);
map = fct_markCircularObstacle(map, X_value_obs(2), Y_value_obs(2), r_obs(2) + safety, cellSize);
map = fct_markCircularObstacle(map, X_value_obs(3), Y_value_obs(3), r_obs(3) + safety, cellSize);

% Pfadplannung mit BFS

% Start- und Zielposition in Zellkoordinaten umrechnen
start_cell = round(start_pos(1:2) / cellSize);
goal_cell  = round(end_pos(1:2) / cellSize);

% Speichern des gefundenen Pfad
result_path = bfs_pathfinding(map, start_cell, goal_cell);


