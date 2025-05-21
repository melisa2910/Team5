function fct_plotvehicle(x, y, z, l, b, h, r, w)
%FCT_PLOTVEHICLE_3D Zeichnet ein 3D-Fahrzeug mit Quader + 4 Rädern
% x,y,z: untere linke Ecke des Körpers
% l: Länge, b: Breite, h: Höhe
% r: Radius der Räder, w: Breite der Räder

% Fahrzeugkörper
fct_plotbody(x, y, z, l, b, h);


% Räder unten links/rechts (vorne/hinten), Rotation: 90 Grad = pi/2
fct_plotwheel(x,     y,      z, r, w, pi/2); % vorne links
fct_plotwheel(x+l,   y,      z, r, w, pi/2); % vorne rechts
fct_plotwheel(x+l,   y+b,    z, r, w, pi/2); % hinten rechts
fct_plotwheel(x,     y+b,    z, r, w, pi/2); % hinten links




xlabel('X [m]'); ylabel('Y [m]'); zlabel('Z [m]');
title('3D-Fahrzeug mit Quader und Rädern');
view(3); 
grid on;
end

