# Matplotlib

Matplotlib is a comprehensive library for creating static, animated, and interactive visualizations in Python.

## Key Features

*   **Plotting:** Create a wide variety of plots, including line plots, scatter plots, bar charts, histograms, and more.
*   **Customization:** Highly customizable plots with control over every aspect of the figure.
*   **Integration:** Integrates well with NumPy and Pandas.

## Basic Usage

```python
import matplotlib.pyplot as plt
import numpy as np

# Create some data
x = np.linspace(0, 10, 100)
y = np.sin(x)

# Create a plot
plt.plot(x, y)

# Add labels and title
plt.xlabel("x-axis")
plt.ylabel("y-axis")
plt.title("Sine Wave")

# Show the plot
plt.show()
```

## Cross-References

*   [[Python]]
*   [[NumPy]]
*   [[Pandas]]
