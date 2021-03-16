% Denklem çözümü için aþaðýdaki ayrýþtýrma yaptým.
% ln(u)=ln(D)+B*(1/Ta)
% Ta=T(Celcius)+273.15
% y=ln(u)
% a0=ln(D) D=e^a0
% a1=B
% x=1/Ta?y=a0+a1(x)
% 
% n-> Deðer sayýsý
% a1=(n*(xi*yi))-(xi)*(yi)/(n*xi^2-(xi)^2)
% a0=y-a1*x

T=[0 5 10 20 30 40];
Ta=[273.15 278.15 283.15 293.15 303.15 313.15];
u=[1.787 1.519 1.307 1.002 0.7975 0.6529];
xtop=0;
ytop=0;
ztop=0;
ttop=0;

for i=1:6
    x(i)=1/Ta(i);
    y(i)=log(u(i));
    z(i)=x(i)*y(i);
    t(i)=x(i)*x(i);
    xtop=xtop+x(i);
    ytop=ytop+y(i);
    ztop=ztop+z(i);
    ttop=ttop+t(i);
end
%B=a1
a1=((6*(ztop))-(xtop*ytop))/((6*(ttop))-((xtop)^2));
B=a1;
%D=e^a0
a0=(ytop/6)-(a1*(xtop/6));
D=exp(a0);
