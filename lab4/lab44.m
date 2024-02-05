clear all; close all; clc;
A = [1, 2;
     3, 4];
A_z_szumem = A + 0.01*randn(size(A));
b = [5; 11];
D = [1, 2, 3; 
     4, 5, 6; 
     7, 8, 8];
D_z_szumem = D + 0.01*randn(size(D));

disp("1 część zadania. Wartości stałe, wyznacznik różny od 0.")
x1 = inv(A) * b,
x2 = A \ b,
x3 = pinv(A) * b,
b1 = A * x1,
b2 = A * x3,
err1 = max(abs(x1 - x2)),
err2 = max(abs(x1 - x3)),

disp("2 część zadania. Zmienne wartości i wyznacznik różny od 0.")
x11 = inv(A_z_szumem) * b,
x22 = A_z_szumem \ b,
x33 = pinv(A_z_szumem) * b,
b11 = A_z_szumem * x11,
b22 = A_z_szumem * x33,
err11 = max(abs(x11 - x22)),
err22 = max(abs(x11 - x33)),

disp("3 część zadania. Zmienne wartości i wyznacznik bliski zeru.")
C = [1, 2; 2, 4];
C_z_szumem = C + 0.01*randn(size(C));
x111 = inv(C_z_szumem) * b,
x222 = C_z_szumem \ b,
x333 = pinv(C_z_szumem) * b,
b111 = C_z_szumem * x111,
b222 = C_z_szumem * x333,
err111 = max(abs(x111 - x222)),
err222 = max(abs(x111 - x333)),

%trzeba zdefiniować nowe b (3 wierszowe)
b = [5; 11; 32];

disp("4 część zadania. Wartości stałe, wyznacznik różny od 0. Rząd 3")
x_1 = inv(D) * b,
x_2 = D \ b,
x_3 = pinv(D) * b,
b_1 = D * x_1,
b_2 = D * x_3,
err_1 = max(abs(x_1 - x_2)),
err_2 = max(abs(x_1 - x_3)),

disp("5 część zadania. Zmienne wartości i wyznacznik różny od 0. Rząd 3.")
x_11 = inv(D_z_szumem) * b,
x_22 = D_z_szumem \ b,
x_33 = pinv(D_z_szumem) * b,
b_11 = D_z_szumem * x_11,
b_22 = D_z_szumem * x_33,
err_11 = max(abs(x_11 - x_22)),
err_22 = max(abs(x_11 - x_33)),

disp("6 część zadania. Zmienne wartości i wyznacznik bliski zeru. Rząd 3.")
E = [1, 2, 3; 
     4, 5, 6; 
     7, 8, 9];
E_z_szumem = E + 0.01*randn(size(E));
x_111 = inv(E_z_szumem) * b,
x_222 = E_z_szumem \ b,
x_333 = pinv(E_z_szumem) * b,
b_111 = E_z_szumem * x_111,
b_222 = E_z_szumem * x_333,
err_111 = max(abs(x_111 - x_222)),
err_222 = max(abs(x_111 - x_333)),