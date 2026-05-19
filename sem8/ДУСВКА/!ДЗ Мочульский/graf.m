clc;
clear variables;
close all;

obshiu = 0:0.001:2;

Nogg = 369 * 10^6 *(1-(obshiu.^-0.231));
Nvgg = 122 * 10^6 *(1-(obshiu.^-0.231));
NH   = (1.38*10^6)*obshiu + 0.525 * 10^6;

figure(1);

grid on
% grid minor
hold on

xlabel("π_T");
ylabel("N");


% plot(obshiu_intr,Usin_intr);

plot(obshiu, Nogg);
plot(obshiu, Nvgg);
plot(obshiu, NH);

legend('N_о_г_г','N_в_г_г', 'N_н')

xlim([1 1.15]);
ylim([0 5*10^6]);