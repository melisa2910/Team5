% Rover Simulation - 4 Wheel Steering + Driving
clear; 
clc; 
close all;

%% --- Roverparameter ---
roverLength = 0.5;  % [m]
roverWidth  = 0.4;  % [m]
roverHeight = 0.3;  % [m]
wheelRadius = 0.1;  % [m]

% Rad-Positionen (Rover-Mitte = Bezugspunkt)
wheelPos = [ roverLength/2,  roverWidth/2;   % vorne links
             roverLength/2, -roverWidth/2;   % vorne rechts
            -roverLength/2,  roverWidth/2;   % hinten links
            -roverLength/2, -roverWidth/2];  % hinten rechts

%% --- Test-Startparameter zur Steuerung des Rovers ---

% Simulationszeit
simTime = 10;

% Startposition im Welt-Ksys [x; y; theta(rad)]
q = [0; 0; 0];  

% Für jedes Rad: [w_fl; w_fr; w_rl; w_rr] in [rad/s]
dthetas = [1.0; 1.0; 1.0; 1.0];

% Lenkwinkel in rad
% vorne links, vorne rechts, h links..
phi = [0.0; 0.0; 0.0; 0.0];

