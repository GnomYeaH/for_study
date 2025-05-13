import math # Загрузка библиотеки math
import  pandas as pd # Загрузка библиотеки для записи в Exel
import os # Загрузка библиотеки
import matplotlib.pyplot as plt # Загрущка библиотеки для графиков
global alpha0, beta0, alpha1, beta1, h, C0, d0, n
os.chdir("C:/Users/gagan/Desktop") # Путь загрузки\выгрузки файла


# Создание файла вывода
fyle_name = "ИДЗ1 Задача№2 ПС2-51 Новоджунов С.Д.xlsx"
fyle_out = pd.DataFrame()
fyle_out.to_excel(fyle_name, index=False)

# Постоянные коэффициенты
alpha0 = 1
beta0 = 1
alpha1 = 0
beta1 = 0

# Ввод данных
a = 1.0
b = 2.0
n = 10

x0 = int(a)
y0 = 2
xn = int(b)
yn = -2

h = (b - a) / n

# Изменяемые Функции

def p_(x):
    return -x

def f_(x):
    return  (-3) * pow(x, 3)

def m_(x):
    return  -2 -x*h

def n_(x):
    return  1 + x*h

# Неизменяемые функции
def Ci_(x, i):
    if i == 0:
        return 1 / ( m_(x) - n_(x) * C0)
    else:
        return 1 / ( m_(x) - n_(x) * Ci_(x, i-1))

def di_(x, i):
    if i == 0:
        return (f_(x) * pow(h, 2) - n_(x) * C0 * d0)
    else:
        return (f_(x) * pow(h, 2) - n_(x) * Ci_(x, i-1) * di_(x, i-1))

# Посчитанные коэффициенты

A = alpha0 * y0
B = beta0 * yn

C0 = (-alpha0 * h) / ( m_(x0) * (-alpha0*h) )
d0 = ( (n_(x0) * A * h) / (-alpha0*h) ) + f_(x0) * pow(h, 2)

# Метод прогонки
spisok_i = list()
spisok_Ci = list()
spisok_di = list()
spisok_xi = list()
spisok_yi = [f"{y0}.0000"]
for i in range(n + 1):
    spisok_i.append(i)
    x = x0 + i * h
    spisok_xi.append(round(x, 1))
    Ci = Ci_(x, i)
    di = di_(x, i)
    spisok_Ci.append(round(Ci, 4))
    spisok_di.append(round(di, 4))
    if i == n-1:
        spisok_yi.append(f"{yn}.0000")
    else:
        if i != n:
            spisok_yi.append(0)

for i in range(n-1, -1, -1):
    if i != 0:
        spisok_yi[i] = round(spisok_Ci[i-1] * (spisok_di[i-1] - float(spisok_yi[i+1])), 4)

# Формирование фрейма вывода
data_otvet = {
    "i": spisok_i,
    "Ci": spisok_Ci,
    "di": spisok_di,
    "Xi": spisok_xi,
    "Yi": spisok_yi
}
df_otvet = pd.DataFrame(data_otvet)


# Запись в выходной файл (Exel)
title_name = "ПС2-51 Новоджунов С.Д" # Название для листа в Exel
with pd.ExcelWriter(fyle_name) as writer:
    df_otvet.to_excel(writer, sheet_name=title_name, index=False)

# Создание графика решения
plt.plot(spisok_xi, spisok_yi, 'b-', label='y(x)')
plt.xlabel('x')
plt.ylabel('y')
plt.title('Решение краевой задачи')
plt.grid(True)
plt.legend()
plt.show()