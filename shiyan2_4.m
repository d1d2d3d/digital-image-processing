%
b=zeros(10);
for n=1:10
    for m=1:10
        a=sqrt((m)*(m)+(n)*(n));
        b(m,n)=isint(a)
    end
end