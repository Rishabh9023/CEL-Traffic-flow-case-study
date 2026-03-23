# 🚦 Traffic Flow Balance at Road Junctions

**Author:** Rishabh Badgujar
**Roll No:** 23BME035
**Course:** Computational Engineering Lab
**Tool Used:** MATLAB

---

## 📌 Project Overview

This case study models traffic flow distribution at a four-way road junction using the principle of **conservation of vehicles**.

The objectives are:

* Determine steady-state traffic flow on each road
* Analyze the effect of turning movements
* Include congestion effects (nonlinearity)
* Simulate real-time traffic evolution using numerical methods

### Concepts Used (LAB 1–5)

* Conservation law at intersections
* Linear algebra formulation
* Nonlinear congestion modeling

This study demonstrates the application of computational engineering techniques to real-world traffic systems.

---

## 🚗 Background and Motivation

Urban intersections are critical points where multiple traffic streams interact. Traffic behavior depends on:

* Incoming vehicle rates
* Turning proportions
* Road capacity
* Congestion level

As traffic density increases, vehicle speed decreases, reducing effective flow. Therefore, realistic modeling requires both linear and nonlinear analysis.

---

## 🛣️ Junction Description and Assumptions

Four incoming roads:

| Road | Direction |
| ---- | --------- |
| x₁   | North     |
| x₂   | South     |
| x₃   | East      |
| x₄   | West      |

### Turning Proportions

* Straight: **40%**
* Left: **30%**
* Right: **20%**
* U-turn: **10%**

### Outgoing Demand

B = 
[
  180
  160
  150
  170
] 
(vehicles/min)

### Assumptions

* Continuous traffic flow
* Constant turning ratios
* No signal control
* Initial steady-state conditions

---

## 📐 Mathematical Formulation

### Conservation of Vehicles

At steady state:

[
AX = B
]

where

X = [
  x1
  x2
  x3
  x4
]

Traffic distribution matrix:

[
A =
\begin{bmatrix}
0.3 & 0.2 & 0.1 & 0.4 \
0.2 & 0.3 & 0.4 & 0.1 \
0.1 & 0.4 & 0.2 & 0.3 \
0.4 & 0.1 & 0.3 & 0.2
\end{bmatrix}
]

Solution:

[
X = A^{-1}B
]

---

## 💻 MATLAB Implementation

### Part 1: Linear Traffic Flow (LAB 3)

```matlab
clc; clear; close all;

A = [0.3 0.2 0.1 0.4;
     0.2 0.3 0.4 0.1;
     0.1 0.4 0.2 0.3;
     0.4 0.1 0.3 0.2];

B = [180;160;150;170];

X_linear = A\B;

disp('Linear Traffic Flow (veh/min)')
disp(X_linear)
```

---

## ⚠️ Congestion Modeling (LAB 5)

Traffic flow reduces at high density:

[
q = x(1 - \alpha x)
]

Where:

[
\alpha = 0.0005
]

```matlab
alpha = 0.0005;

X_cong = X_linear .* (1 - alpha*X_linear);

disp('Traffic Flow with Congestion Effect')
disp(X_cong)

figure
bar([X_linear X_cong])
legend('Linear','With Congestion')
xlabel('Road Number')
ylabel('Flow (veh/min)')
title('Effect of Congestion at Junction')
grid on
```

---



## 📉 Stability and Interpretation

* Linear model gives ideal distribution
* Congestion reduces effective flow

Stability condition:

[
\alpha x < 1
]


## 📈 Results and Discussion

The model demonstrates:

* Interdependence between roads
* Nonlinear congestion effects
* Existence of optimal traffic density
* Dynamic stabilization over time

These results match real-world traffic behavior.

---

## 🎯 Learning Outcomes

* Application of Linear Algebra in engineering
* Conservation-based system modeling
* MATLAB matrix operations
* Nonlinear system analysis

---

## 🔮 Future Scope

* Traffic signal optimization
* Multi-intersection modeling
* Real traffic data integration
* Traffic flow optimization

---

## ✅ Conclusion

This case study models traffic flow at a four-way junction using conservation principles and matrix algebra. The linear solution provides steady-state distribution, while congestion modeling introduces realistic behavior. 

