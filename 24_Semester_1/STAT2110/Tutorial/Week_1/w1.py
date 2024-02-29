import numpy as np
import scipy as sp
import matplotlib.pyplot as plt

# NumPy: Creating and manipulating arrays
arr = np.array([1, 2, 3, 4, 5])
print("NumPy array:", arr)
print("Sum of elements:", np.sum(arr))

# SciPy: Using a simple mathematical function
result = sp.special.gamma(5)  # Gamma function example
print("SciPy result (Gamma function of 5):", result)

# Create a simple line plot
x = [1, 2, 3, 4]
y = [2, 4, 5, 4]

plt.plot(x, y)

# Add labels and title
plt.xlabel("X-axis")
plt.ylabel("Y-axis")
plt.title("Simple Plot")

# Display the plot
plt.show()
