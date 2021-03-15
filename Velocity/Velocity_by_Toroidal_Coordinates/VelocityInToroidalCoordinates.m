% This program is used to calculate the velocities in toroidal coordinate.
delete(gcp('nocreate'));
parpool(4);                     % The parallel pools are used in Ubeta1 & Ubeta2

R = 1;
mu = 1;
% betac = pi/6;

alpha = linspace(0,5,101);
alpha(1,1) = 0.001;
beta = linspace(0,betac,101);
[alpha,beta] = meshgrid(alpha,beta);

u_alpha = U_alpha(R,mu,betac,alpha,beta);
u_beta = U_beta(R,mu,betac,alpha,beta);

u_alpha(:,1) = zeros(101,1);

%save('Velocity_b90_s2_p0.5.mat');