
clc; clear all;

% Параметры 
alpha = 66;
beta = 69;
gamma = 11;
x0 = [-64; -6; -5]; 
epsilon = 0.05;      
lambda = 1e-8;      

% Определение функции
f = @(x) (x(1) + alpha + x(2))^4 + (x(1) + beta + x(3))^2 + (x(2) + gamma + x(3))^4;

% Градиент функции (проверено)
grad_f = @(x) [
    4*(x(1) + alpha + x(2))^3 + 2*(x(1) + beta + x(3));
    4*(x(1) + alpha + x(2))^3 + 4*(x(2) + gamma + x(3))^3;
    2*(x(1) + beta + x(3)) + 4*(x(2) + gamma + x(3))^3
];

% Гессиан функции (исправлен!)
hessian_f = @(x) [
    12*(x(1)+alpha+x(2))^2 + 2,   12*(x(1)+alpha+x(2))^2,              2;
    12*(x(1)+alpha+x(2))^2,       12*(x(1)+alpha+x(2))^2 + 12*(x(2)+gamma+x(3))^2,  12*(x(2)+gamma+x(3))^2;
    2,                             12*(x(2)+gamma+x(3))^2,              12*(x(2)+gamma+x(3))^2 + 2
] + lambda * eye(3); % Регуляризация

% Инициализация
x = x0;
iteration = 0;
grad_norm = inf(3, 1);

% Вывод таблицы
fprintf('| Итерация |   x1      |   x2      |   x3      |   df/dx1  |   df/dx2  |   df/dx3  |\n');
fprintf('|----------|-----------|-----------|-----------|-----------|-----------|-----------|\n');

% Основной цикл
while max(abs(grad_norm)) > epsilon
    grad = grad_f(x);
    H = hessian_f(x);
    grad_norm = abs(grad);
    
    fprintf('| %-8d | %-9.3f | %-9.3f | %-9.3f | %-9.3f | %-9.3f | %-9.3f |\n', ...
            iteration, x(1), x(2), x(3), grad(1), grad(2), grad(3));
    
    % Обновление точки с проверкой на сингулярность
    delta_x = H \ (-grad); 
    x = x + delta_x;       
    iteration = iteration + 1;
end

% Финальный вывод
fprintf('\nУсловие остановки достигнуто на итерации %d\n', iteration-1);
fprintf('Точка минимума: x1 = %.3f, x2 = %.3f, x3 = %.3f\n', x(1), x(2), x(3));
fprintf('Значение функции: f ≈ %.2e\n', f(x));