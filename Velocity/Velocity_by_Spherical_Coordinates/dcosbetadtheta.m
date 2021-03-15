% This function is used to calculate the value of (d cos(beta))/(d theta).

function f = dcosbetadtheta(R,r,theta)
    f = 2.*(R.^2-r.^2).*((r.^2+R.^2).^2-4*R.^2.*r.^2.*sin(theta).^2).^(-1.5).*sin(2*theta).*R.^2.*r.^2;
end