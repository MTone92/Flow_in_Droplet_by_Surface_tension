% This function is used to calculate cos(beta).

function f = cosbeta(R,r,theta)
    f = (R.^2-r.^2)./sqrt((r.^2+R.^2).^2-4.*R.^2.*r.^2.*sin(theta).^2);
end