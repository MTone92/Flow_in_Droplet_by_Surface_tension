% This function is used to calculate (d cosh(alpha))/(d theta).

function f = dcoshalphadtheta(R,r,theta)
    f = 2*R.^2.*r.^2.*sin(2*theta)./(R.^2+r.^2).^2.*(1-(2*R.*r.*sin(theta)./(R.^2+r.^2)).^2).^(-1.5);
end