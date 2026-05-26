clc;
clear variables;
close all;

tochn = [400 500 1000 1500 2000 2500 2800];
grubiy = [1200 1400 1600 1800 2000];

z_1 = [0 30 60 90 120 150 170];
z_2 = [170 150 90 40 30];

figure(1);

grid on
hold on

title("График модуляции характеристики АМЦ(точный отсчет)");
xlabel("t, мкс)");
ylabel("Изменения зазора ""Z"", мкм");

plot(tochn, z_1);

figure(2);

grid on
hold on

title("График модуляции характеристики АМЦ(грубый отсчет)");
xlabel("t, мкс)");
ylabel("Изменения зазора ""Z"", мкм");

plot(grubiy, z_2);


