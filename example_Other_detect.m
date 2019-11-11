clear all
clc
%% Load images
% img = imread('./data/zebra_GT.png');
% img = imread('./data/building.jpg');
% img = imread('./data/cave_flash.jpg');
% img = imread('./data/cave_noflash.jpg');
% img = imread('./data/kate.png');
 img = imread('./data/library.png');
% img = imread('./data/monkey.jpg');
% img = imread('./data/lena.jpg');
% img = imread('./data/barbara.png');

%%
option.type = 'PrewittX'; % choose from , 'SobelY', 'PrewittX', 'PrewittY', 'Laplacian'
res1 = Other_detect(img, 'SobelX');
subplot(231)
imshow(res1)
title('SobelX');

res1 = Other_detect(img, 'SobelY');
subplot(232)
imshow(res1)
title('SobelY');

res1 = Other_detect(img, 'Laplacian');
subplot(233)
imshow(res1)
title('Laplacian');

res1 = Other_detect(img, 'PrewittX');
subplot(234)
imshow(res1)
title('PrewittX');

res1 = Other_detect(img, 'PrewittY');
subplot(235)
imshow(res1)
title('PrewittY');