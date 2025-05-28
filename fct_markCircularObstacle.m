function map = fct_markCircularObstacle(map, x_center, y_center, radius)
% Funktion zur Eintragung von Hindernissen in die Rastermap
% Rastermap wird für Pfadplannung benötigt

    [rows, cols] = size(map);

    % Schleife über alle Zellen
    for x = 1:cols
        for y = 1:rows
            % Mittelpunkt der Zelle (1x1 Zellen)
            cell_x = x - 0.5;
            cell_y = y - 0.5;

            % Abstand Zellenmittelpunkt - Hindernismittelpunkt
            dist = sqrt((cell_x - x_center)^2 + (cell_y - y_center)^2);
            
            % Zählt nur als Belegt, wenn Radius mittelpunkt der Zelle
            % erreicht
            if dist <= radius
                map(y, x) = 1;
            end
        end
    end
end
