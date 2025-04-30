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

%% --- Parameter zur Steuerung des Rovers --

% Startposition
pose = [0; 0; 0];  % [x; y; theta(rad)]

% Für jedes Rad: [v_fl; v_fr; v_rl; v_rr] % lineare Geschwindigkeit [m/s]
wheelSpeeds = [1; 1; 1; 1];

% Lenkwinkel in rad
% vorne links, vorne rechts, h links..
wheelSteerAng = [pi/8; pi/8; 0; 0];

% bis hier hin können Parameter auf jeden fall bleiben
%% --- Matrix A gemäß Formel ---

% 3 x 4 Matrix aus nullen
A = zeros(3, 4);  % [vx; vy; omega]

% for-Schleife 1-4 (für jedes Rad)
for i = 1:4
    alpha = wheelSteerAng(i);

    % Zeilenvektor aus wheelPos (1 × n) = z.B. roverLength/2,  roverWidth/2
    % (v.links)
    r_i = wheelPos(i, :).';  % Radposition als Spaltenvektor

    % r_i

    % Beiträge zur Geschwindigkeit
    A(1, i) = cos(alpha) / 4; % erste Zeile füllen
    A(2, i) = sin(alpha) / 4;

    % Beitrag zur Rotation
    Wi = (-r_i(2)*cos(alpha) + r_i(1)*sin(alpha)) / ((4*r_i(1))^2 + (4*r_i(2)^2));
    % Wi = r_i(1)*sin(alpha) - r_i(2)*cos(alpha);
    A(3, i) = Wi;
end

%% --- Berechnung der Resultierenden Bewegung ---
% 3 x 1
v_rover = A * wheelSpeeds;

vx = v_rover(1);
vy = v_rover(2);
omega = v_rover(3);

%% --- Ausgabe ---
disp('Geschwindigkeiten des Rovers:');
fprintf('vx     = %.4f m/s\n', vx);
fprintf('vy     = %.4f m/s\n', vy);
fprintf('omega  = %.4f rad/s\n', omega);


%% Ausgeben der Pose in x,y,theta & der Geschwindigkeit
% 
% disp('Letzte Pose:');
% disp(pose);  % [x; y; theta]
