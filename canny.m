function res = canny(img, option)
sigma = option.sigma;
minVal = option.minVal;
maxVal = option.maxVal;
img = double(rgb2gray(img));
[m, n] = size(img);
%% Gaussian Blur
G_fil = fspecial('gaussian', 5,sigma);
res1 = imfilter(img, G_fil, 'same');

%% Compute the value and direction of gradients
SobelX = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
SobelY = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
Gx = imfilter(img, SobelX, 'same');
Gy = imfilter(img, SobelY, 'same');
G = sqrt(Gx.^2 + Gy.^2);
theta = atand(Gy./Gx);
for i=1:m
    for j=1:n
        if theta(i, j) >= -22.5 && theta(i, j) < 22.5 
            theta(i, j) = 0;
        elseif theta(i, j) >= 22.5 && theta(i, j) < 67.5
            theta(i, j) = 45;     
        elseif theta(i, j) >= -67.5 && theta(i, j) < -22.5
            theta(i, j) = 135;
        else 
            theta(i, j) = 90;
        end
    end
end

%% Non-maximum suppression
res1 = zeros(m+2, n+2);
G_ = zeros(m+2 , n+2);
G_(2:m+1, 2:n+1) = G;
for i=2:m+1
    for j=2:n+1
        if theta(i-1, j-1) == 90
            if G_(i, j) > max(G_(i-1, j), G_(i+1, j))
                res1(i, j) = G_(i, j);
            end
        elseif theta(i-1, j-1) == 135
            if G_(i, j) > max(G_(i-1, j-1), G_(i+1, j+1))
                res1(i, j) = G_(i, j);
            end
        elseif theta(i-1, j-1) == 0
            if G_(i, j) > max(G_(i, j-1), G_(i, j+1))
                res1(i, j) = G_(i, j);
            end
        elseif theta(i-1, j-1) == 45
            if G_(i, j) > max(G_(i-1, j+1), G_(i+1, j-1))
                res1(i, j) = G_(i, j);
            end
        end
    end
end

%% Double threhold and Edge tracking by hysteresis
res2 = zeros(m+2, n+2);
for i=2:m+1
    for j=2:n+1
        if res1(i, j) >= maxVal
            res2(i, j) = 1;
        elseif res1 <= minVal
            res2(i, j) = 0;
        else
            temp_mat = [res1(i-1, j-1), res1(i-1, j), res1(i-1, j+1); 
                res1(i, j-1), res1(i, j), res1(i, j+1);
                res1(i+1, j-1), res1(i+1, j), res1(i+1, j+1)];
            if max(temp_mat) > maxVal
                res2(i, j) = 1;
            end
        end
    end
end
res = mat2gray(res2(2:m+1, 2:n+1));
end