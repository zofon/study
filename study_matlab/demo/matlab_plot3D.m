close;clear;
xa = -3:0.02:3;
ya = xa;
[x,y] = meshgrid(xa,ya);
%此外，需要计算纵轴数据(z轴），如下所示：
% calculate z data
z = x.*exp(-x.^2 - y.^2);
%z = x.^3 + y.^3

%在计算出(x,y,z)数据后，就可以使用三维绘图函数mesh绘制三维曲面图，如下所示：
mesh(x,y,z);