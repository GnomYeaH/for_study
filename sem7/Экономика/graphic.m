clc; clear variables; close all;

x = 0:1:30;
Qd = zeros(1, length(x));
Qs = zeros(1, length(x));

Qd1 = zeros(1, length(x));
Qs1 = zeros(1, length(x));

for i = 1:length(x)

    Qd(i) = 70 - 2*x(i);
    Qs(i) = 10 + x(i);

end

for i = 1:length(x)

    Qd1(i) = 52 - 2*x(i);
    Qs1(i) = 10 + x(i);

end


figure(1)

title('Равновесное состояние спроса и предложения до налога')
xlabel("Кол-во");
ylabel("Цена");

grid on
% grid minor
hold on

ylim([0 50])
xlim([0 50])

plot(Qd, x)
plot(Qs, x)


figure(2)

title('Равновесное состояние спроса и предложения после налога')
xlabel("Кол-во");
ylabel("Цена");

ylim([0 50])
xlim([0 50])

grid on
% grid minor
hold on

plot(Qd1, x)
plot(Qs1, x)