%Braucht 4 Argumente Koordinaten(x,y), Psi und Radius

function hWheel = fct_plotwheel(x, y, z, r, w, psi)
%FCT_PLOTWHEEL_3D Zeichnet ein Rad als Zylinder in 3D mit stehender Ausrichtung
% (x, y, z): Mittelpunkt
% r: Radius, w: Breite (zylinderlänge), psi: Rotation (um die Radachse)

% Erzeuge Zylinder entlang der Z-Achse
[theta, z_cyl] = meshgrid(linspace(0, 2*pi, 30), linspace(-w/2, w/2, 2));
x_cyl = r * cos(theta);
y_cyl = r * sin(theta);

% Zylinder rotieren um die x-Achse → Achse des Rades zeigt in Y-Richtung
% Das macht aus dem „liegenden“ Rad ein „stehendes“.
x_rot = x_cyl;
y_rot = z_cyl;
z_rot = y_cyl;


% Zeichne den Radzylinder
    hWheel = surf( ...
        x_rot + x, ...
        y_rot + y, ...
        z_rot + z, ...
        'FaceColor', 'k', ...
        'EdgeColor', 'none' ...
    );
    % Damit kannst du später gezielt nur alle Räder/Fahrzeug-Objekte löschen:
    set(hWheel, 'Tag', 'vehicle');
    
    hold on;
end
