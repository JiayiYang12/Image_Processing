function res = Noise(img, type, factor)
if strcmp(type, 'Gaussian')
    res = imnoise(img, type, 0, factor);
elseif strcmp(type, 'Poisson')
    res = imnoise(img, 'Poisson');
elseif strcmp(type, 'Salt & Pepper')
    res = imnoise(img, 'Salt & Pepper', factor);
end
end