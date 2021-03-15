% This function is used to calculate (d^2 beta)/(dr dtheta).

function f = dbetadthetadr(R,r,theta)
    f1 = sin(theta)./(R.*cos(theta).^2).*(1-(r.^2-R.^2).*(r.^2+R.^2-2*R.^2.*sin(theta).^2)./((R.^2+r.^2).^2-4*R.^2.*r.^2.*sin(theta).^2));
    f2 = 1./(R.*cos(theta)).*((r.^2-R.^2).*2.*R.^2.*sin(2*theta)./((R.^2+r.^2).^2-4*R.^2.*r.^2.*sin(theta).^2)-(r.^2-R.^2).*(4*R.^2.*r.^2.*sin(2*theta)).*(r.^2+R.^2-2*R.^2.*sin(theta).^2)./((R.^2+r.^2).^2-4*R.^2.*r.^2.*sin(theta).^2).^2);
    f = f1+f2;
end