function hVeh = fct_plotvehicle(x, y, z, psi, l, b, h, r, w)
    % x,y,z: untere linke Ecke des Quaders (unrotiert)
    % psi: Yaw-Winkel um Z-Achse (in Rad)
    % l: Länge, b: Breite, h: Höhe; r: Rad-Radius, w: Rad-Breite

    % 1) Rotationsmatrix um Z
    R = [cos(psi), -sin(psi);
         sin(psi),  cos(psi)];

    % 2) Lokaler Drehpunkt: Mittelpunkt der Bodenfläche
    center_local = [l/2; b/2];

    % 3) Eckpunkte des Quaders (Boden) relativ zum Drehpunkt
    local_corners = [ -l/2,  -b/2;
                       l/2,  -b/2;
                       l/2,   b/2;
                      -l/2,   b/2 ]';  % 2×4

    % 4) In Weltkoordinaten rotieren und verschieben
    world_corners = R * local_corners + [x; y] + center_local;

    % 5) Erzeuge Quader-Vertices (8 Punkte) und Faces
    verts = [ world_corners(:,1)' , z;
              world_corners(:,2)' , z;
              world_corners(:,3)' , z;
              world_corners(:,4)' , z;
              world_corners(:,1)' , z+h;
              world_corners(:,2)' , z+h;
              world_corners(:,3)' , z+h;
              world_corners(:,4)' , z+h ];
    faces = [1 2 3 4;  % Boden
             5 6 7 8;  % Dach
             1 2 6 5;  % Seitenflächen
             2 3 7 6;
             3 4 8 7;
             4 1 5 8];

    hBody = patch('Vertices', verts, 'Faces', faces, ...
                  'FaceColor', [0.6 0.6 0.6], 'EdgeColor', 'k', ...
                  'Tag', 'vehicle');
    hold on;

    % 6) Lokale Mittelpunkte der Räder (unrotiert)
    %    Reihenfolge: vorne links, vorne rechts, hinten rechts, hinten links
    % Eckpunkte relativ zur unteren linken Ecke des Quaders
    wheel_centers_local = [ 0, 0;  % vorne links
                             l, 0;  % vorne rechts
                             l, b;  % hinten rechts
                             0, b ]';


    % 7) Räder zeichnen (Position rotiert, Ausrichtung fest)
    hWheels = gobjects(4,1);
    for i = 1:4
        % Punkt rotieren und verschieben
        wc = R * (wheel_centers_local(:,i) - center_local) + [x; y] + center_local;
        % fct_plotwheel(x,y,z,radius,width,orientation)
        % Orientierung fest auf pi/2, damit Räder nicht um ihre Achse rotieren
        hWheels(i) = fct_plotwheel(wc(1), wc(2), z, r, w, pi/2);
    end

    % 8) Achsen & Ansicht
    xlabel('X [m]');
    ylabel('Y [m]');
    zlabel('Z [m]');
    title('3D-Fahrzeug mit Rotation');
    view(3); grid on; hold on;

    % 9) Alle Handles zurückgeben
    hVeh = [hBody; hWheels];
end
