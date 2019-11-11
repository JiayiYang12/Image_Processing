function eigvec=pca2(patterns,num)
[m, n] = size(patterns);
gensample = patterns - repmat(mean(patterns), [m, 1]);

sigma=gensample*gensample';

[V, D] = eig(sigma);
D = diag(D);
[Vsort, index] = dsort(D);


for i=1:num
    vec(:, i) = V(:,index(i));

    eigvec(:, i) = D(index(i)) ^ (-0.5) * gensample' * vec(:, i);
end
end

