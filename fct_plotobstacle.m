function fct_plotobstacle(x, y, z, r, h)
%FCT_PLOTOBSTACLE_3D Plottet ein zylinderförmiges Hindernis
% (x, y, z): Mittelpunkt der Basis des Zylinders
% r: Radius des Zylinders
% h: Höhe des Zylinders

% Zylinder erzeugen
[theta, z_cyl] = meshgrid(linspace(0, 2*pi, 30), linspace(0, h, 2));
x_cyl = r * cos(theta) + x;
y_cyl = r * sin(theta) + y;
z_cyl = z_cyl + z;

% Zeichnen
surf(x_cyl, y_cyl, z_cyl, ...
    'FaceColor', [0.8 0.3 0.3], 'EdgeColor', 'none');
hold on;
end
