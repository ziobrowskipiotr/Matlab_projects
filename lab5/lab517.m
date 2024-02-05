clear all; close all;
load('babia_gora.dat'); % Pobierz dane topograficzne z pliku babia_gora.dat

X = babia_gora;

% Tworzenie nowego okna wykresu, tworzenie siatki, wyświetlanie punktów 3D
figure; grid; plot3(X(:,1), X(:,2), X(:,3), 'b.');

x = X(:,1);
y = X(:,2);
z = X(:,3);

xvar = [min(x) : (max(x) - min(x)) / 200 : max(x)];
yvar = [min(y) : (max(y) - min(y)) / 200 : max(y)];

[Xi, Yi] = meshgrid(xvar, yvar);

% Interpolacja typu nearest
out_nearest = griddata(x, y, z, Xi, Yi, 'nearest');
figure; surf(Xi, Yi, out_nearest);
title('Interpolacja nearest');

% Interpolacja typu linear
out_linear = griddata(x, y, z, Xi, Yi, 'linear');
figure; surf(Xi, Yi, out_linear);
title('Interpolacja linear');

% Interpolacja typu spline
out_spline = griddata(x, y, z, Xi, Yi, 'v4');
figure; surf(Xi, Yi, out_spline);
title('Interpolacja spline');

% Interpolacja typu cubic (zawarta w kodzie)
out_cubic = griddata(x, y, z, Xi, Yi, 'cubic');
figure; surf(Xi, Yi, out_cubic);
title('Interpolacja cubic (domyślna)');

%Próbowałem jakieś przeliczniki stosować ale nie ma to za bardzo sensu
%przez to, że macierze są innej długości niż te dane w pliku babia_gora.dat