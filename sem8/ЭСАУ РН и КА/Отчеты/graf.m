clc;
clear variables;
close all;

Mi_1 = [1.8 2.5 4.25 6  7.5];
Iy_1 = [10  25  50   75 100];

Mi_2  = [6.1 6.4 6.6 6.85 7.1 7.25 7.35 7.25 7.1 6.85 6.65 6.4 6.05];
beta    = -12:2:12


figure(1);

grid on
hold on

xlabel("β (градусы)");
ylabel("I_э (мА)");

plot(Iy_1, Mi_1);

legend('M_и=f(I_y)')


figure(2);

grid on
hold on

xlabel("β (градус)");
ylabel("I_э (мА)");

plot(beta, Mi_2);

legend('M=f(β)')