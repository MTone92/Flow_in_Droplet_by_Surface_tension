% This function is used to calculate (d cosh(alpha))/(d r).

function f = dcoshalphadr(R,r,theta)
    f = 4*R.^2.*r.*(R.^2-r.^2).*sin(theta).^2./(R.^2+r.^2).^3.*(1-(2*R.*r.*sin(theta)./(R.^2+r.^2)).^2).^(-1.5);
end