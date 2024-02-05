clear all, close all, clc
X = zeros(100, 2);
for i = 1:size(X, 1)
    X(i, 1) = i;
    X(i, 2) = 1;
end
Y = zeros(size(X, 1), 1);
for i = 1:size(X, 1)
    Y(i, 1) = 2*X(i, 1) + 5;
end
Xt = transpose(X);
W = (Xt*X)\Xt*Y
W_rounded = round(W);
disp(W_rounded)