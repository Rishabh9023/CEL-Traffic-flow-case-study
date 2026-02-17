clc; clear; close all;

%% -------------------------------
% PART 1 : Linear Intersection Flow (LAB 3)
%% -------------------------------

A = [0.3 0.2 0.1 0.4;
     0.2 0.3 0.4 0.1;
     0.1 0.4 0.2 0.3;
     0.4 0.1 0.3 0.2];

B = [180;160;150;170];

X_linear = A\B;   % Linear solution

disp('Linear Traffic Flow (veh/min)')
disp(X_linear)

%% -------------------------------
% PART 2 : Congestion Effect (Nonlinear)  (LAB 5 concept)
%% -------------------------------

alpha = 0.0005;  % congestion parameter

X_cong = X_linear .* (1 - alpha*X_linear);

disp('Traffic Flow with Congestion Effect (veh/min)')
disp(X_cong)

% Comparison plot
figure
bar([X_linear X_cong])
legend('Linear','With Congestion')
xlabel('Road Number')
ylabel('Flow (veh/min)')
title('Effect of Congestion at Junction')
grid on


%% -------------------------------
% PART 3 : Kinetic Theory Model
%% -------------------------------

k = linspace(0,200,100);   % Density
vmax = 60;                 % Max velocity
kmax = 200;

v = vmax*(1 - k/kmax);     % Velocity-density relation
q = k.*v;                  % Flow

figure

yyaxis left
plot(k,q,'LineWidth',2)
ylabel('Flow q (veh/hr)')

yyaxis right
plot(k,v,'--','LineWidth',2)
ylabel('Velocity v (km/hr)')

xlabel('Density k (veh/km)')
title('Relationship between Density (k), Velocity (v) and Flow (q)')
legend('Flow q','Velocity v')
grid on


%% -------------------------------
% PART 4 : Real Traffic Simulation (Euler Method - LAB 1)
%% -------------------------------

dt = 0.1;           % time step
T = 20;             % total time
time = 0:dt:T;

% Initial vehicles waiting on each road
x = zeros(4,length(time));
x(:,1) = [50; 40; 60; 30];   % initial vehicles

inflow = [20; 25; 15; 18];   % vehicles entering per min

for t = 1:length(time)-1
    
    outflow = x(:,t).*(1 - alpha*x(:,t));   % congestion nonlinear outflow
    
    dxdt = inflow - outflow;  % conservation
    
    x(:,t+1) = x(:,t) + dt*dxdt;   % Euler update
    
end

% Plot simulation
figure
plot(time,x(1,:),time,x(2,:),time,x(3,:),time,x(4,:),'LineWidth',1.5)
legend('North','South','East','West')
xlabel('Time (min)')
ylabel('Vehicles Waiting')
title('Real Time Traffic Simulation with Congestion')
grid on
