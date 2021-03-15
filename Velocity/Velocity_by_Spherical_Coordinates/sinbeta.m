% This function is used to calculate the sin(beta).

function f = sinbeta(R,r,theta)
    f = 2.*R.*r.*cos(theta)./sqrt((r.^2+R.^2).^2-4.*R.^2.*r.^2.*sin(theta).^2);
end