clc; clear all; close all; 

% Параметры

N = 100; 	% Число узлов
x = linspace(1, 3, N)';
h = x(2) - x(1);

% Матрицы для разностной схемы
A = zeros(N, N);
b = zeros(N, 1);

% Заполнение матрицы A и вектора b
for i = 2:N-1
    A(i, i-1) = x(i)^2 / h^2 - x(i) / (2*h);
    A(i, i)   = -2*x(i)^2 / h^2 - 1;
    A(i, i+1) = x(i)^2 / h^2 + x(i) / (2*h);
    b(i) = x(i)^2;
end

% Граничные условия
A(1, 1) = 1; b(1) = 4/3;
A(N, N) = 1; b(N) = 3;

% Решение системы
y = A \ b;

% Вывод значений в заданных точках
x_output = [1, 1.5, 2, 2.5, 3];
y_output = interp1(x, y, x_output, 'spline');

disp('Метод прогонки:');
disp('x      y(x)');
disp([x_output', y_output']);

% Проверка краевых условий
fprintf('\nПроверка краевых условий:\n');
fprintf('y(1) = %.6f (должно быть %.6f)\n', y(1), 4/3);
fprintf('y(3) = %.6f (должно быть %.6f)\n', y(end), 3);

% График
plot(x, y, 'LineWidth', 2);
xlabel('x'); ylabel('y');
title('Метод прогонки: x^2y'''' + xy'' - y = x^2');
grid on;
