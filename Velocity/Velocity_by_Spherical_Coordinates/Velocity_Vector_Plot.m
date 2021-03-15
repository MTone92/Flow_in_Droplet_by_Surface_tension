% This program is used to plot the non-dimensional velocity vectors.
set(groot,'DefaultAxesFontSize',30,'DefaultTextFontSize',30,...
    'DefaultAxesFontName','Time New Roman','DefaultTextFontName','Times New Roman',...
	'DefaultAxesFontWeight','bold','DefaultTextFontWeight','bold',...
	'DefaultLineLineWidth',3,'DefaultLineMarkerSize',16,...
    'DefaultFigureColor','w')

%% This part is used to plot boundary.
u_x=u_r.*sin(theta)+u_theta.*cos(theta);
u_y=u_r.*cos(theta)-u_theta.*sin(theta);

r_1 = linspace(0,R,101);
z_1 = sqrt(R^2/sin(betac)^2-r_1.^2)-R*cot(betac);
[r,z] = meshgrid(r_1);
for i = 1:1:101
    zmax = sqrt(R^2/sin(betac)^2-r(1,i)^2)-R*cot(betac);
    z(:,i) = linspace(0,zmax,101);
end
boundary = plot(r_1,z_1);
boundary.LineWidth = 3;
boundary.Color = 'yellow';
hold on;
%quiver(x,y,u_x,u_y);

%% This part is used to plot a rare quiver.
r_gap = 5;
theta_gap = 5;
x1 = x(1:theta_gap:theta_terms-13,1:r_gap:r_terms);
x2 = x(theta_terms-12:2:theta_terms,1:r_gap:r_terms);
x1 = [x1;x2];
y1 = y(1:theta_gap:theta_terms-13,1:r_gap:r_terms);
y2 = y(theta_terms-12:2:theta_terms,1:r_gap:r_terms);
y1 = [y1;y2];
u_x1 = u_x(1:theta_gap:theta_terms-13,1:r_gap:r_terms);
u_x2 = u_x(theta_terms-12:2:theta_terms,1:r_gap:r_terms);
u_x1 = [u_x1;u_x2];
u_y1 = u_y(1:theta_gap:theta_terms-13,1:r_gap:r_terms);
u_y2 = u_y(theta_terms-12:2:theta_terms,1:r_gap:r_terms);
u_y1 = [u_y1;u_y2];

vq = quiver(x1,y1,u_x1,u_y1);
xlim([0,1]);
ylim([0,y(1,end)]);
title('Velocity vector plot','color','k','fontsize',22);
xlabel('Non-dimensional x','color','k','fontsize',16);
ylabel('Non-dimensional y','color','k','fontsize',16);