function fct_plot_start_end(start_pos, end_pos)
%FCT_PLOT_START_END Plottet Start- und Endpunkt in 3D
% start_pos, end_pos: [x, y, z] Koordinaten

% Startpunkt (grün)
plot3(start_pos(1), start_pos(2), start_pos(3), 'go', ...
      'MarkerSize', 10, 'MarkerFaceColor', 'g');
text(start_pos(1), start_pos(2), start_pos(3) + 0.5, 'Start', ...
     'Color', 'g', 'FontSize', 10, 'FontWeight', 'bold');

% Endpunkt (rot)
plot3(end_pos(1), end_pos(2), end_pos(3), 'ro', ...
      'MarkerSize', 10, 'MarkerFaceColor', 'r');
text(end_pos(1), end_pos(2), end_pos(3) + 0.5, 'Ziel', ...
     'Color', 'r', 'FontSize', 10, 'FontWeight', 'bold');

hold on;
end
