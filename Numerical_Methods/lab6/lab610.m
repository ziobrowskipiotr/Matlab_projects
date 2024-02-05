clear all; close all; clc;

%Wybieramy stopień wielomianu "L"
n = 9;
%Wybieramy stopień wielomianu "M"
%(chyba) m>=n, bo inaczej algorytm by nie działał
m = 10;
%Wybieramy stopień wielomianu szeregu Maclaurina z "f"
g = 20; % "g" >= n+m!!!, żeby nie brakowało nam współczyników "c" (z założenia algorytmu przybliżenia Pade rozwijamy "f" do nieskończoności)
syms x;
f = 1/(x.^2 + 1); %funkcja do rozwinięcia.
Rozwiniecie_Maclaurina = taylor(f, x, 'Order', g+1); % Rozwinięcie Maclaurina do "g" stopnia, czyli do x^g. "g+1" mówi nam, że "g+1" wyrazów szeregu

% Współczynniki szeregu Maclaurina od wyższych potęg do niższych
C_odwrotnie = sym2poly(Rozwiniecie_Maclaurina); 

% Tworzenie macierzy (wektora) współczynników funkcji f
C = flip(C_odwrotnie); % Odwrócenie kolejności do standardowej: od x^0 do x^n

%Tworzymy macierz_C według algorytmu uwzględniając, że matlab iteruje od 1
macierz_C = zeros(m, m);
s = 1;
for i = 1:length(macierz_C)
    for j = 1:length(macierz_C)
        if (s+n-m+j) > 0
            macierz_C(i,j) = C(1,s+n-m+j);
        else
            macierz_C(i,j) = 0;
        end
    end
    s = s+1;
end

%Tworzymy macierz_C1 według algorytmu uwzględniając, że matlab iteruje od 1
macierz_C1 = zeros(m, 1);
for i = 1:length(macierz_C1)
    macierz_C1(i, 1) = -C(1, (n+1)+i);
end

%Jeśli wyznacznik macierzy nie jest równy zero to znaczy, że macierz jest liniowo niezależna
%i wszystko jest w porządku. Można zastosować aproksymację Pade.
%Dokańczamy algorytm uwzględniając, że matlab iteruje od 1, nie od 0.
if det(macierz_C) ~= 0
    B = macierz_C\macierz_C1;
    B_new = zeros(size(B,1)+1, 1);
    for i = 1:size(B)
        B_new(i, 1) = B(i, 1);
    end
    B_new(end, 1) = 1; %dodajemy współczynnik przy x^0(bo według algorytmu uznajemy, że jest on równy 1)
    B = flipud(B_new);
    B_row = B.';
    A = zeros(1, n+1);
    for column = 1:n+1
       for j = 1:column
            A(1, column) =A(1, column) + C((1+column) - j) * B_row(j); %algorytm na wyliczenie 
       end                                                             %współczynników wielomianu w liczniku uwzględniając iterację od 1.
    end
    A_flipped = flip(A);
    B_row_flipped = flip(B_row);
    % Konwersja współczynników na wyrażenia symboliczne
    licznik = poly2sym(A_flipped, x);
    mianownik = poly2sym(B_row_flipped, x);

    % Utworzenie ilorazu dwóch wyrażeń symbolicznych
    H = licznik / mianownik;

    % Wyświetlenie ilorazu
    disp(H);

    % Rysowanie wykresu przybliżenia funkcji "f"
    fplot(H, [-3, 3], 'r');  % 'r' oznacza kolor czerwony
    hold on;  % utrzymuje wykres, aby można było nanieść kolejną funkcję

    % Rysowanie wykresu funkcji błędu
    fplot(f, [-2, 2], 'b');  % 'b' oznacza kolor niebieski
    hold off;  % kończy tryb nanoszenia wykresów

    % Dodanie legendy
    legend('Przybliżenie funkcji f(x)', 'Funkcja f(x)');

    % Etykiety osi i tytuł
    xlabel('x');
    ylabel('y');
    title('Porównanie przybliżenia funkcji f(x) z funkcją f(x)');
else
    disp("Sensu to nie ma, bo macierz_C jest w " + ...
        "tym przypadku osobliwa, bo takie współczynniki w rozwinięciu " + ...
        "Maclaurina ma wielomian rozwiniętej funkcji f(x). Prawdopodobnie " + ...
        "funkcja ta nie jest dobrą funkcją do aproksymacji Pade.")
end

disp("----------------------------------------------------------------------------------------------")
disp("Funkcji 1/(x.^2 + 1) zwyczajnie nie ma sensu aproksymować metodą Pade, bo sama w sobie jest ona ilorazem wielomianów oraz macierz_C z algorytmu będzie zawsze osobliwa.")