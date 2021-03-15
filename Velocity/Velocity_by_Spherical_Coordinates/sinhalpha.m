% This function is used to calculate the sinh(alpha)

function f = sinhalpha(R,r,theta)
    dsinhalpha = sqrt(((r.^2+R.^2)./(2.*R.*r.*sin(theta))).^2-1);
    f = 1./dsinhalpha;
end