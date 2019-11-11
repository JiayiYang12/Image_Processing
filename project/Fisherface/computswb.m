function [sw sb]=computswb(samples,classnum,num)

samplemean=mean(samples);
for i=1:classnum
    newsamplemean(i,:)=mean(samples((i-1)*num+1:i*num,:));
end
sw=0;
for i=1:classnum
    for j=1:num
        sw=sw+(samples((i-1)*num+j,:)-newsamplemean(i,:))'*(samples((i-1)*num+j,:)-newsamplemean(i,:));
    end
end

sb=0;
for i=1:classnum
    sb=sb+(newsamplemean(i,:)-samplemean)'*(newsamplemean(i,:)-samplemean);
end

end