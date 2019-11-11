function res = HistEqua(img) 
L = 256;
[m, n, p] = size(img);  

cdf = zeros(p, L);
cdf = double(cdf);
for k = 1: p
    for i = 1: m
        for j = 1: n
            cdf(k, img(i, j, k) + 1) = cdf(k, img(i, j, k) + 1) + 1;
        end
    end
end
for j = 1: p
    for i = 2: L
        cdf(j, i) = cdf(j, i-1) + cdf(j, i);
    end
end
for j = 1: p
    cdf(j, :) = (L - 1) * cdf(j, :) / (m*n);
end
res = double(img);
for k = 1: p
    for i = 1: m
        for j = 1: n
            res(i, j, k) = cdf(k, res(i, j, k) + 1);
        end
    end
end
res=uint8(res);
if res == img
    disp('Error!');
end


