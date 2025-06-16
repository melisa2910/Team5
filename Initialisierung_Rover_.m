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
cellSize = 1.0;

% [Zeilen, Spalten] der Matrix
mapSize = [ylim_end, xlim_end] / cellSize;
map = zeros(mapSize);

% Sicherheitsabstand für Pfadplannung
safety = b / 2;

% Start- und Endpunkt [X,Y,Z]

start_pos = [15, 11, 0];

end_pos   = [15, 30, 0];

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

% Überprüfung, ob Startpunkt und Endpunkt in einem Hindernis liegen

% Sicherheitsabstand berechnen
r_total = r_obs + safety;

% Abstände von Startpunkt zu allen Hindernissen
d_start = sqrt((start_pos(1) - X_value_obs).^2 + (start_pos(2) - Y_value_obs).^2);

% Abstände von Endpunkt zu allen Hindernissen
d_end = sqrt((end_pos(1) - X_value_obs).^2 + (end_pos(2) - Y_value_obs).^2);

% Prüfen ob innerhalb eines Hindernisses
start_in_obstacle = any(d_start <= r_total);
end_in_obstacle = any(d_end <= r_total);

if start_in_obstacle || end_in_obstacle
    errordlg(sprintf(['Start oder Ziel liegen in einem Hindernis!' ...
        '\nBitte Überprüfen und korrigieren.'], 'Hinderniswarnung'));
else
    result_path = bfs_pathfinding(map, start_pos, end_pos);
     helpdlg(sprintf(['Pfad erfolgreich erstellt.' ...
        '\n=> Weiter in Simulink.'], 'Successful'));
end


