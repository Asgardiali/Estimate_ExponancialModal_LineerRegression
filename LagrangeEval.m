function p=LagrangeEval(t,x,c)
m=length(x);
for i=1:length(t)
    p(i)=0;
    for j=1:m
        N(j)=1;
        for k=1:m
            if(j~=k)
                N(j)=N(j)*(t(i)-x(k));
            end
        end
        p(i)=p(i)+N(j)*c(j);
    end
end