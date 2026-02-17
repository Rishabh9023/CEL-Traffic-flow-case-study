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
* Apply kinetic theory analogy
* Simulate real-time traffic evolution using numerical methods

### Concepts Used (LAB 1–5)

* Conservation law at intersections
* Linear algebra formulation
* Nonlinear congestion modeling
* Kinetic theory of traffic flow
* Euler method for time-dependent simulation

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

[
B =
\begin{bmatrix}
180 \
160 \
150 \
170
\end{bmatrix}
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

[
X =
\begin{bmatrix}
x_1 \
x_2 \
x_3 \
x_4
\end{bmatrix}
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

## 📊 Kinetic Theory of Traffic (LAB 2)

Traffic behaves like particle flow:

[
q = kv
]

Velocity-density relation:

[
v = v_{max}(1 - k/k_{max})
]

```matlab
k = linspace(0,200,100);
vmax = 60;
kmax = 200;

v = vmax*(1 - k/kmax);
q = k.*v;

figure
yyaxis left
plot(k,q)
ylabel('Flow (veh/hr)')

yyaxis right
plot(k,v)
ylabel('Velocity (km/hr)')

xlabel('Density (veh/km)')
title('Density vs Velocity vs Flow')
grid on
```

This produces the **fundamental diagram of traffic flow**.

---

## ⏱️ Euler Time Simulation (LAB 1)

Dynamic model:

[
\frac{dx}{dt} = Inflow - Outflow
]

```matlab
dt = 0.1;
T = 20;
time = 0:dt:T;

x = zeros(4,length(time));
x(:,1) = [50;40;60;30];

inflow = [20;25;15;18];
alpha = 0.0005;

for i = 1:length(time)-1
    outflow = x(:,i).*(1 - alpha*x(:,i));
    dxdt = inflow - outflow;
    x(:,i+1) = x(:,i) + dt*dxdt;
end

figure
plot(time,x(1,:),time,x(2,:),time,x(3,:),time,x(4,:),'LineWidth',1.5)
legend('North','South','East','West')
xlabel('Time (min)')
ylabel('Vehicles')
title('Traffic Evolution using Euler Method')
grid on
```

The system stabilizes over time, representing real traffic equilibrium.

---

## 📉 Stability and Interpretation

* Linear model gives ideal distribution
* Congestion reduces effective flow
* Kinetic theory explains traffic breakdown
* Euler simulation shows transient behavior
* System reaches steady equilibrium

Stability condition:

[
\alpha x < 1
]

---

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
* Euler numerical simulation

---

## 🔮 Future Scope

* Traffic signal optimization
* Multi-intersection modeling
* Real traffic data integration
* Traffic flow optimization

---

## ✅ Conclusion

This case study models traffic flow at a four-way junction using conservation principles and matrix algebra. The linear solution provides steady-state distribution, while congestion modeling introduces realistic behavior. The kinetic theory explains the density–flow relationship, and Euler simulation demonstrates time-dependent stabilization.

The study highlights the effectiveness of computational engineering methods in analyzing real-world traffic systems.


* Folder structure
* `.m` file ready
* Junction diagram image
* README badges (MATLAB, Linear Algebra, Computational Engineering).
