clc
close all
clear all
nazvanie_fyle_SIMULINK = "lab_otu_observer2022";
K_ysil = 100; % Ysilenie
NUL = 1; % Nuli
POL = [-3 -4 -5 -6]; % Polusa

% 1.2
W_RAZOMKNUT = zpk(NUL,POL,K_ysil);
ss_W_minimal = ss(W_RAZOMKNUT, 'minimal');
A = ss_W_minimal.A;
B = ss_W_minimal.B;
C = ss_W_minimal.C;
D = ss_W_minimal.D;

% Grafik k 1.2
t = 5;
figure('Name','Разомкнутый переходной процесс','NumberTitle','off');
step(W_RAZOMKNUT, t);
plot_1 = gca;
plot_1.Color="#FFFFFF";
title("Разомкнутая система");
xlabel("Время");
ylabel("Амлитуда");
grid on;
grid minor;

%________________________________________________________________________________________________________________________________
% 2.2
T = 0.01;           % Period diskretizacii
cov_Input = 1e-6;   % Dispersiya vhod shym
cov_Output = 1e-6;  % Dispersiya izmerit shym

% Parametri BLOCK
set_param('lab_otu_observer2022/Step',  'SampleTime', num2str(T), 'Time', num2str(1.0), 'Before', num2str(0.0), 'After', num2str(1.0));
set_param('lab_otu_observer2022/Входной шум', 'Ts', num2str(T), 'Cov', num2str(cov_Input));
set_param('lab_otu_observer2022/Измерительный шум', 'Ts', num2str(T), 'Cov', num2str(cov_Output));

% Parametri MATRIX
set_param('lab_otu_observer2022/A/Constant', 'Value', mat2str(A));
set_param('lab_otu_observer2022/B/Constant', 'Value', mat2str(B));
set_param('lab_otu_observer2022/C/Constant', 'Value', mat2str(C));
set_param('lab_otu_observer2022/D/Constant', 'Value', mat2str(D));

% MODAL YPRAV + 2.3
p = [-9, -6, -7, -8];
F = place(A, B, p); % Ypravlenie
set_param('lab_otu_observer2022/F/Constant', 'Value', mat2str(F));
transpose(C)
transpose(A)% WHY????
L = transpose(place(transpose(A), transpose(C), p)); % Наблюдательatal
set_param('lab_otu_observer2022/L/Constant', 'Value', mat2str(L));

%________________________________________________________________________________________________________________________________
% 3.1
DATA = sim('lab_otu_observer2022');
t = DATA.tout();
Y = DATA.yout{1}.Values.Data; % Вектор выхода SystemSostoyaniya
X = DATA.yout{2}.Values.Data; % Вектор состояния
Y_est = DATA.yout{3}.Values.Data; % Оценка Вектор выхода System ot Наблюдательatel
X_est = DATA.yout{4}.Values.Data; % Оценка Вектор состояния ot Наблюдательatel
Y_err = DATA.yout{5}.Values.Data; % Разница m/y Вектор выхода System AND Vector Наблюдательydatel

% Grafiki k 3.1
% Вектор состояния
figure('Name','Вектор состояния','NumberTitle','off');
subplot(2,1,1);
plot(t, X);
plot_1 = gca;
plot_1.Color="#FFFFFF";
title("Вектор состояния");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Реальность', 'x2 Реальность', 'x3 Реальность', 'x4 Реальность');
grid on;
grid minor;

subplot(2,1,2);
plot(t, X_est);
plot_2 = gca;
plot_2.Color="#FFFFFF";
title("Оценка вектора состояня");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель');
grid on;
grid minor;

% Выход + (Разница = OSHIBKA)
figure('Name','Выход + Разница','NumberTitle','off');
subplot(3,1,1);
plot(t, Y);
plot_1 = gca;
plot_1.Color="#FFFFFF";
title("Выход системы");
xlabel("Время, c");
ylabel("Вектор выхода");
legend('y1 Реальность', 'y2 Реальность', 'y3 Реальность', 'y4 Реальность');
grid on;
grid minor;

subplot(3,1,2);
plot(t, Y_est);
plot_2 = gca;
plot_2.Color="#FFFFFF";
title("Оценка выхода системы");
xlabel("Время, c");
ylabel("Вектор выхода");
legend('y1 Наблюдатель', 'y2 Наблюдатель', 'y3 Наблюдатель', 'y4 Наблюдатель');
grid on;
grid minor;

subplot(3,1,3);
plot(t, Y_err);
plot_3 = gca;
plot_3.Color="#FFFFFF";
title("Ошибка выхода системы");
xlabel("Время, c");
ylabel("Вектор выхода");
legend('y1 Ошибка', 'y2 Ошибка', 'y3 Ошибка', 'y4 Ошибка');
grid on;
grid minor;

