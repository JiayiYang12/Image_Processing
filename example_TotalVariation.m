clear all
clc
img = imread('./data/zebra_GT.png');
% img = imread('./data/building.jpg');
% img = imread('./data/cave_flash.jpg');
% img = imread('./data/cave_noflash.jpg');
% img = imread('./data/kate.png');
% img = imread('./data/library.png');
% img = imread('./data/monkey.jpg');
% img = imread('./data/lena.jpg');
% img = imread('./data/barbara.png');

param.NoiseType = 'Gaussian'; % Try 'Gaussian', 'Poisson', 'Salt & Pepper'
param.Noise_sigma = 0.1; % Try 100, 400, 2500
param.no_intensity = 0.1; % Try 0.02, 0.05, 0.2
param.N = 10; % Try 8, 10, 15, 20
param.lambda = 0.1; % Try 0.01, 0.1, 0.5
param.alpha = 0.15;

noise_img = Noise(img, param.NoiseType, param.no_intensity);
res = TotalVariation(img, noise_img, param);
subplot(121)
imshow(rgb2gray(noise_img));
title('Noise Image');
subplot(122)
imshow(res);
title('Total Variation')
