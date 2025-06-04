
%FCT_PLOTVEHICLE_3D Zeichnet ein 3D-Fahrzeug mit Quader + 4 Rädern
function hVeh = fct_plotvehicle(x, y, z, l, b, h, r, w)

    % x,y,z: untere linke Ecke des Körpers
    % l: Länge, b: Breite, h: Höhe
    % r: Radius der Räder, w: Breite der Räder

    % 1) Körper zeichnen und Handle einsammeln
    hBody = fct_plotbody(x, y, z, l, b, h);
    % (fct_plotbody gibt nun genau einen Handle zurück und hat 'Tag','vehicle' gesetzt)

    % 2) Räder zeichnen und Handles einsammeln
    hWheelFL = fct_plotwheel(x,     y,      z, r, w, pi/2); % vorne links
    hWheelFR = fct_plotwheel(x+l,   y,      z, r, w, pi/2); % vorne rechts
    hWheelRR = fct_plotwheel(x+l,   y+b,    z, r, w, pi/2); % hinten rechts
    hWheelRL = fct_plotwheel(x,     y+b,    z, r, w, pi/2); % hinten links

    % 3) Alle Handles in ein Array packen
    hVeh = [hBody, hWheelFL, hWheelFR, hWheelRR, hWheelRL];


    xlabel('X [m]'); 
    ylabel('Y [m]'); 
    zlabel('Z [m]');
    title('3D-Fahrzeug mit Quader und Rädern');
    view(3); 
    grid on;
    hold on;
end

