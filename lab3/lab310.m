close all;
%załadowanie danych z pliku babia_gora
babiaGora = load('babia_gora.dat');
% Wykres przed obrotem
figure;
Wykres1(babiaGora);
%obrót (w stopniach) punktów zawartych w babia_gora na wykresie 3D 
figure;
Wykres(babiaGora * rotacja_macierzy_w_stopniach(90, 0, 0)); %Mnożenie macierzy z danymi (babiaGora) z macierzą obrotu.

%definiowanie 2 potrzebnych funkcji do działania powyższych rzeczy
function Wykres(Macierz)
   plot3(Macierz(:, 1), Macierz(:, 2), Macierz(:, 3), '.'); %Macierz(:, 1) oznacza kolumnę ze współrzędnymi x-sowymi itd., '.' oznacza po prostu narysowanie małej kropki(punktu) na wykresie.
end
function Wykres1(Macierz)
   plot3(Macierz(:, 1), Macierz(:, 2), Macierz(:, 3), '.');
end
%obracanie o podany kąt w radianach względem danej osi
function [A] = rotacja_macierzy(Z, Y, X)
   A = [
       [cos(Z)*cos(Y)    cos(Z)*sin(Y)*sin(X)-sin(Z)*cos(X)    cos(Z)*sin(Y)*cos(X)+sin(Z)*sin(X)    ];
       [sin(Z)*cos(Y)    sin(Z)*sin(Y)*sin(X)+cos(Z)*cos(X)    sin(Z)*sin(Y)*cos(X)-cos(Z)*sin(X)    ];
       [-sin(Y)            cos(Y)*sin(Y)                               cos(Y)*cos(Z)                                 ];
   ];
end
%Funkcja ta przelicza kąty podane w stopniach na radiany, aby uzyskać macierz obrotu w radianach
function [A] = rotacja_macierzy_w_stopniach(Z, Y, X)
   A = rotacja_macierzy(Z/360*2*pi, Y/360*2*pi, X/360*2*pi);
end