% This function is used to calculate u_r and u_theta.
% It is easy to tell that when r=0 or theta=0, there will be sigularities.
% One way to solve this is use the know velocity at the boundary to
% represent it.
% Another way is to use the value approach 0 to replace r=0 and theta=0 to
% get a close number. Because we will encounter a lot of sigularities on
% the edge r=R or 0, theta=pi/2 or 0. And also because Matlab will give 0
% when doing 0*Inf, we decide to use the close number apporaching method.

function [u_r,u_theta,u_rdr] = u(R,mu,betac,r,theta)
    [dpsidtheta,dpsidr,dpsidthetadr] = dpsid(R,mu,betac,r,theta);
    u_r = dpsidtheta./(-r.^2.*sin(theta));
    u_theta = dpsidr./(r.*sin(theta));
    u_rdr = -2.*u_r./r-dpsidthetadr./(r.^2.*sin(theta));
end