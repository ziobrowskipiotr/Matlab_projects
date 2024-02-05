%dekompozycja macierzy kwadratowej (A) polega na jej przedstawieniu jako
%iloczunu dwóch macierzy trójkątnej dolnej (L) i trójkątnej górnej (U)
%                               A = L * U

%za pomocą funkcji muszę sprawdzić poprawność mnożenia A * U

clc;

%B = [4 3 2 1 4; 2 3 2 1 18; 0.8 1.1 2 1 8; 0.4 0.7 0.9 1 9; 1 2 3 4 5];
%B = [4 3 2 1; 2 3 2 1; 0.8 1.1 2 1; 0.4 0.7 0.9 1];
%B = [4 3 2; 2 3 2; 0.8 1.1 2];
%B = [4 2; 2 3];
%B = [4; 2];

B = [4, 2, 2; 2, 5, 4; 2, 4, 9];
%rozkład Cholskiego przewidzainy jest tylko dla macierzy symetrycznych i
%dodatnio określonych
myLU(B);

function [L,U] = myLU(A)

[N,N] = size(A);
L = eye(N); %stworzenie macierzy jednostkowej o rozmiarze NxN
for w = 1:N
    value = 0;
    for k = 1:(w-1)
        value = value + L(w,k) * L(w,k);
    end
    L(w,w) = sqrt(A(w,w)  - value);

    for h = (w+1):N
        value = 0;
        for k = 1:(w-1)
            value = value + L(h,k)*L(w,k);
        end
        L(h,w) = (1/L(w,w)) * (A(h,w) - value);
    end
end
U = L.';
disp(U);
disp(chol(A))

if(U == chol(A))
    disp("Rozkład Cholsky'ego jest okej.")
end
end