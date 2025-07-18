%Braucht 4 Argumente Koordinaten(x,y) und Länge, Breite

function hBody = fct_plotbody(x, y, z, l, b, h)
%FCT_PLOTBODY_3D Zeichnet den Körper (Quader) in 3D
% (x, y, z): Startpunkt (untere linke Ecke unten)
% l: Länge, b: Breite, h: Höhe

% 8 Eckpunkte des Quaders
X = [0 l l 0 0  l l 0] + x;
Y = [0 0 b b 0  0 b b] + y;
Z = [0 0 0 0 h  h h h] + z;

% Flächen (jede Zeile = 1 Fläche mit 4 Eckpunkten)
faces = [
    1 2 3 4;  % Boden
    5 6 7 8;  % Decke
    1 2 6 5;  % Seite vorne
    2 3 7 6;  % Seite rechts
    3 4 8 7;  % Seite hinten
    4 1 5 8   % Seite links
];

    % Patch erzeugen und Handle speichern
    hBody = patch('Vertices', [X' Y' Z'], 'Faces', faces, ...
                  'FaceColor', [0.6 0.8 1], 'EdgeColor', 'k', 'FaceAlpha', 0.7);
    % Tag setzen, damit dieser Body später gezielt gelöscht werden kann
    set(hBody, 'Tag', 'vehicle');

    hold on;
end
