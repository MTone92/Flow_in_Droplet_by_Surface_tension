% This is the main program used to find the u_r & u_theta.
delete(gcp('nocreate'));
parpool(31);

mu = 1;
R = 1;
betac = pi/3;
r_terms = 101;
theta_terms = 101;
% Initiate an original r&theta matrix.
theta_1 = linspace(0,pi/2,theta_terms);
r_1 = linspace(0,R,r_terms);
[r,theta] = meshgrid(r_1,theta_1);  %This will defined horizontal axis is 'r', and longitudinal axis is 'theta'.

% Adjust r matrix.
R_max = R*Rmax(betac,theta_1);
for i = 1:theta_terms
    r(i,:) = linspace(0,R_max(i),r_terms);
end

theta(1,:) = 1/100*theta(2,:);
theta(end,end) = pi/2 - theta(1,1);
r(:,1) = 1/100*r(:,2);
r(end,end) = R - r(1,1);
x = r.*sin(theta);
y = r.*cos(theta);
[u_r,u_theta,u_rdr] = u(R,mu,betac,r,theta);  %Prepare u_r and u_theta in advance, avoid repeated calculation.

u_r(:,1) = zeros(1,theta_terms);        %Adjust u_r to make u_r = 0 at r = 0.
% u_r(:,r_terms) = zeros(1,theta_terms);  %Adjust u_r to make u_r = 0 at r = R. (Only valid for hemisphere)
u_r(theta_terms,:) = zeros(1,r_terms);  %Adjust u_r to make u_r = 0 at theta = pi/2.
u_theta(:,1) = zeros(1,theta_terms);    %Adjust u_theta to make u_theta = 0 at r = 0.
u_theta(theta_terms,:) = zeros(1,r_terms);  %Adjust u_theta to make u_theta = 0 at theta = pi/2.
u_theta(1,:) = zeros(1,r_terms);            %No need to adjust u_theta here = 0, cause it is just near theta = 0.

save('Velocity_b90_s2_p0.0.mat');