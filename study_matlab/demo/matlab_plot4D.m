%用切片函数构出长方体
[x,y,z]=meshgrid(-1:.1:1,-1:.1:1,-3:.1:3);
%画图范围
v=x.*exp(-x.^2-y.^2-z.^2);
%计算函数值
slice(x,y,z,v,[],[],-2:.01:2,'linear');
axis([-3 3 -3 3 -3 3]);
shading flat