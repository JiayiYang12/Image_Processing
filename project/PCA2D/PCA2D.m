function acc_ = PCA2D(data, setting)

train_pro = setting.tr_pr;

all_samples = data.all_samples;
cNum = data.cNum;
fperc = data.fperc;

Labels = [];
for i=1:cNum
    Labels = [Labels, ones(1, fperc) * i];
end
Labels = Labels';

acc_= [];
[test, train] = crossvalind('holdOut',fperc * cNum,train_pro);
train_samples=all_samples(:,:,train);
train_data_labels=Labels(train);


test_samples=all_samples(:,:,test);
test_data_labels=Labels(test);

%% 2DPCA
for PC_Num=5:5:50
    acc = 0;
    corN=0;
    [eigvector, eigvalue, meandata,newdim] = pca2drow(train_samples, PC_Num);
    train_alldata=bsxfun(@minus,train_samples,meandata);
    test_alldata=bsxfun(@minus,test_samples,meandata);
    
    for a=1:(1 - train_pro)*fperc * cNum
        test_data=test_alldata(:,:,a);
        test_proj=test_data*eigvector;
        all_result=[];
        for b=1:train_pro*fperc * cNum
            train_data=train_alldata(:,:,b);
            train_proj=train_data*eigvector;
            result=sqrt(sum(sum((train_proj(:,:)-test_proj(:,:)).^2,2)));
            all_result=[all_result,result];
        end
        [~,dmin_inx]=min(all_result);
        if train_data_labels(dmin_inx)==test_data_labels(a)% KNN
            corN=corN+1;
        end
    end

    acc=corN/((1 - train_pro)*fperc * cNum) ;
    acc_ =[acc_, acc];
end

end