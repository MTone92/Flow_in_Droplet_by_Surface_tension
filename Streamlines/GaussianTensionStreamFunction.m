% This is the program calculating the Psi under Gaussian Surface tension
% distribution or other types of Surface tension distribution included in N2.

% The slow of this code is because that N2 is slow. Thus, the reasonable
% way is to use parallel calculation in PSI or the Main Program.

% This main program is comprehensive. For different cases, small
% modification is required:
% 1. Different contact angle ----> Change 'betac'
% 2. Different Surface Tension Profile ----> Pick proper 'N2' and then Change 'N2'
% 3. PSI.m is calculated paralleled, for different node numbers, ----> Change 'nodes = 30' to proper values.


delete(gcp('nocreate'));                                                   % Delete previous parallel pool.
parpool(31);                                                               % Open new Parralle pools.

R = 1;                                                                     % Non-dimensional radius set to be unit.
betac = pi/6;                                                              % Droplet contact angle (inside droplet).

r_1 = linspace(0,R,101);                                                   % Create points whose Psi will be calculated.
z_1 = sqrt(R^2/sin(betac)^2-r_1.^2)-R*cot(betac);
[r,z] = meshgrid(r_1);
for i = 1:1:101
    zmax = sqrt(R^2/sin(betac)^2-r(1,i)^2)-R*cot(betac);
    z(:,i) = linspace(0,zmax,101);
end
alpha_p = acoth((r.^2+z.^2+R.^2)./(2*R.*r));
beta_p = acos(R.*sinh(alpha_p)./r-cosh(alpha_p));                          % First line in beta_p is 'NaN' due to 0/0, however, we know it is 0.
streamfunction = zeros(101);
alpha = alpha_p(2:100,2:100);                                              % Aviod non-necessary calculation and sigularities.
beta = beta_p(2:100,2:100);

streamfunction(2:100,2:100) = PSI(betac,beta,alpha);
save('StreamFunction_b30_s1000_p0.mat');
