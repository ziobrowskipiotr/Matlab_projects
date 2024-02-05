clear all; close all; clc;

A = [4, 0.5;
     0.5, 1];
[N, N] = size(A);% wybor/definicja symetrycznej macierzy kwadratowej
x = ones(N,1);
for i = 1:20
    y = A*x;
    ymax = 0;
    if max(abs(y)) > ymax
        ymax = max(abs(y));
        imax = i;
        x = y/ymax;
        lambda = ymax;
    end
end
x, lambda,
[ V, D ] = eig(A)