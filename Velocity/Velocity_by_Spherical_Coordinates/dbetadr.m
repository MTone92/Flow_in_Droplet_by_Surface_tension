% This function is used to calculate the (d beta)/(d r).

function f = dbetadr(R,r,theta)
    f = -1./sinbeta(R,r,theta).*dcosbetadr(R,r,theta);
end