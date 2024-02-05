%dekompozycja macierzy kwadratowej (A) polega na jej przedstawieniu jako
%iloczunu dwóch macierzy trójkątnej dolnej (L) i trójkątnej górnej (U)
%                               A = L * U

%za pomocą funkcji muszę sprawdzić poprawność mnożenia A * U

clear all; close all; clc;

B = [4 3 2 1; 2 3 2 1; 0.8 1.1 2 1; 0.4 0.7 0.9 1];
%B = [4 3 2; 2 3 2; 0.8 1.1 2];
%B = [4 2; 2 3];
%B = [4; 2];

myLU(B, 0);

function [L,U] = myLU(A, choice)

[N,N] = size(A);
if(choice == 0) % prosciej, wolniej -----------------------------------------
    L = eye(N); U = zeros(N,N);
    for i = 1:N
        for j=i:N
            U(i,j) = A(i,j) - L(i,1:i-1)*U(1:i-1,j);
        end
        for j=i+1:N
            L(j,i) = 1/U(i,i) * ( A(j,i) - L(j,1:i-1)*U(1:i-1,i) );
        end
    end
elseif (choice == 1) % trudniej, szybciej ----------------------------------------
    U=A; L=eye(N);
    for i=1:N-1
        for j=i+1:N
            L(j,i) = U(j,i) / U(i,i);
            U(j,i:N) = U(j,i:N) - L(j,i)*U(i,i:N);
        end
    end
end
disp(L);
disp(U);

[X, Y] = lu(A)
end