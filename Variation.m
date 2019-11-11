function res = Variation(img, noise_img, param)
N = param.N;
lambda = param.lambda;
alpha = param.alpha;

[m, n] = size(rgb2gray(noise_img));
noise_img = double(rgb2gray(noise_img));
u = zeros(m+2, n+2, N+1);
u_xx = zeros(m, n, N);
u_yy = zeros(m, n, N);
u_xy = zeros(m, n, N);
la = zeros(m, n, N);
u(2:m+1, 2:n+1, 1) = noise_img;
v = double(rgb2gray(img));

for k=1:N
    for i=2:m+1
        for j=2:n+1
            u_xx(i-1, j-1, k) = u(i+1, j, k) + u(i-1, j, k) - 2 * u(i, j, k);
            u_yy(i-1, j-1, k) = u(i, j+1, k) + u(i, j-1, k) - 2 * u(i, j, k);
            u_xy(i-1, j-1, k) = (u(i+1, j+1, k) + u(i-1, j-1, k) - u(i+1, j-1, k) - u(i-1, j+1, k)) / 4.0;
            la(i-1, j-1, k) = u_xx(i-1, j-1, k) + u_yy(i-1, j-1, k) + 2*u_xy(i-1, j-1, k);
            u(i, j, k+1) = u(i, j, k)  - 2*alpha * (u(i, j, k)-v(i-1, j-1) - lambda * la(i-1, j-1, k));
        end
    end
end
res = uint8(u(2:m+1, 2:n+1, N+1));
end