% Интегралы нормированных ошибок
ERROR = X - X_est; % Oshibka ocenki
% vecnorm(matrix,p, dim)=> dim: 1-po stolb, 2-po strok, p:type norm?
NORM_ERROR = vecnorm(ERROR) / length(t);
figure('Name','Интегралы нормированных ошибок','NumberTitle','off');
bar(NORM_ERROR);
grid on;
grid minor;
title('Интегралы нормированных ошибок');
xlabel('Элемент вектора состояния');
ylabel('Ошибка');
plot_1 = gca;
plot_1.Color="#FFFFFF";
set(gca, 'XTickLabel', {'x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель'});

%________________________________________________________________________________________________________________________________
% 3.3

% 0.2P
L = transpose(place(transpose(A), transpose(C), 0.2*p)); % Наблюдательatal
set_param('lab_otu_observer2022/L/Constant', 'Value', mat2str(L));
DATA = sim('lab_otu_observer2022');
t = DATA.tout();
Y = DATA.yout{1}.Values.Data; % Вектор выхода SystemSostoyaniya
X = DATA.yout{2}.Values.Data; % Вектор состояния
Y_est = DATA.yout{3}.Values.Data; % Оценка Вектор выхода System ot Наблюдательatel
X_est = DATA.yout{4}.Values.Data; % Оценка Вектор состояния ot Наблюдательatel
Y_err = DATA.yout{5}.Values.Data; % Разница m/y Вектор выхода System AND Vector Наблюдательydatel
ERROR = X - X_est; % Oshibka ocenki
NORM_ERROR = vecnorm(ERROR) / length(t);
% Grafik k 0.2p
% Вектор состояния
figure('Name','Вектор состояния pri 0.2p','NumberTitle','off');
subplot(2,1,1);
plot(t, X);
plot_1 = gca;
plot_1.Color="#FFFFFF";
title("Правильный Вектор состояния pri 0.2p");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Реальность', 'x2 Реальность', 'x3 Реальность', 'x4 Реальность');
grid on;
grid minor;

subplot(2,1,2);
plot(t, X_est);
plot_2 = gca;
plot_2.Color="#FFFFFF";
title("Оценка вектора состояния pri 0.2p");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель');
grid on;
grid minor;

figure('Name','Интегралы нормированных ошибок 0.2p','NumberTitle','off');
bar(NORM_ERROR);
grid on;
grid minor;
title('Интегралы нормированных ошибок pri 0.2p');
xlabel('Элемент ветктора состояния');
ylabel('Error');
plot_1 = gca;
plot_1.Color="#FFFFFF";
set(gca, 'XTickLabel', {'x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель'});

% 2P
L = transpose(place(transpose(A), transpose(C), 2*p)); % Наблюдательatal
set_param('lab_otu_observer2022/L/Constant', 'Value', mat2str(L));
DATA = sim('lab_otu_observer2022');
t = DATA.tout();
Y = DATA.yout{1}.Values.Data; % Вектор выхода SystemSostoyaniya
X = DATA.yout{2}.Values.Data; % Вектор состояния
Y_est = DATA.yout{3}.Values.Data; % Оценка Вектор выхода System ot Наблюдательatel
X_est = DATA.yout{4}.Values.Data; % Оценка Вектор состояния ot Наблюдательatel
Y_err = DATA.yout{5}.Values.Data; % Разница m/y Вектор выхода System AND Vector Наблюдательydatel
ERROR = X - X_est; % Oshibka ocenki
NORM_ERROR = vecnorm(ERROR) / length(t);
% Grafik k 2p
% Вектор состояния
figure('Name','Вектор состояния pri 2p','NumberTitle','off');
subplot(2,1,1);
plot(t, X);
plot_1 = gca;
plot_1.Color="#FFFFFF";
title("Правильный Вектор состояния pri 2p");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Реальность', 'x2 Реальность', 'x3 Реальность', 'x4 Реальность');
grid on;
grid minor;

subplot(2,1,2);
plot(t, X_est);
plot_2 = gca;
plot_2.Color="#FFFFFF";
title("Оценка вектора состояня pri 2p");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель');
grid on;
grid minor;
figure('Name','Интегралы нормированных ошибок 2p','NumberTitle','off');
bar(NORM_ERROR);
grid on;
grid minor;
title('Интегралы нормированных ошибок pri 2p');
xlabel('Элемент ветктора состояния');
ylabel('Error');
plot_1 = gca;
plot_1.Color="#FFFFFF";
set(gca, 'XTickLabel', {'x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель'});

%________________________________________________________________________________________________________________________________
% 3.4
L = transpose(place(transpose(A), transpose(C), p)); % Наблюдательatal
set_param('lab_otu_observer2022/L/Constant', 'Value', mat2str(L));

