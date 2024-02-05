clc;

u = [1; 2; 3];      %wektor jednostkowy
v = [4; 5; 6];      %wektor jednostkowy
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];        %macierz 3x3
B = eye(3);         %macierz jednostkowa o wymiarach 3x3 (czyli wszystkie elementy poza główną przekątną to 0, na głównej przekątnej 1)


iloczynSkalarny = dot(u, v)     %iloczyn dł wektórw i kąta miedzy nimi
iloczynWektorowy = cross(u, v)      %wyznacznik macierzy z wersorami 'ijk'
sumaMacierzy = A + B
iloczynMacierzy = A * B         %mnozymy odpowiedno kazdy element kolumy z wierszem drugiej macierzy i sumujemy, mnozenie macierzy nie jeset przemienne
iloczynAu = A * u
macierzOdwrotnaDoA = pinv(A)     %macierz odwrotna to taka macierz która pomnożona przez macierz daje macierz jednostkowej

wyznacznik_A = det(A);

if wyznacznik_A ~= 0
    disp('Macierz A jest odwracalna.');
else
    disp('Macierz A nie jest odwracalna (jest osobliwa).');
end

wspolczynnikWielomianuCharakterysycznegoMacierzy = poly(A)      %wielomian charakterystyczny ma postac det(A - Lamda*I)

fprintf('\nmacierz osobliwa to macierz która ma wyznacznik równy 0 i dlatego nie posida macierzy odwrtonej\n');

rzadMAcierzA = rank(A)      %rząd macierzy reprezentuje maksymalną liczbę liniowo niezależnych wierszy lub kolumn, wiersze lub kolumny są liniowo niezalżne gdy nie można jednoego z nich wyrazić jako kombinacji liniowej pozostałych