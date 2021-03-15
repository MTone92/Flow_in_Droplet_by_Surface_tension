% This function is used to calculate (d^2 cosbeta)/(dr dtheta).
% Problem hapens when r=R & theta=pi/2.

function f = dcosbetadthetadr(R,r,theta)
    s1 = (4*R.^2.*r.*(2*r.^2-R.^2).*sin(2*theta)).*((r.^2+R.^2).^2-4*r.^2.*R.^2.*sin(theta).^2).^(-1.5);
    s2 = 12*R.^2.*r.^2.*sin(2*theta).*(r.^2-R.^2).*(r.*(r.^2+R.^2)-2*R.^2.*r.*sin(theta).^2).*((r.^2+R.^2).^2-4*r.^2.*R.^2.*sin(theta).^2).^(-2.5);
    f = s2-s1;
end