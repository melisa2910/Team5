%% Roboter Simulation
clear; 
clc; 
close all;

%%
% Erstelle ein Koordinatensystem im 3D-Raum
figure;
hold on;
grid on;
axis equal;

% Setze die Größe 
xlim([0 10]);
ylim([0 10]);
zlim([0 5]);



%%
%Plot für Mobilen Roboter

fct_plotvehicle(1, 1, 1, 2, 1, 0.5, 0.2, 0.2); % (x,y,z,l,b,h,r,w)

%Position(x,y,z)
%Maße Quader (l,b,h)
%Maße Räder (radius r,width w)

%% Plot der Hindernisse sowie Start- und Endpunkt

% Hindernis 1
fct_plotobstacle_3d(3, 3, 0, 0.4, 1.5);

% Hindernis 2
fct_plotobstacle_3d(7, 1, 0, 0.5, 2);

% Hindernis 3
fct_plotobstacle_3d(5, 6, 0, 0.3, 1);



% Start- und Endpunkt
start_pos = [1, 1, 0];
end_pos   = [8, 7, 0];
fct_plot_start_end(start_pos, end_pos);





