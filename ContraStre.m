function res = ContraStre(img, param)
L = 256;
[m, n, p] = size(img);  
res = double(img);
img = double(img);

if strcmp(param.type, 'linear')
    for i = 1: p
        img_piece = img(:, :, i);
        max_ = max(max(img_piece));
        min_ = min(min(img_piece));
        c_ = (param.z2 - param.z1)  / (max_ - min_);
        b_ = param.z1 - c_ * min_;
        for j = 1 : m
            for k = 1: n
                res(j, k, i) = c_ * img_piece(j, k) + b_;
            end
        end
    end

elseif strcmp(param.type, 'log')
    for i = 1: p
        img_piece = img(:, :, i);
        max_ = max(max(img_piece));
        c_ = (L - 1) .* log10(1 + max_);
        for j = 1 : m
            for k = 1: n
                res(j, k, i) = c_ * log10(1 + img(j, k, i));
            end
        end
    end


elseif strcmp(param.type, 'exp')
    for i = 1: p
        for j = 1: m
            for k = 1: n
                res(j, k, i) = param.c * pow2(param.b, img(j, k, i)) - 1;
            end
        end
    end

elseif strcmp(param.type, 'gamma')
    for i = 1: p
        for j = 1: m
            for k = 1: n
                res(j, k, i) = (L - 1) * pow2(img(j, k, i) / (L - 1), param.gamma);
            end
        end
    end
end

end