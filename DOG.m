function res = DOG(img, option)
img = double(rgb2gray(img));
outer_sigma = option.outer_sigma;
inner_sigma = option.inner_sigma;
outer_kernel = fspecial('gaussian', 5,outer_sigma);
inner_kernel = fspecial('gaussian', 5,inner_sigma);
dog = (outer_kernel - inner_kernel);
res = mat2gray(imfilter(img, dog, 'replicate'));
end