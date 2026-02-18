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


