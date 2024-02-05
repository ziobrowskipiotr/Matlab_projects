clear all; close all; clc;
syms x;

y = @(x) sin(x);

wartosci_x = [0, pi/16, pi/8] %widać, że są to węzły równoodległe, więc obojętnie jaką różnice elementów sąsiednich zastosuje, to wyjdzie na to samo
h = wartosci_x(1, 2) - wartosci_x(1,1);
x0 = wartosci_x(1,1);
wartosci_y = [y(wartosci_x(1,1)), y(wartosci_x(1,2)), y(wartosci_x(1,3))];
%to dokładne wartości pochodnych z przybliżeniem poprzez funkcję 'eval',
%aby w errorze nie było wartości z liczbą "pi"
dokladne_wartosci = [eval( (subs(diff(y,x,1),x,x0)) ), eval( (subs(diff(y,x,1),x,x0+h)) ), eval( (subs(diff(y,x,1),x,x0+2*h)) )], 

%to wartości z wzorów 7.16-7.18
f1 = 1/(2*h) * (-3*wartosci_y(1) + 4*wartosci_y(2) - wartosci_y(3)),
f2 = 1/(2*h) * (wartosci_y(3) - wartosci_y(1)),
f3 = 1/(2*h) * (wartosci_y(1) - 4*wartosci_y(2) +3*wartosci_y(3)),

errors = [abs(f1 - dokladne_wartosci(1)), abs(f2 - dokladne_wartosci(2)), abs(f3 - dokladne_wartosci(3))],