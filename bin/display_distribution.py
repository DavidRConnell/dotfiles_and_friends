import matplotlib.pyplot as plt
import fileinput

x = []
for line in fileinput.input():
    x.append(float(line))

plt.hist(x)
plt.show()
