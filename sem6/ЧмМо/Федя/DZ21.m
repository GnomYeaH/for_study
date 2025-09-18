
alpha = 34; beta = 11; gamma = 14; delta = 1;
x1 = 5; x2 = 36;
eta = 0.0001; tolerance = 0.05; max_iter = 100000;

% Инициализация истории
history.x1 = [x1];
history.x2 = [x2];
history.grad1 = [];
history.grad2 = [];
history.f = [];

iter = 0;
while iter < max_iter
    % Вычисление градиента и функции
    df_dx1 = -136 * x1 * (x2 + beta - x1^2) - 2*(gamma - x1) + 2*delta*x1;
    df_dx2 = 68 * (x2 + beta - x1^2);
    f = alpha*(x2 + beta - x1^2)^2 + (gamma - x1)^2 + delta*x1^2;
    
    % Сохранение данных
    history.grad1(end+1) = df_dx1;
    history.grad2(end+1) = df_dx2;
    history.f(end+1) = f;
    
    % Проверка условия останова
    if abs(df_dx1) <= tolerance && abs(df_dx2) <= tolerance
        break;
    end
    
    % Обновление параметров
    x1 = x1 - eta * df_dx1;
    x2 = x2 - eta * df_dx2;
    history.x1(end+1) = x1;
    history.x2(end+1) = x2;
    
    iter = iter + 1;
end

% Графики
figure;
subplot(2,2,1);
plot(1:iter+1, history.x1, 'b-', 'LineWidth', 1.5);
hold on;
plot(1:iter+1, history.x2, 'r-', 'LineWidth', 1.5);
title('Изменение x₁ и x₂');
legend('x₁', 'x₂');

subplot(2,2,2);
plot(history.grad1, 'b-', 'LineWidth', 1.5);
hold on;
plot(history.grad2, 'r-', 'LineWidth', 1.5);
title('Градиенты');
legend('df/dx₁', 'df/dx₂');

subplot(2,2,3);
plot(history.f, 'k-', 'LineWidth', 1.5);
title('Значение функции f(x)');

% Таблица
fprintf('Итерация\t x₁\t\t x₂\t\t df/dx₁\t\t df/dx₂\t\t f(x)\n');
for i = 1:iter
    fprintf('%d\t\t %.4f\t %.4f\t %.4f\t %.4f\t %.4f\n', ...
        i, history.x1(i), history.x2(i), history.grad1(i), history.grad2(i), history.f(i));
end