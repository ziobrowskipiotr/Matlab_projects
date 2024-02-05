clear all; close all; clc;

% f(x) = 1/(x^4 + 1)
X = [-21 : 0.9 : 21];
Y = zeros(4*(size(X, 2)-1), 1);
for g = 1:size(X, 2)
    Y(g, 1) = 1/(X(g).^4 + 1);
end