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

%% Test HistEqual
% res = HistEqua(img);

%% Test ContraStre
% param.type = 'gamma' % try 'linear', 'log', 'exp', 'gamma'
% param.z1 = -100; % try -200, -100, 0
% param.z2 = 180; % try any number bigger than z1, better match: z2 - z1 > 255 
% param.b = 1.1; % try 0.5, 0.8, 1.1
% param.c = 2;; %  try 2, 4, 8
% param.gamma = 2; % try 0.2, 0.5, 1, 2, 4
% res = ContraStre(img, param);

%% Test Convolution
% ConvNum = '1'
% res = Convolution(img, ConvNum); % try '1'~'20'(See Convolution.m)

%% Test Noise
param.NoiseType = 'Gaussian'; % Try 'Gaussian', 'Poisson', 'Salt & Pepper'
param.Noise_sigma = 0.1; % Try 100, 400, 2500
param.no_intensity = 0.1; % Try 0.02, 0.05, 0.2
noise_img = Noise(img, param.NoiseType, param.no_intensity);

%% Test Smoothing（except bilateral filter）
% param.SmoothingType = 'bilateral'; % Try 'median', 'gaussian', 'bilateral', 'average'
% param.sigma = 1; % Try 1, 100, 400
% img = Noise(img, param.NoiseType, param.no_intensity);
% [res, PSNR] = Smoothing(img, param);

%% Test bilateral filter
% param.r = 10; % Try 3, 5, 10
% param.sigma_s = 2; % Try 1, 2, 4, 8
% param.sigma_d = 0.1; % Try 0.1, 0.2, 0.5, 1
% res = Noise(img, param.NoiseType, param.no_intensity);
% res_  = bilateral(res);

%% Test PdeDenoising 
% param.PDEType = 'isotropic'; % Try 'isotropic', 'anisotropic'
% param.N = 10; % try 2, 10, 50, 100
% param.dt = 0.2; % try 0.2, 1, 5;
% param.lambda = 10; % try 0.01, 0.1, 0.5
% param.p = 1; % try 1 or 2;
% res1 = PdeDenoising(noise_img, param);
% param.PDEType = 'anisotropic'; % Try 'isotropic', 'anisotropic'
% param.dt = 0.5;
% 
% res2 = PdeDenoising(noise_img, param);

%% Test VariationDenoising
param.type = '2norm' % Try '2norm' or '1norm'
param.N = 10;
param.lambda = 1;
param.alpha = 0.1;

imgs.orig_img = img;
imgs.noise_img = noise_img;
res = TotalVariation(imgs, param);

%% Show results
figure();
imshow([noise_img, res], [0, 1]);
%% Save results
% imwrite(res_save.CData, ['./41721612+杨佳亦+matlab+3/', param.NoiseType, '(', num2str(param.Noise_sigma), ')', '+', param.SmoothingType, ' filter', '(', num2str(param.sigma_s), num2str(param.sigma_d), ')', '.jpg'])
% fileid = fopen('./41721612+杨佳亦+matlab+2/records.txt', 'a');
% fprintf(fileid, 'Noise: %s, %.2f\nSmoothing: %s filter\nPSNR = %.2f\n', param.NoiseType, param.Noise_sigma, param.SmoothingType, PSNR);
% fclose(fileid);