% 1e-3, 1e-6
cov_Input = 1e-3; % Dispersiya vhod shym
cov_Output = 1e-6; % Dispersiya izmerit shym
% Parametri BLOCK
set_param('lab_otu_observer2022/Входной шум', 'Ts', num2str(T), 'Cov', num2str(cov_Input));
set_param('lab_otu_observer2022/Измерительный шум', 'Ts', num2str(T), 'Cov', num2str(cov_Output));
DATA = sim('lab_otu_observer2022');
t = DATA.tout();
Y = DATA.yout{1}.Values.Data; % Вектор выхода SystemSostoyaniya
X = DATA.yout{2}.Values.Data; % Вектор состояния
Y_est = DATA.yout{3}.Values.Data; % Оценка Вектор выхода System ot Наблюдательatel
X_est = DATA.yout{4}.Values.Data; % Оценка Вектор состояния ot Наблюдательatel
Y_err = DATA.yout{5}.Values.Data; % Разница m/y Вектор выхода System AND Vector Наблюдательydatel
ERROR = X - X_est; % Oshibka ocenki
NORM_ERROR = vecnorm(ERROR) / length(t);
% Grafik 1e-3, 1e-6
% Вектор состояния
figure('Name','Вектор состояния pri covInput = 1e-3, covOutput = 1e-6','NumberTitle','off');
subplot(2,1,1);
plot(t, X);
plot_1 = gca;
plot_1.Color="#FFFFFF";
title("Правильный Вектор состояния pri covInput = 1e-3, covOutput = 1e-6");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Реальность', 'x2 Реальность', 'x3 Реальность', 'x4 Реальность');
grid on;
grid minor;

subplot(2,1,2);
plot(t, X_est);
plot_2 = gca;
plot_2.Color="#FFFFFF";
title("Оценка вектора состояня pri covInput = 1e-3, covOutput = 1e-6");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель');
grid on;
grid minor;

figure('Name','Интегралы нормированных ошибок cov_Input = 1e-3','NumberTitle','off');
bar(NORM_ERROR);
grid on;
grid minor;
title('Интегралы нормированных ошибок pri covInput = 1e-3, covOutput = 1e-6');
xlabel('Элемент ветктора состояния');
ylabel('Error');
plot_1 = gca;
plot_1.Color="#FFFFFF";
set(gca, 'XTickLabel', {'x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель'});

% 1e-6, 1e-5
cov_Input = 1e-6; % Dispersiya vhod shym
cov_Output = 1e-5; % Dispersiya izmerit shym
% Parametri BLOCK
set_param('lab_otu_observer2022/Входной шум', 'Ts', num2str(T), 'Cov', num2str(cov_Input));
set_param('lab_otu_observer2022/Измерительный шум', 'Ts', num2str(T), 'Cov', num2str(cov_Output));
DATA = sim('lab_otu_observer2022');
t = DATA.tout();
Y = DATA.yout{1}.Values.Data; % Вектор выхода SystemSostoyaniya
X = DATA.yout{2}.Values.Data; % Вектор состояния
Y_est = DATA.yout{3}.Values.Data; % Оценка Вектор выхода System ot Наблюдательatel
X_est = DATA.yout{4}.Values.Data; % Оценка Вектор состояния ot Наблюдательatel
Y_err = DATA.yout{5}.Values.Data; % Разница m/y Вектор выхода System AND Vector Наблюдательydatel
ERROR = X - X_est; % Oshibka ocenki
NORM_ERROR = vecnorm(ERROR) / length(t);
% Grafik 1e-6, 1e-5
% Вектор состояния
figure('Name','Вектор состояния pri covInput = 1e-6, covOutput = 1e-5','NumberTitle','off');
subplot(2,1,1);
plot(t, X);
plot_1 = gca;
plot_1.Color="#FFFFFF";
title("Правильный Вектор состояния pri covInput = 1e-6, covOutput = 1e-5");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Реальность', 'x2 Реальность', 'x3 Реальность', 'x4 Реальность');
grid on;
grid minor;

subplot(2,1,2);
plot(t, X_est);
plot_2 = gca;
plot_2.Color="#FFFFFF";
title("Оценка вектора состояня pri covInput = 1e-6, covOutput = 1e-5");
xlabel("Время, c");
ylabel("Вектор состояния");
legend('x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель');
grid on;
grid minor;

figure('Name','Интегралы нормированных ошибок cov_Output = 1e-5','NumberTitle','off');
bar(NORM_ERROR);
grid on;
grid minor;
title('Интегралы нормированных ошибок pri covInput = 1e-6, covOutput = 1e-5');
xlabel('Элемент ветктора состояния');
ylabel('Error');
plot_1 = gca;
plot_1.Color="#FFFFFF";
set(gca, 'XTickLabel', {'x1 Наблюдатель', 'x2 Наблюдатель', 'x3 Наблюдатель', 'x4 Наблюдатель'});
