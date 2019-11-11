function [res, flag] = bilateral(img, param)
img = rgb2gray(img);
[m n]=size(img);

r = 10;
param.sigma_s = 2;
param.sigma_d = 0.1;
%% Bilateral Filter
    % P(i, j), Q(k, l) Q surrounds P in a [r, r] block;
    % G_s denotes a Gaussian filter measured by distance, G_d denotes a
    % Gaussian filter measured by Intensity;
    % BF[i, j] = sum(Iq * G_d(q)) / sum(G_s.*G_r);
    res = zeros(size(img));
    % Extension of image
    res = zeros(m+2*r+1, n+2*r+1);
    res(r+1: m+r, r+1: n+r) = img(:, :);
    res(1:r, r+1: n+r) = img(1:r, :); % upper extension
    res(1:m+r, n+r+1:n+2*r+1) = res(1:m+r, n:n+r); % right extension
    res(m+r+1:m+2*r+1, r+1:n+2*r+1) = res(m:m+r, r+1:n+2*r+1); % down extension 
    res(1:m+2*r+1, 1:r) = res(1:m+2*r+1, r+1:2*r); % left extension
    
    % Calculate G_s
    [x, y] = meshgrid(-r:r, -r:r);
    G_s = exp(-(x.^2 + y.^2) / (2 * param.sigma_s ^ 2));
    
    % Calculate G_r, G and BF(Ip)
    for i=r+1: m+r
        for j= r+1: n+r
            G_d = exp(-(res(i-r: i+r, j-r: j+r) - res(i, j)).^2 / (2 * param.sigma_d ^ 2));
            G = G_s.*G_d;
            s = res(i-r:i+r, j-r:j+r).*G;
            res(i, j) = sum(sum(s)) / sum(sum(G));
        end
    end
figure;
imshow([mat2gray(img) mat2gray(res(r+1: m+r, r+1: n+r))], [0 1]);

end