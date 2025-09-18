clc;
clear all;
close all;

% Функция для метода стрельбы
function dy = shooting_ode(x, y)
    dy = [y(2); (x^2 - x*y(2) + y(1)) / x^2];
end

% Функция для метода Ньютона (подбор y'(1))
function error = shooting_error(y_prime_guess)
    [~, Y] = ode45(@shooting_ode, [1, 3], [4/3; y_prime_guess]);
    error = Y(end, 1) - 3; % y(3) = 3
end

% Подбор y'(1) с помощью fzero
y_prime_initial_guess = 0;
y_prime_solution = fzero(@shooting_error, y_prime_initial_guess);

% Решение с найденным y'(1)
[x, Y] = ode45(@shooting_ode, [1, 3], [4/3; y_prime_solution]);

% Вывод полной таблицы
disp('Метод стрельбы - полная таблица точек:');
disp('    x        y(x)');
disp([x, Y(:,1)]);

% Вывод значений в ключевых точках
x_output = [1, 1.5, 2, 2.5, 3];
y_output = interp1(x, Y(:,1), x_output, 'spline');
disp('Значения в ключевых точках:');
disp('    x        y(x)');
disp([x_output', y_output']);

% Проверка краевых условий
fprintf('\nПроверка краевых условий:\n');
fprintf('y(1) = %.6f (должно быть %.6f)\n', Y(1,1), 4/3);
fprintf('y(3) = %.6f (должно быть %.6f)\n', Y(end,1), 3);

% График
plot(x, Y(:,1), 'LineWidth', 2);
xlabel('x'); ylabel('y');
title('Метод стрельбы: x^2y'''' + xy'' - y = x^2');
grid on;