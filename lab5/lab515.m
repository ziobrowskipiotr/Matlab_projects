clear all; close all; clc;     
% f(x) = 1/(x^4 + 1)
X = [ -3 : 0.3 : 3 ]; %wartości x
Y1 = zeros(4*(size(X, 2)-1), 1); %macierz Y1 do równania macierzowego
%wartości y
Y = zeros(size(X, 1), 1);
for g = 1:size(X, 2)
    Y(g, 1) = 1/(X(g).^4 + 1);
end
%wpisanie wartości z Y do Y1, tak, aby spełniały układ macierzy w równaniu macierzowym
j = 1;
for g = 1:(size(Y, 1))
    if g==1 || g==size(Y, 1)
        Y1(j, 1) = Y(g, 1);
        j = j+1;
    else
        Y1(j, 1) = Y(g, 1);
        j = j+1;
        Y1(j, 1) = Y(g, 1);
        j = j+1;
    end
end
%równanie macierzowe
A = macierz_interpolacji(X);
%macierz B z współczynnikami lokalnymi wielomianów kubicznych splejnów
B = A\Y1;
% Wartości x do rysowania sklejonej funkcji kubicznej
X_interp = X(1,1):0.005:X(end);
% utworzenie pustej macierzy do przechowywania wartości funkcji sklejonych
Y_interp = zeros(size(X_interp));
% obliczanie zbioru wartości oryginalnej funkcji
Y_original = 1./(X_interp.^4 + 1);
for i = 1:length(X_interp)
    x = X_interp(i);
    for j = 1:(length(X) - 1)
        if x >= X(j) && x <= X(j + 1)
            a = B(j * 4 - 3);
            b = B(j * 4 - 2);
            c = B(j * 4 - 1);
            d = B(j * 4);
        end
    end
    % obliczanie zbioru wartości splejnu
    Y_interp(i) = a * (x ^ 3) + b * (x ^ 2) + c * x + d;
end

% rysowanie wykresów
figure;
plot(X_interp, Y_interp, 'b', X, Y, 'ro', X_interp, Y_original, 'g--'); % rysowanie oryginalnego wykresu
title('Kubiczny splajn of f(x)');
xlabel('X');
ylabel('f(X)');
legend('Kubiczna Interpolacja', 'Interpolacyjne Punkty', 'Oryginalna Funkcja', 'Location', 'Northwest');
grid on;

%funkcja służąca do utworzenia macierzy interpolacyjnej(czy tam kubicznej, czy coś)
function [A] = macierz_interpolacji(X)
    A = zeros(4*(size(X, 2)-1), 4*(size(X, 2)-1)); %4(n-1) niewiadomych, to i takie wymiary ma macierz
    f = 1;
    k = 1;
    %przypisanie pierwszej części do macierzy czyli 2n-2 równań
    for g = 1:(2*(size(X, 2)-1))
        A(g,k) = (X(1, f)).^3;
        k = k+1;
        A(g,k) = (X(1, f)).^2;
        k = k+1;
        A(g,k) = (X(1, f)).^1;
        k = k+1;
        A(g,k) = 1;
        if mod(g,2) == 1
            k = k-3;
            f = f+1;
        else
            k = k+1;
        end
    end
    f = 1;
    k = 1;
    % przypisanie kolejnych n-2 równań
    for h = (2*(size(X, 2))-1):(3*(size(X, 2))-4)
        f = f+1;
        A(h,k) = 3*((X(1, f)).^2);
        k = k+1;
        A(h,k) = 2*((X(1, f)).^1);
        k = k+1;
        A(h,k) = 1;
        k = k+2;
        A(h,k) = -3*((X(1, f)).^2);
        k = k+1;
        A(h,k) = -2*((X(1, f)).^1);
        k = k+1;
        A(h,k) = -1;
        k = k-2;
    end
    f = 1;
    k = 1;
    % przypisanie kolejnych n-2 równań
    for l = (3*(size(X, 2))-3):(4*(size(X, 2))-6)
        f = f+1;
        A(l,k) = 6*((X(1, f)).^1);
        k = k+1;
        A(l,k) = 2;
        k = k+3;
        A(l,k) = -6*((X(1, f)).^1);
        k = k+1;
        A(l,k) = -2;
        k = k-1;
    end
    % dopisanie dwóch ostatnich równań, w których chodzi o to, że w 1 i 2
    % węźle druga pochodna musi być równa 0
    A(size(A,1)-1, 1) = 6*X(1, 1);
    A(size(A,1)-1, 2) = 2;
    A(size(A,1), size(A,1)-3) = 6*X(1, size(X, 2));
    A(size(A,1), size(A,1)-2) = 2;
end