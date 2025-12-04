clc; clear variables; close all;

r = 0.02:0.001:0.04;
T = zeros(1, length(r));
q = zeros(1, length(r));

r1 = 0.02;
r2 = 0.028;
r3 = 0.038;
r4 = 0.04;

qv1 = 10^7;
lam1 = 15;
lam2 = 3;
lam3 = 80;
alpha = 100;
tzh2 = 20 + 273;

C1 = -397.183;
C2 = 2485;
C3 = -3293;
C4 = -7999;
C5 = -123.472;
C6 = 2365;

for i = 1:length(r)

    if all(r(i) <= r2, r(i) >= r1)

        T(i) = -(qv1*r(i)^2)/(4*lam1) + C1*log(r(i)) + C2;

    end

    if  and((r(i) < r3), (r(i) > r2))

        T(i) = C3*log(r(i)) + C4;

    end
    
    if all(r(i) >= r3, r(i) <= r4)

        T(i) = C5*log(r(i)) + C6;

    end

    
end

qst2 = -lam2 * (C3/r2) * (2* pi * r2);
qst3 = -lam2 * (C5/r3) * (2* pi * r3);
qst4 = -lam3 * (C5/r4) * (2* pi * r4);

disp(qst2)
disp(qst3)
disp(qst4)

% for i = 1:length(r)

%     if r(i) <= r2
    
%         q(i) = -lam1 * (-qv1*r(i))/(2*lam1) + C2/r(i);
    
%     end
%     if r(i) >= r3

%         q(i) = -lam2 * (C3/r(i));

%     end
%     if  and((r(i) < r3), (r(i) > r2))

%         q(i) = -lam3 * (C5/r(i));

%     end

% end


figure(1)

title('Функция температурного поля')
ylabel("T(r)");
xlabel("r");

grid on
grid minor
hold on


xlim([0.015 0.05])
plot(r, T)


% figure(2)

% title('Функция плотности теплового потока')
% ylabel("T(r)");
% xlabel("r");

% xlim([0.015 0.05])

% grid on
% grid minor
% hold on

% plot(r, q)