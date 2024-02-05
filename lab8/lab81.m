% evd_pca.m
% Separacja zrodel - nagrania
clear all; close all;

[y1, fpr1] = audioread('mix1.wav'); y1 = y1(:, 1)'; % wczytaj nagrania z dwoch mikrofonow
[y2, fpr2] = audioread('mix2.wav'); y2 = y2(:, 1)'; % tylko pierwszy kanal, zmien kierunek
size(y1), size(y2), pause
% pokaz wymiary wektorow
N = min(length(y1), length(y2));
% dlugosc krotszego nagrania
n = 1:N; y1 = y1(1:N); y2 = y2(1:N);
% pozostaw taka sama liczbe probeka
figure;
subplot(211); plot(n, y1); title('y1(n)'); grid; % pokaz oba
subplot(212); plot(n, y2); title('y2(n)'); grid; % nagrania
soundsc(y1(1:7*fpr1), fpr1), pause
% odsluchaj oba
soundsc(y2(1:3*fpr2), fpr2), pause
% nagrania
% Separacja zrodel
C1 = cov(y1, y2);
y12 = [y1 - mean(y1); y2 - mean(y2)];
C2 = y12 * y12' / N;
pause
C = C2; % C = C1 albo C2
[V, D] = eig(C2); pause
xe = V' * [y1; y2];
% Wynik separacji
% macierz kowariancji Matlaba
% odjecie wartosci srednich
% macierz kowariancji Nasza
% wybor macierzy
% dekompozycja EVD
% PCA - rzutowanie na wektory wlasne
% 8.3 Praktyczne inżynierskie przykłady użycia EVD
% 
% 163
figure;
subplot(211); plot(n, xe(1, :), 'b'); title('x1est(n)'); grid;
subplot(212); plot(n, xe(2, :), 'b'); title('x2est(n)'); grid;
soundsc(xe(1, :), fpr1), pause
soundsc(xe(2, :), fpr2), pause
