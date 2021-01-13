import matplotlib.pyplot as plt
import fileinput

a = []
b = []
for f in fileinput.input():
    vals = f.split(',')
    a.append(float(vals[0]))
    b.append(float(vals[1]))

plt.plot(a, b, '.')
plt.show()
