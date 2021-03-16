function s=LogLinearLS(x,y)
m=length(x);
yy=log(y);
sx=sum(x);
sy=sum(yy);
sxx=sum(x.^2);
sxy=sum(x.*yy);
a=(m*sxy-sx*sy)/(m*sxx-sx^2);
b=(sxx*sy-sxy*sx)/(m*sxx-sx^2);
table=[x        y           exp(a*x+b)         (y-exp(a*x+b))];
disp('x        y           exp(a*x+b)         (y-exp(a*x+b))');
disp(table)
err=sum(table(:,4).^2);
s(1)=a;
s(2)=b;
plot(x,y,'r',x,exp(a*x+b),'b-')
