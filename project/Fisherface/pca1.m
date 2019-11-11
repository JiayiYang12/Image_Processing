function [newsample basevector]=pca1(patterns,num)

[u v]=size(patterns);


gensample = patterns - repmat(mean(patterns), [u,1]);

sigma=gensample*gensample';
[U V]=eig(sigma);
d=diag(V);
[d1 index]=dsort(d);
if num>1
    for i=1:num
        vector(:,i)=U(:,index(i));
        base(:,i)=d(index(i))^(-1/2)* gensample' * vector(:,i);
    end
else
    sumv=sum(d1);
    for i=1:u
        if sum(d1(1:i))/sumv>=num % if the sum of first i eigenvalues >= the sum of all eigenvalues, choose the first i components; 
            % indicating the possible existence of negative eigenvalues
            l=i;
            break;
        end
    end
    for i=1:l
        vector(:,i)=U(:,index(i));
            
        base(:,i)=d(index(i))^(-1/2)* gensample' * vector(:,i);
    end
end
newsample=patterns*base;
basevector=base;
end