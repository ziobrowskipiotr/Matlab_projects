clear all; close all; clc;

syms x; %zdefiniowana zmienna symboliczna
syms f(x);
syms f;
n = 3; %liczba punktów
%zakres całkowania
a = -1;
b = 1;
%definicja funkcji
f0 = 1;
f1 = x;
f2 = x.^2;
f3 = x.^3;
f4 = x.^4;
f5 = x.^5;
%całki z powyższych funkcji
F0 = int(f0, x, a, b);
F1 = int(f1, x, a, b);
F2 = int(f2, x, a, b);
F3 = int(f3, x, a, b);
F4 = int(f4, x, a, b);
F5 = int(f5, x, a, b);

%W instrukcji mamy informację, że "W praktyce dla kwadratur wyższego rzędu położenia węzłów (które są zerami wielomianów Legendre'a)"
%Tak, więc sprytnie wykorzystujemy tą informację do dalszych obliczeń
f(x) = (1/2).*((5.*x.^3) - (3.*x));
Rozw = solve(f);
X = zeros(1, size(Rozw, 1));
for i = 1:size(Rozw, 1)
    X(1, i) = Rozw(i, 1);
end
X = sort(X);
%rozwiązuje układ równań, aby wszły mi wagi
A = [1, 1, 1;
     X(1), X(2), X(3);
     (X(1,1))^2, (X(1,2))^2, (X(1,3))^2;
     (X(1,1))^3, (X(1,2))^3, (X(1,3))^3;
     (X(1,1))^4, (X(1,2))^4, (X(1,3))^4;
     (X(1,1))^5, (X(1,2))^5, (X(1,3))^5];

B = [F0;
     F1;
     F2;
     F3;
     F4;
     F5];

C = A\B;
Wagi = zeros(1, size(C, 1));
for i = 1:size(C, 1)
    Wagi(1, i) = C(i, 1);
end
%Wyraźmy wyrażenia bez przybliżenia numerycznego
Wagi = sym(Wagi);
X = sym(X);
%Zapis ostateczny funkcji bez błędu bo go nie wyprowadzaliśmy
fprintf("Wynik całki to: %s*f(%s) + %s*f(%s) + %s*f(%s) + błąd [ f^6(c)/15750 ]\n", char(Wagi(1)), char(X(1)), char(Wagi(2)), char(X(2)), char(Wagi(3)), char(X(3)))