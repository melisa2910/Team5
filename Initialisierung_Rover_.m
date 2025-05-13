% Rover Simulation - 4 Wheel Steering + Driving
clear; 
clc; 
close all;

%% Roverparameter
roverLength = 0.5;  % [m]
roverWidth  = 0.4;  % [m]
roverHeight = 0.3;  % [m]
wheelRadius = 0.1;  % [m]

% Simulationszeit
simTime = 10;

% Rad-Positionen (Rover-Mitte = Bezugspunkt)
wheelPos = [ roverLength/2, -roverWidth/2;   % vorne rechts
             roverLength/2,  roverWidth/2;   % vorne links
            -roverLength/2,  roverWidth/2;   % hinten links
            -roverLength/2, -roverWidth/2];  % hinten rechts