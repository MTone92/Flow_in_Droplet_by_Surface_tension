function f = Rmax(betac,theta)
    
    coshalpha = sqrt(tan(theta).^2*sin(betac).^2+1);
    f = sqrt(coshalpha-cos(betac))./sqrt(coshalpha+cos(betac));
    
end