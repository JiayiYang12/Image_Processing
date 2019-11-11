function res = Other_detect(img, type)
img = double(img);
[m, n] = size(img);
if strcmp(type, 'SobelX')
    k = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, 'SobelY')
    k = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, 'PrewittX')
    k = [1, 0, -1; 1, 0, -1; 1, 0, -1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, 'PrewittY')
    k = [1, 1, 1; 0, 0, 0; -1, -1, -1];
    res = imfilter(img, k, 'same');
else
    k = [0, 1, 0; 1, -4, 1; 0, 1, 0];
    res = imfilter(img, k, 'same');
end
res = mat2gray(res);
end