clear all;
close all;
N = 2^12; % ilosc probek 
[canary, canary_fpr] = audioread('MOSQUITO.WAV', [1, N]);
[elephant, elephant_fpr] = audioread('elephnt.wav', [1, N]);
% wykres dzwieku zwierzat w czasie
figure; plot(canary); title('canary');
figure; plot(elephant); title('elephant');
% nałożenie ścieżek dźwiękowych
canary_and_elephant = canary + elephant;
% teraz robie widma czestotliwosciowe
n=0:N-1; k=0:N-1;
A = sqrt(2/N)*cos( pi/N *(k'*n));
canary_freq_spectrum = A * canary;
elephant_freq_spectrum = A * elephant;
figure; plot(canary_freq_spectrum); title('Canary freq spec');
figure; plot(elephant_freq_spectrum); title('Elephant freq spec');
% widmo czestotliwosciowe laczonej sciezki dzwiekowej
can_ele_fs = A * canary_and_elephant;
figure; plot(can_ele_fs); title('canary + elephant freq spec');
% odejmuje od laczonego widma, widmo slonia
back_canary_fs = can_ele_fs - elephant_freq_spectrum;
figure; plot(back_canary_fs); title('back canary fs');
% zmieniam widmo spowrotem na sciezke dzwiekową
back_canary = A^-1 * back_canary_fs;
figure; plot(back_canary); title('back canary');