function accuracy=computaccu(testsample,trainsample,Labels,type)

train_labels = Labels.train_labels;
test_labels = Labels.test_labels;

accu=0;
testsampnum=size(testsample,1);
trainsampnum=size(trainsample,1);
for i=1:testsampnum
    for j=1:trainsampnum
        if strcmp(type, 'l2')
            dist(j)=norm(testsample(i,:)-trainsample(j,:));
        elseif strcmp(type, 'l1')
            dist(j)=sum(abs(testsample(i,:)-trainsample(j,:)));
        else 
            dist(j)=sum(1 - testsample(i,:)*trainsample(j,:)'/(norm(testsample(i,:)) * norm(trainsample(j,:))));
        end
    end
    [temp index]=sort(dist);
    if train_labels(index(1)) == test_labels(i) 
        accu=accu+1;
    end
end
accuracy=accu/testsampnum;
