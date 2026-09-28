clc;
clear variables;
close all;

C = [0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18];        % X
I_0 = [10.67 8.67 8.8 9 16 26.67 36.67 56.67 83.33 126.67]; % Y

d_X = [-20 -15 -10 -5 0 5 10 15 20];
d_U1 = [0 0.1 0 0 0 -0.1 -0.2 -0.3 -0.4];

d_Y = [-20 -15 -10 -5 0 5 10 15 20];
d_U2 = [0.11 0.07 0.05 0.03 0 0 0 0 -0.1];

figure(1);

grid on
hold on

title("Снятие зависимости тока I_0 от величины настроечной емкости С");
xlabel("C, мкф)");
ylabel("I_0, мА");

plot(C, I_0);

figure(2);

grid on
hold on

title("Определение зависимости ∆X=f(∆U_x)");
xlabel("∆X, мкм)");
ylabel("∆U_x, В");

plot(d_X, d_U1);

figure(3);

grid on
hold on

title("Определение зависимости ∆Y=f(∆U_x)");
xlabel("t, мкс)");
ylabel("∆U_x, В");

plot(d_Y, d_U2);