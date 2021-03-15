% This function is used to calculate (d cos(beta))/(d r).

function f = dcosbetadr(R,r,theta)
    f1 = 2*r.*((r.^2+R.^2).^2-4*R.^2.*r.^2.*sin(theta).^2).^(-0.5);
    f2 = 2*(r.^2-R.^2).*(r.*(r.^2+R.^2)-2*r.*R.^2.*sin(theta).^2).*((r.^2+R.^2).^2-4*R.^2.*r.^2.*sin(theta).^2).^(-1.5);
    f = f2-f1;
end