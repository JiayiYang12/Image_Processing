function res_ = PdeDenoisng(img, param)
img = rgb2gray(img);
[m, n] = size(img);

    N = param.N;
    type = param.PDEType;
    dt = param.dt;
    lambda = param.lambda;
    p = param.p;
    res = zeros(m, n, N+1);
    res(:, :, 1) = img;
    if strcmp(type, 'isotropic')
        a = 1;
        
        for i=1:N
            for j=2:(m-1)
                for k=2:(n-1)
                    res(j, k, i+1) = res(j, k, i) + a*dt*(res(j-1, k, i)+res(j, k-1, i)+res(j+1, k, i)+res(j, k+1, i) - 4 * res(j, k, i));
                end
            end
        end
    else
        g = @(x)1 / (1 + (x / lambda)^p);
        for i=1:N
            for j=2:(m-1)
                for k=2:(n-1)
                    t1 = res(j+1, k, i) - res(j, k, i);
                    t2 = - res(j-1, k, i) + res(j, k, i);
                    t3 = res(j, k+1, i) - res(j, k, i);
                    t4 =  - res(j, k-1, i) + res(j, k, i);
                    g1 = g(abs(t1));
                    g2 = g(abs(t2));
                    g3 = g(abs(t3));
                    g4 = g(abs(t4));
                    div_g = t1*g1 - t2*g2 + t3*g3 - t4*g4;
                    res(j, k, i+1) = res(j, k, i) + dt * div_g;
                end
            end
        end
        
    end
res_ = uint8(res(:, :, N+1));
end