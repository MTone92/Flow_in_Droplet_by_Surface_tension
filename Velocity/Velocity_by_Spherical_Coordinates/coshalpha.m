% This function is used to calculate the cosh(alpha)

function f = coshalpha(R,r,theta)
    dcoshalpha = sqrt(1-(2.*R.*r.*sin(theta)./(r.^2+R.^2)).^2);
    f = 1./dcoshalpha;
end