import script

t = (22, 22, 22, 22)
p = (0, 141.6*10**5, 0, 0)
p_end = (0, (8.5*10**5), 0, 0)

(a, b, c) = script.calc_HPA(t, p, p_end)

print(a)
print(b)
print(c)
