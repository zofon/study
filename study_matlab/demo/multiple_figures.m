t=-2*pi:0.01:2*pi;
subplot(3,2,1)
plot(t,sin(t))
subplot(3,2,2)
plot(t,cos(t))

subplot(3,2,3)
plot(t,tan(t))
axis([-pi pi -100 100])
subplot(3,2,4)
plot(t,cot(t))
axis([-pi pi -100 100])
subplot(3,2,5)
plot(t,atan(t))
subplot(3,2,6)
plot(t,acot(t))