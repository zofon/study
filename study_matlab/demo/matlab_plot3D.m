close;clear;
xa = -3:0.02:3;
ya = xa;
[x,y] = meshgrid(xa,ya);
%���⣬��Ҫ������������(z�ᣩ��������ʾ��
% calculate z data
z = x.*exp(-x.^2 - y.^2);
%z = x.^3 + y.^3

%�ڼ����(x,y,z)���ݺ󣬾Ϳ���ʹ����ά��ͼ����mesh������ά����ͼ��������ʾ��
mesh(x,y,z);