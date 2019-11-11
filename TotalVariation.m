function res = TotalVariation(img, noise_img, param)

N = param.N;
lambda = param.lambda;
alpha = param.alpha;

eps = 0.00001;
[m, n] = size(rgb2gray(noise_img));
noise_img = double(rgb2gray(noise_img));
u = zeros(m+2, n+2, N+1);
u_x = zeros(m, n, N);
u_y = zeros(m, n, N);
u_xx = zeros(m, n, N);
u_yy = zeros(m, n, N);
u_xy = zeros(m, n, N);
num = zeros(m, n, N);
den = zeros(m, n, N);
div = zeros(m, n, N);
u(2:m+1, 2:n+1, 1) = noise_img;
v = double(rgb2gray(img));

for k=1:N
    for i=2:m+1
        for j=2:n+1
            u_x(i-1, j-1, k) = (u(i+1, j, k) - u(i-1, j, k)) / 2.0;
            u_y(i-1, j-1, k) = (u(i, j+1, k) - u(i, j-1, k)) / 2.0;
            u_xx(i-1, j-1, k) = u(i+1, j, k) + u(i-1, j, k) - 2 * u(i, j, k);
            u_yy(i-1, j-1, k) = u(i, j+1, k) + u(i, j-1, k) - 2 * u(i, j, k);
            u_xy(i-1, j-1, k) = (u(i+1, j+1, k) + u(i-1, j-1, k) - u(i+1, j-1, k) - u(i-1, j+1, k)) / 4.0;
            num(i-1, j-1, k) = u_x(i-1, j-1, k)^2 * u_yy(i-1, j-1, k) + u_y(i-1, j-1, k)^2 * u_xx(i-1, j-1, k) - 2*u_x(i-1, j-1, k)*u_y(i-1, j-1, k)*u_xy(i-1, j-1, k);
            den(i-1, j-1, k) = power(u_x(i-1, j-1, k)^2 + u_y(i-1, j-1, k)^2 + eps, 1.5);
            div(i-1, j-1, k) = num(i-1, j-1, k) / den(i-1, j-1, k);
            u(i, j, k+1) = u(i, j, k) - alpha * (2*u(i, j, k) - 2*lambda*div(i-1, j-1, k) - 2 * v(i-1, j-1));
        end
    end
end
res = uint8(u(2:m+1, 2:n+1, N+1));
end
