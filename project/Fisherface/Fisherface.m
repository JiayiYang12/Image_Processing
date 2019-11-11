function acc_ = Fisherface(data, setting)
tr_pr = setting.tr_pr;
dist = setting.dist;
cNum = data.cNum;
fperc = data.fperc;
samples = data.all_samples;
[m, n, N] = size(samples);

labels = [];
for i=1:cNum
    labels = [labels, ones(1, fperc) * i];
end
labels = labels';

all_samples = zeros(N, m*n);

for i=1:N
    temp =0;
    temp = samples(:, :, i);
    all_samples(i, :) = reshape(temp, [1, m*n]);
end
train_perc = tr_pr * fperc;
test_perc = (1-tr_pr) * fperc;

[test, train] = crossvalind('holdOut',N,tr_pr);
test_samples = all_samples(test, :);
train_samples = all_samples(train,: );
train_sample_labels = labels(train);
test_sample_labels = labels(test);

Labels.labels = labels;
Labels.train_labels = train_sample_labels;
Labels.test_labels = test_sample_labels;

[train_samples, base]=pca1(train_samples, 100);
[sw, sb] = computswb(train_samples,cNum,train_perc);

acc_ = [];
for tempD = 5:5:50
    vsort = projectto(sw, sb, tempD);
    train_sample = train_samples * vsort;
   
    test_sample = test_samples * base* vsort ;
    acc = computaccu(test_sample, train_sample, Labels, dist);
    acc_ = [acc_, acc];
end

end