function result_path = bfs_pathfinding(map, start_pos, end_pos)

    % Rundung der Start- und Endposition auf ganze Zahlen
    
    start_cell = start_pos(1:2);
    goal_cell = end_pos(1:2);
    
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
        
        % Besuchen aller Nachbarzellen
        for i = 1:4
            neighbor = current + directions(i, :);
            x = neighbor(1);
            y = neighbor(2);

            % Prüfung ob Zelle gültig
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
        result_path = goal_cell;
        while ~isequal(result_path(1,:), start_cell)
            current = result_path(1,:);
            % von welcher Zelle bin ich gekommen;
            prev_cell = squeeze(prev(current(2), current(1), :))';
            result_path = [prev_cell; result_path];
        end
    else
        result_path = [];
        disp('Kein Pfad gefunden!');
    end
end
