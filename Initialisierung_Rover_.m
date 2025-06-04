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
dthetas = ones(4,1);

phi = ones(4,1);

dq = zeros(3,1);

q0 = zeros(3,1);



% %% Initialisierung der Umgebung und der Map
