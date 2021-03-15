% This function is used to calculate the (d beta)/(d theta).

function f = dbetadtheta(R,r,theta)
    f = -1./sinbeta(R,r,theta).*dcosbetadtheta(R,r,theta);
end