clear all; close all; clc;
N = 1000;

% Utwórz różne macierze kowariancji
S_values = zeros(2, 2, 6);
S_values(:,:,1) = [1 0; 0 0.1];
S_values(:,:,2) = [0.1 0; 0 1];
S_values(:,:,3) = [1 0.5; 0.5 1];
S_values(:,:,4) = [1 -0.5; -0.5 1];
S_values(:,:,5) = [cosd(45) -sind(45); sind(45) cosd(45)];
S_values(:,:,6) = [cosd(30) -sind(30); sind(30) cosd(30)];

% Wyświetl wykresy dla różnych macierzy S
figure;

for i = 1:6
    S = S_values(:,:,i);
    
    % Generuj punkty elipsy
    x = elipsa(S, 1, N);
    
    % Przetransformuj punkty losowo
    x_transformed = x .* (2*(rand(1,N)-0.5));

    % Wykresy
    subplot(2, 3, i);
    plot(x(1,:), x(2,:), 'ro', x_transformed(1,:), x_transformed(2,:), 'b*');
    title(['Matrix S: ' num2str(i)]);
    xlabel('x'); ylabel('y');
    grid on; axis square;
    legend('Original', 'Transformed');
end

function x = elipsa(S, r, N)
    [V, D] = eig(S);
    V = V * sqrt(r * D);
    alfa = linspace(0, 2*pi, N);
    x = V * [cos(alfa); sin(alfa)];
end

%Jeżeli chodzi o macierz rotacji:
%Jeżeli wpiszemy odpowiedni wartości naszego kąta względeem tego wazoru:
% R = [ cos(A), sin(A);
%      -sin(A), cos(A)];
%Otrzymamy w ten sposób obrót naszej elipsy odpowiednio o kąt A. Wartości te mogą być pomnożone o jakąś liczbe, wtedy otrzymamy coś bardziej rozciągniętego, bądż ściśniętego.
%Rozkład wartości własnych macierzy kowariancji S pozwala nam przekształcać jednostkowe okręgi w przestrzeni na elipsy, których osie są równoległe do osi własnych macierzy kowariancji. Tutaj r to promień jednostkowego okręgu, a D to diagonalna macierz zawierająca wartości własne.
%Podczas generowania punktów na elipsie, potrzebujemy dostosować te wartości własne tak, aby uzyskać pożądany kształt elipsy. Wartości własne określają, jak bardzo elipsa jest rozciągnięta wzdłuż poszczególnych osi.
%Teraz, dlaczego używamy pierwiastka z r * D:
%D to diagonalna macierz wartości własnych. Pierwiastek z wartości własnej odpowiada długości półosi elipsy.
%Mnożymy D przez r, aby skorygować długość półosi na podstawie promienia jednostkowego okręgu. Dzięki temu możemy kontrolować, jak bardzo chcemy rozciągnąć lub skurczyć elipsę.
%Następnie mnożymy przez macierz wektorów własnych V, która odpowiada za kierunek osi elipsy. To właśnie dzięki tej operacji otrzymujemy ostateczne współrzędne punktów na elipsie.
%Dlatego pierwiastek z iloczynu r * D jest używany, aby dostosować wielkość półosi elipsy, a reszta operacji odpowiada za kształt i orientację elipsy w przestrzeni.