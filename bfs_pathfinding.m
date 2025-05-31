function path = bfs_pathfinding(map, start_pos, end_pos)

    % Rundung der Start- und Endposition auf ganze Zahlen
    start_cell = round(start_pos(1:2));
    goal_cell = round(end_pos(1:2));
    
    % Initialisierung
    [rows, cols] = size(map);
    visited = false(rows, cols);
    prev = zeros(rows, cols, 2); % Für Rückverfolgung des Pfads
    queue = [start_cell];       % Initiale Queue mit Startpunkt
    visited(start_cell(2), start_cell(1)) = true;  % (y,x)

    % Bewegungsmöglichkeiten
    directions = [0 1; 1 0; 0 -1; -1 0];

    found = false;

    % BFS Schleife
    while ~isempty(queue)
        current = queue(1,:);
        queue(1,:) = [];
        
        if isequal(current, goal_cell)
            found = true;
            break;
        end

        for i = 1:4
            neighbor = current + directions(i, :);
            x = neighbor(1);
            y = neighbor(2);

            if x > 0 && x <= cols && y > 0 && y <= rows
                if ~visited(y, x) && map(y, x) == 0
                    queue(end+1,:) = neighbor; % enqueue
                    visited(y, x) = true;
                    prev(y, x, :) = current; % Rückverweis
                end
            end
        end
    end

    % Rückverfolgung Pfad
    if found
        path = goal_cell;
        while ~isequal(path(1,:), start_cell)
            current = path(1,:);
            prev_cell = squeeze(prev(current(2), current(1), :))';
            path = [prev_cell; path];
        end
    else
        path = [];
        disp('Kein Pfad gefunden!');
    end
end
