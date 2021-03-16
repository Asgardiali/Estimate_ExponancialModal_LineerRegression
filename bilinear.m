% f1=f(x1,y1)
% f2=f(x2,y1)
% f3=f(x1,y2)
% f4=f(x2,y2)
function f=bilinear(xi,yi,x1,x2,y1,y2,f1,f2,f3,f4)

f=(((xi-x2)/(x1-x2))*((yi-y2)/(y1-y2))*f1)+...
    (((xi-x1)/(x2-x1))*((yi-y2)/(y1-y2))*f2)+...
    (((xi-x2)/(x1-x2))*((yi-y1)/(y2-y1))*f3)+...
    (((xi-x1)/(x2-x1))*((yi-y1)/(y2-y1))*f4);
end
    