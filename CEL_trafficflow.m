clc; clear; 
close all;
%% -------------------------------
% PART 1 : Linear Intersection Flow (LAB 3)    (please refer to the pdf for
% more clarity)
%% -------------------------------

% Incoming traffic vector (veh/min)
X_in = [250; 220; 200; 240];   % [North; South; East; West]

disp('Incoming Traffic (veh/min):')
disp(X_in)

% Turning ratio matrix T
% Row = Exit direction
% Column = Entry direction
% Order: [North; South; East; West]

T = [0.10  0.40  0.20  0.30;   % North exit
     0.40  0.10  0.30  0.20;   % South exit
     0.30  0.20  0.10  0.40;   % East exit
     0.20  0.30  0.40  0.10];  % West exit

% Each column sums to 1 (conservation check)
disp('Column sums of T (should be 1):')
disp(sum(T))

% Outgoing traffic (linear case)
X_out_linear = T * X_in;

disp('Outgoing Traffic without Congestion (veh/min):')
disp(X_out_linear)


figure

bar([X_in X_out_linear])

xlabel('Road Number (1=N, 2=S, 3=E, 4=W)')
ylabel('Flow (veh/min)')
title('Incoming vs Outgoing Traffic at Junction (Matrix Model)')
legend('Incoming','Outgoing (Linear)')
grid oN

%% -------------------------------
% PART 2 : Congestion Effect (Nonlinear)  (LAB 5 concept)
%% -------------------------------

capacity = 400;  % congestion parameter  - vehicle/min

% Nonlinear congestion effect
X_out_cong = X_out_linear .* (1 - X_out_linear/capacity);

disp('Outgoing Traffic with Congestion (veh/min):')
disp(X_out_cong)

% Plot comparison
figure
bar([X_out_linear X_out_cong])
legend('Without Congestion','With Congestion')
xlabel('Road Number (1=N,2=S,3=E,4=W)')
ylabel('Flow (veh/min)')
title('Effect of Congestion at Junction (Matrix Model)')
grid on
