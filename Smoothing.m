function [res, PSNR] = Smoothing(img, param)

res = zeros(size(img));
[m, n, p] = size(img);
type = param.SmoothingType;
if strcmp(type, 'median')
    %% Median Filter
    for c=1: p
        res(:, :, c) = medfilt2(img(:, :, c));
    end
    res = uint8(res);
    
elseif strcmp(type, 'gaussian')
    %% Gaussian Filter
    k = fspecial('gaussian',[r, r],param.sigma);
    res = imfilter(img, k);


elseif strcmp(type, 'average')
    %% Average Filter
    k = fspecial('average', [r, r]);
    res = imfilter(img, k);
end

%% Evaluation
mse = 0;
for c=1: p
    for i=1: m
        for j=1:n
            mse = mse + (img(i, j, p) - res(i, j, p))^2;
        end
    end
end
mse = double(mse / 3);
PSNR = 10 * log10(255^2 / (mse));
fprintf('PSNR = %.2f\n', round(PSNR, 2));
end