% This function is used to calculate (d^2 coshalpha)/(dr dtheta).

function f = dcoshalphadthetadr(R,r,theta)
    f = 4*R.^2.*r.*(R.^2-r.^2)./(R.^2+r.^2).^3.*sin(2*theta).*(1-(2*R.*r.*sin(theta)./(R.^2+r.^2)).^2).^(-1.5).*(1+6*R.^2.*r.^2.*sin(theta).^2./(R.^2+r.^2).^2.*(1-(2*R.*r.*sin(theta)./(R.^2+r.^2)).^2).^(-1));
end