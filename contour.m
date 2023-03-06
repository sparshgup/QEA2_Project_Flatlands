syms x y

%grab points
R = backtracking_descent();
%split into x and y points
Rx=R(:,1);
Ry=R(:,2);

%plot function points as meshs
[xplot, yplot] = meshgrid(-2:.2:2, -2:.2:2);
%function as mesh
fplot = 16 .* (exp(((-xplot .^ 2)./2) - ((yplot .^ 2)./2) - ((xplot .* yplot)./2)) ) + 4 .* (exp(-(xplot + 1.5).^2 - (yplot + 2.5).^2)); % plots x y and f as a 3d surface.   
f = 16 * exp(-(x.^2)/2 - (y.^2)/2 - (x*y)/2 ) + 4 * exp(-(x + 1.5).^2 - (y + 2.5).^2);

%calculate gradient vector
gradient_vector = gradient(f,[x,y]);

%calculate gradient at points
p=double(subs(gradient_vector',{x y},{Rx,Ry}));

%create contour
figure;
contourf(xplot,yplot,fplot)
hold on

%split up x any columns
px=p(:,1);
py=p(:,2);

%plot theoretical path
quiver(Rx,Ry,px,py,'-r')
hold off
axis square
colorbar

% x y and title labels
xlabel("Distance (m)")
ylabel("Distance (m)")
title("Contour plot with theoretical path")