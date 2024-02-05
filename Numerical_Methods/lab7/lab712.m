clear all; close all; clc
syms x;
fun = @(x) cos(x);
fun1 = @(x) sin(x);
a = 0;
b = pi;
a1 = -pi/2;
b1 = pi/2;

wynik_calki_cos = integral(fun, a, b);
wynik_calki_sin = integral(fun1, a1, b1);

%wagi i węzły mają być zgodne z tymi wyprowadzonymi dla kwadratury Gaussa-Legendra
%dla N=2
wezly = [-sqrt(1/3), sqrt(1/3)];
wagi = [1, 1];
%dla N=3
wezly1 = [-sqrt(3/5), 0, sqrt(3/5)];
wagi1 = [5/9, 8/9, 5/9];

N = 2;
N1 = 3;
suma = 0;
suma1 = 0;
sum = 0;
sum1 = 0;
for k=1:N
   suma = suma + wagi(k)*fun( (a+b)/2 + ((b-a)/2)*wezly(k));
   suma1 = suma1 + wagi(k)*fun1( (a1+b1)/2 + ((b1-a1)/2)*wezly(k));
end
for k=1:N1
   sum = sum + wagi1(k)*fun( (a+b)/2 + ((b-a)/2)*wezly1(k));
   sum1 = sum1 + wagi1(k)*fun1( (a1+b1)/2 + ((b1-a1)/2)*wezly1(k));
end
suma = suma * (b-a)/2;
suma1 = suma1 * (b-a)/2;
sum = sum * (b-a)/2;
sum1 = sum1 * (b-a)/2;
%błąd dla cos(x), przy N=2
err = abs(wynik_calki_cos - suma);
%błąd dla sin(x), przy N=2
err1 = abs(wynik_calki_sin - suma1);
%błąd dla cos(x), przy N=3
err2 = abs(wynik_calki_cos - sum);
%błąd dla sin(x), przy N=3
err3 = abs(wynik_calki_sin - sum1);

disp("błąd dla cos(x), przy N=2:")
disp(err)
disp("błąd dla sin(x), przy N=2:")
disp(err1)
disp("błąd dla cos(x), przy N=3:")
disp(err2)
disp("błąd dla sin(x), przy N=3:")
disp(err3)