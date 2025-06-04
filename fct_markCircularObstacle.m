function map = fct_markCircularObstacle(map, x_center, y_center, radius, cellSize)
% Funktion zur Eintragung von Hindernissen in die Rastermap
% Rastermap wird für Pfadplannung benötigt

    [rows, cols] = size(map);

    for row = 1:rows
        for col = 1:cols
            
            % Berechne reale Koordinaten des Zellenmittelpunkts
            cell_x = (col - 0.5) * cellSize;
            cell_y = (row - 0.5) * cellSize;

            % Abstand vom Zellenmittelpunkt zum Hindernismittelpunkt
            dist = sqrt((cell_x - x_center)^2 + (cell_y - y_center)^2);

            if dist <= radius
                map(row, col) = 1;
            end
        end
    end
end
