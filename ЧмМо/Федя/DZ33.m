% Параметры варианта 2
A = 20; B = 60; C = 30;
alpha_val = 3; beta = 1; gamma = 2; delta = 162; % Переименовано alpha, чтобы избежать конфликта с функцией alpha()

% Целевая функция (минимизация отрицательного объема)
objective = @(x) -x(1)*x(2)*x(3);

% Начальное предположение
x0 = [A/2, B/2, C/2];

% Линейные ограничения A*x <= b
A_matrix = [1, 0, 0;     % x1 <= A
            0, 1, 0;     % x2 <= B
            0, 0, 1;     % x3 <= C
            alpha_val, beta, gamma]; 
b_vector = [A; B; C; delta];

% Нижние границы
lb = [0, 0, 0];

% Настройки оптимизации
options = optimoptions('fmincon', 'Algorithm', 'sqp', 'Display', 'iter');

% Запуск оптимизации
[x_opt, fval] = fmincon(objective, x0, A_matrix, b_vector, [], [], lb, [], [], options);

% Вывод результатов
fprintf('Оптимальные размеры:\nx1 = %.2f\nx2 = %.2f\nx3 = %.2f\n', x_opt);
fprintf('Объем: %.2f\n', -fval);
fprintf('Проверка ограничений:\n');
fprintf('3*x1 + x2 + 2*x3 = %.2f <= 162\n', alpha_val*x_opt(1) + beta*x_opt(2) + gamma*x_opt(3));