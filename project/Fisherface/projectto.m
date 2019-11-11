function vsort=projectto(sw,sb,num)
invSw=inv(sw);
newspace=invSw*sb;
[x y]=eig(newspace);
d=diag(y);
[d1 index1]=dsort(d);
for i=1:num
    vsort(:,i)=x(:,index1(i));
end
end