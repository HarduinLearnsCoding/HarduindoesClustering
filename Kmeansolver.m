function [data_clustered] = Kmeansolver(workingdata,NumClasses)

[NumSamples,SampleSize]=size(workingdata);
means=workingdata(1:NumClasses,:);
data_clustered=zeros(NumSamples,SampleSize+1);
distancefrommeans=zeros(NumSamples-NumClasses,NumClasses);
summean=zeros(NumClasses,2);
countmean=zeros(NumClasses,1);
threshold=0.04;
quitting=0;

while quitting==0
    
    for i=1:NumSamples
        for j=1:NumClasses
            distancefrommeans(i,j)= sqrt((workingdata(i,1)-means(j,1))^2 + (workingdata(i,2)-means(j,2))^2);
        end
        [~,ClusteredClass]=min(distancefrommeans(i,:));
        data_clustered(i,1)=ClusteredClass;
        data_clustered(i,2:SampleSize+1)=workingdata(i,:);
    end
    
    for i=1:NumSamples
        for j=1:NumClasses
            if data_clustered(i,1)==j
                summean(j,1)=summean(j,1)+data_clustered(i,2);
                summean(j,2)=summean(j,2)+data_clustered(i,3);
                countmean(j,1)=countmean(j,1)+1;
            end
        end
    end
    
    buffer=means;
    
    for i=1:NumClasses
        means(i,1)=summean(i,1)/countmean(i,1);
        means(i,2)=summean(i,2)/countmean(i,1);
    end
    
    sumnormsx=0;
    
    for i=1:NumClasses
        sumnormsx= sumnormsx+norm(means(i,:)-buffer(i,:));
    end
    
    if sumnormsx<threshold 
        quitting=1;
    end
    
end

end

