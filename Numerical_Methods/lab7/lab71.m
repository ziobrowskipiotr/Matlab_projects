clear all;
close all;
clc;
syms x;

y = @(x) 2*x.^2 + x + 1/2;

wartosci_x = [0, pi/4, pi/2];
h = wartosci_x(1, 2) - wartosci_x(1, 1);
x0 = wartosci_x(1, 1);
wartosci_y = [y(wartosci_x(1, 1)), y(wartosci_x(1, 2)), y(wartosci_x(1, 3))];

% Oblicz dokładne wartości pochodnych
dokladne_wartosci = [eval(subs(diff(y, x, 1), x, x0)), eval(subs(diff(y, x, 1), x, x0 + h)), eval(subs(diff(y, x, 1), x, x0 + 2 * h))];

% Oblicz estymatory pochodnych
f1 = 1 / (2 * h) * (-3 * wartosci_y(1) + 4 * wartosci_y(2) - wartosci_y(3));
f2 = 1 / (2 * h) * (wartosci_y(3) - wartosci_y(1));
f3 = 1 / (2 * h) * (wartosci_y(1) - 4 * wartosci_y(2) + 3 * wartosci_y(3));

% Oblicz błędy estymacji pochodnych
errors_pochodne = [abs(f1 - dokladne_wartosci(1)), abs(f2 - dokladne_wartosci(2)), abs(f3 - dokladne_wartosci(3))];

% Oblicz dokładne wartości całek za pomocą obliczeń numerycznych
integral_exact = [integral(y, x0, x0 + h), integral(y, x0, x0 + 2 * h), integral(y, x0, x0 + 3 * h)];

% Oblicz estymatory całek
integral_estimate = [h * (wartosci_y(1) + wartosci_y(2))/2, h * (wartosci_y(1) + 4*wartosci_y(2) + wartosci_y(3))/6, h * (wartosci_y(1) + 4*wartosci_y(2) + wartosci_y(3))/6];

% Oblicz błędy estymacji całek
errors_calki = [abs(integral_estimate(1) - integral_exact(1)), abs(integral_estimate(2) - integral_exact(2)), abs(integral_estimate(3) - integral_exact(3))];

fprintf('Błędy estymacji pochodnych:\n');
fprintf('Błąd estymacji pochodnej 1: %.4f\n', errors_pochodne(1));
fprintf('Błąd estymacji pochodnej 2: %.4f\n', errors_pochodne(2));
fprintf('Błąd estymacji pochodnej 3: %.4f\n', errors_pochodne(3));

fprintf('Błędy estymacji całek:\n');
fprintf('Błąd estymacji całki 1: %.4f\n', errors_calki(1));
fprintf('Błąd estymacji całki 2: %.4f\n', errors_calki(2));
fprintf('Błąd estymacji całki 3: %.4f\n', errors_calki(3));

% Przybliżenie funkcji sinus w okolicy x = 0 za pomocą wielomianu interpolacyjnego
x_interpolacyjny = 0;
wartosci_x_interpolacyjny = [x0, x0 + h, x0 + 2 * h];
wartosci_y_interpolacyjny = [y(x0), y(x0 + h), y(x0 + 2 * h)];

% Oblicz wielomian interpolacyjny
wielomian_interpolacyjny = polyfit(wartosci_x_interpolacyjny, wartosci_y_interpolacyjny, 2);
fprintf("Wielomian interpolacyjny przybliżający funkcję sinus w okolicy x = 0: %fx^2 + %fx + %f\n", wielomian_interpolacyjny(1,1), wielomian_interpolacyjny(1,2), wielomian_interpolacyjny(1,3))