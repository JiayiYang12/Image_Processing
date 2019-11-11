function res = Convolution(img, type)
if strcmp(type, '1')
    k = ones(3, 3, 3) / 9;
    res = imfilter(img, k, 'same');
elseif strcmp(type, '2')
    k = ones(5, 5, 5) / 25;
    res = imfilter(img, k, 'same');
elseif strcmp(type, '3')
    k = ones(3, 3, 3) / 10;
    k(2, 2, 2) = 0.2;
    res = imfilter(img, k, 'same');
elseif strcmp(type, '4')
    k = [1, 2, 1; 2, 4, 2; 1, 2, 1] / 16;
    res = imfilter(img, k, 'same');
elseif strcmp(type, '5')
    k = ones(3, 3, 3) / 8;
    k(2, 2, 2) = 0;
    res = imfilter(img, k, 'same');
elseif strcmp(type, '6')
    k = [1, 4, 7, 4, 1; 4, 16, 26, 16, 4; 7, 26, 41, 26, 7; 4, 16, 26, 16, 4; 1, 4, 7, 4, 1] / 273;
    res = imfilter(img, k, 'same');
elseif strcmp(type, '7')
    k = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '8')
    k = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '9')
    k = [1; -1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '10')
    k = [1, -1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '11')
    k = [0, 1; -1, 0];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '12')
    k = [1, 0; 0, -1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '13')
    k = [1, 1, 1; 0, 0, 0; -1, -1, -1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '14')
    k = [1, 0, -1; 1, 0, -1; 1, 0, -1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '15')
    k = [0, 1, 0; 1, -4, 1; 0, 1, 0];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '16')
    k = [1, 1, 1; 1, -8, 1; 1, 1, 1];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '17')
    k = [0, 0, 1, 0, 0; 0, 1, 2, 1, 0; 1, 2, -16, 2, 1; 0, 1, 2, 1, 0; 0, 0, 1, 0, 0];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '18')
    k = [2, 4, 5, 4, 2; 4, 9, 12, 9, 4; 5, 12, 15, 12, 5; 4, 9, 12, 9, 4; 2, 4, 5, 4, 2] / 159;
    res = imfilter(img, k, 'same');
elseif strcmp(type, '19')
    k = [0, -1, 0; -1, 8, -1; 0, -1, 0];
    res = imfilter(img, k, 'same');
elseif strcmp(type, '20')
    k = [-1, -1, -1; -1, 16, -1; -1, -1, -1];
    res = imfilter(img, k, 'same');
end