function res = LOG(img, thre)
img = double(rgb2gray(img));
[m, n] = size(img);
res = zeros(m, n);
k = [0, 0, 1, 0, 0; 0, 1, 2, 1, 0; 1, 2, -16, 2, 1; 0, 1, 2, 1, 0; 0, 0, 1, 0, 0];
res = imfilter(img, k, 'same');
res = imbinarize(res,thre);
end