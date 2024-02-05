clear all; close all;
A = [1, 2;
     3, 4];
b=[5;
   11];

x1 = A\b,

disp("1 część zadania:")
a11 = A(1, 1);
a12 = A(1, 2);
a21 = A(2, 1);
a22 = A(2, 2);

ADt = [a22, -a12;
      -a21, a11];
A_odwr = (1/det(A)) * ADt;

x2 = A_odwr * b,

b_sprawdzam_czy_poprawne = A*x2,
err = max(abs(x1-x2)),

disp("2 część zadania:")

B = [1,2,3;
     4,5,6;
     7,8,8];

macierz_odwrotna = zeros(size(B,1), size(B,2))

for g = 1:size(B,1)
    for k = 1:size(B,2)
        B_robocze = B;
        B_robocze(g,:) = [];
        B_robocze(:,k) = [];
        if det(B) ~= 0
            macierz_odwrotna(g,k) = (((-1).^(g+k)) * det(B_robocze))/det(B)
        else
            disp("Nie można odwrócić macierzy B.")
        end
    end
end

disp("3 część zadania:")
function [Z] = odwrotna_rekurencyjnie(i, j, k, C, Z)
if((i < k) && (j <= k))                        
    Matrix_dop = C;                            
    Matrix_dop(i,:) = [];                      
    Matrix_dop(:,j) = [];
    Z(i,j) = (-1).^(i+j) * det(Matrix_dop);
    %disp(Z(i, j));
    i = i + 1;
    odwrotna_rekurencyjnie(i, j, k, C, Z);
elseif((i == k) && (j == k))
    Matrix_dop = C;
    Matrix_dop(i,:) = [];
    Matrix_dop(:,j) = [];    
    Z(i,j) = (-1).^(i+j) * det(Matrix_dop);
    %disp(Z(i, j));
    fprintf("\nMacierz pierwotna: \n");
    disp(C);
    fprintf("\nMacierz odwrotna za pomocą funkcji rekurencyjnej: \n");
    Z = (1/(det(C))) * Z.';
    disp(Z);
    fprintf("\nTa sama macierz odwrócona za pomocą funkcji inv z matlab: \n");
    disp(inv(C));
elseif(i == k)
    Matrix_dop = C;                             
    Matrix_dop(i,:) = [];                     
    Matrix_dop(:,j) = [];    
    Z(i,j) = (-1).^(i+j) * det(Matrix_dop);
    %disp(Z(i, j));
    i = 1;
    j = j + 1;
    odwrotna_rekurencyjnie(i, j, k, C, Z);
end
end

