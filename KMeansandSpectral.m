clc;
clear;
load('hw06-data1.mat');
dataset1=X;
dataset1=dataset1.';
load('hw06-data2.mat');
dataset2=X;
dataset2=dataset2.';
mkr = ["^","x","p","h","+","d","s","*"];
color = ["k", "b", "y","r", "k", "m", "g","c"];

%% K Means Clustering 2-4-8 Case

[clustereddata]=Kmeansolver(dataset2,2);
clustereddata=sortrows(clustereddata);
cluster2=[];

clustereddatacm=clustereddata(:,1);
sepclusterKM2=[];

for i=1:2
    index=find(clustereddatacm==i);
    newcluster=clustereddata(index,2:3);
    sepclusterKM2=[sepclusterKM2 struct('Index',i,'Data',newcluster)];
end

for i=1:2
    title('2 Class K-Means Clustering');
    scatter(sepclusterKM2(i).Data(:,1),sepclusterKM2(i).Data(:,2),mkr(i),color(i));
    xlabel('X');
    ylabel('Y');
    hold on;
end

[clustereddata]=Kmeansolver(dataset2,4);
clustereddata=sortrows(clustereddata);
cluster4=[];

figure; 

clustereddatacm=clustereddata(:,1);
sepclusterKM4=[];

for i=1:4
    index=find(clustereddatacm==i);
    newcluster=clustereddata(index,2:3);
    sepclusterKM4=[sepclusterKM4 struct('Index',i,'Data',newcluster)];
end

for i=1:4
    title('4 Class K-Means Clustering');
    scatter(sepclusterKM4(i).Data(:,1),sepclusterKM4(i).Data(:,2),mkr(i),color(i));
    xlabel('X');
    ylabel('Y');
    hold on;
end

hold off;

[clustereddata]=Kmeansolver(dataset2,8);
clustereddata=sortrows(clustereddata);
cluster8=[];

figure;

clustereddatacm=clustereddata(:,1);
sepclusterKM8=[];

for i=1:8
    index=find(clustereddatacm==i);
    newcluster=clustereddata(index,2:3);
    sepclusterKM8=[sepclusterKM8 struct('Index',i,'Data',newcluster)];
end

for i=1:8
    title('8 Class K-Means Clustering');
    scatter(sepclusterKM8(i).Data(:,1),sepclusterKM8(i).Data(:,2),mkr(i),color(i));
    xlabel('X');
    ylabel('Y');
    hold on;
end

%% Spectral Clustering


data_spectral=Spectralsolver(dataset2,2);

spectralclustereddata=sortrows(data_spectral);
cluster2=[];

spectralclustereddatacm=spectralclustereddata(:,1);
sepclusterSC1=[];

figure;

for i=1:2
    index=find(spectralclustereddatacm==i);
    newcluster=spectralclustereddata(index,2:3);
    sepclusterSC1=[sepclusterSC1 struct('Index',i,'Data',newcluster)];
end

for i=1:2
    title('2 Class Spectral Clustering');
    scatter(sepclusterSC1(i).Data(:,1),sepclusterSC1(i).Data(:,2),mkr(i),color(i));
    xlabel('X');
    ylabel('Y');
    hold on;
end

index41=find(spectralclustereddatacm==1);

workingdata41=spectralclustereddata(index41,2:3);

index42=find(spectralclustereddatacm==2);

workingdata42=spectralclustereddata(index42,2:3);

data_spectral41=Spectralsolver(workingdata41,2);

spectralclustereddata41=sortrows(data_spectral41);

[NumSamples41,~]=size(spectralclustereddata41);

for i=1:NumSamples41
    spectralclustereddata41(i,1)=spectralclustereddata41(i,1)+2;
end

spectralclustereddatacm41=spectralclustereddata41(:,1);
sepcluster41=[];

figure;

for i=1:2
    index=find(spectralclustereddatacm41==i+2);
    newcluster=spectralclustereddata41(index,2:3);
    sepcluster41=[sepcluster41 struct('Index',i+2,'Data',newcluster)];
end

for i=1:2
    title('4 Class Spectral Clustering');
    scatter(sepcluster41(i).Data(:,1),sepcluster41(i).Data(:,2),mkr(i),color(i));
    xlabel('X');
    ylabel('Y');
    hold on;
end

data_spectral42=Spectralsolver(workingdata42,2);

spectralclustereddata42=sortrows(data_spectral42);

[NumSamples42,~]=size(spectralclustereddata42(:,2));

cluster2=[];

spectralclustereddatacm42=spectralclustereddata42(:,1);
sepcluster42=[];

for i=1:2
    index=find(spectralclustereddatacm42==i);
    newcluster=spectralclustereddata42(index,2:3);
    sepcluster42=[sepcluster42 struct('Index',i,'Data',newcluster)];
end

for i=1:2
    title('4 Class Spectral Clustering');
    scatter(sepcluster42(i).Data(:,1),sepcluster42(i).Data(:,2),mkr(i+5),color(i+5));
    xlabel('X');
    ylabel('Y');
    hold on;
end

index4181=find(spectralclustereddatacm41==3);

workingdata4181=spectralclustereddata41(index4181,2:3);

index4182=find(spectralclustereddatacm41==4);

workingdata4182=spectralclustereddata41(index4182,2:3);

index4283=find(spectralclustereddatacm42==1);

workingdata4283=spectralclustereddata42(index4283,2:3);

index4284=find(spectralclustereddatacm42==2);

workingdata4284=spectralclustereddata42(index4284,2:3);



data_spectral4181=Spectralsolver(workingdata4181,2);

spectralclustereddata4181=sortrows(data_spectral4181);

[NumSamples4181,~]=size(spectralclustereddata4181);

figure;

for i=1:NumSamples4181
    spectralclustereddata4181(i,1)=spectralclustereddata4181(i,1);
end

spectralclustereddatacm4181=spectralclustereddata4181(:,1);
sepcluster4181=[];

for i=1:2
    index=find(spectralclustereddatacm4181==i);
    newcluster=spectralclustereddata4181(index,2:3);
    sepcluster4181=[sepcluster4181 struct('Index',i,'Data',newcluster)];
end

for i=1:2
    title('8 Class Spectral Clustering');
    scatter(sepcluster4181(i).Data(:,1),sepcluster4181(i).Data(:,2),mkr(i),color(i));
    xlabel('X');
    ylabel('Y');
    hold on;
end


data_spectral4182=Spectralsolver(workingdata4182,2);

spectralclustereddata4182=sortrows(data_spectral4182);

[NumSamples4182,~]=size(spectralclustereddata4182);


for i=1:NumSamples4182
    spectralclustereddata4182(i,1)=spectralclustereddata4182(i,1)+2;
end

spectralclustereddatacm4182=spectralclustereddata4182(:,1);
sepcluster4182=[];

for i=1:2
    index=find(spectralclustereddatacm4182==i+2);
    newcluster=spectralclustereddata4182(index,2:3);
    sepcluster4182=[sepcluster4182 struct('Index',i+2,'Data',newcluster)];
end

for i=1:2
    title('8 Class Spectral Clustering');
    scatter(sepcluster4182(i).Data(:,1),sepcluster4182(i).Data(:,2),mkr(i+2),color(i+2));
    xlabel('X');
    ylabel('Y');
    hold on;
end


data_spectral4283=Spectralsolver(workingdata4283,2);

spectralclustereddata4283=sortrows(data_spectral4283);

[NumSamples4283,~]=size(spectralclustereddata4283);


for i=1:NumSamples4283
    spectralclustereddata4283(i,1)=spectralclustereddata4283(i,1)+4;
end

spectralclustereddatacm4283=spectralclustereddata4283(:,1);
sepcluster4283=[];

for i=1:2
    index=find(spectralclustereddatacm4283==i+4);
    newcluster=spectralclustereddata4283(index,2:3);
    sepcluster4283=[sepcluster4283 struct('Index',i+4,'Data',newcluster)];
end

for i=1:2
    title('8 Class Spectral Clustering');
    scatter(sepcluster4283(i).Data(:,1),sepcluster4283(i).Data(:,2),mkr(i+4),color(i+4));
    xlabel('X');
    ylabel('Y');
    hold on;
end

data_spectral4284=Spectralsolver(workingdata4284,2);

spectralclustereddata4284=sortrows(data_spectral4284);

[NumSamples4284,~]=size(spectralclustereddata4284);

for i=1:NumSamples4284
    spectralclustereddata4284(i,1)=spectralclustereddata4284(i,1)+6;
end

spectralclustereddatacm4284=spectralclustereddata4284(:,1);
sepcluster4284=[];

for i=1:2
    index=find(spectralclustereddatacm4284==i+6);
    newcluster=spectralclustereddata4284(index,2:3);
    sepcluster4284=[sepcluster4284 struct('Index',i+6,'Data',newcluster)];
end

for i=1:2
    title('8 Class Spectral Clustering');
    scatter(sepcluster4284(i).Data(:,1),sepcluster4284(i).Data(:,2),mkr(i+6),color(i+6));
    xlabel('X');
    ylabel('Y');
    hold on;
end
%% Cost calculation KMeans

sum=0;
sumfinale=0;

for z=1:2
    [iterations,~]=size(sepclusterKM2(z).Data);
    for i=1:iterations
        for j=1:iterations
            sum=sum+(norm(sepclusterKM2(z).Data(i,:)-sepclusterKM2(z).Data(j,:))^2);
        end
    end
    sumfinale=sumfinale+sum/iterations;
    sum=0;
end

costKM2=sumfinale/2;

sum=0;
sumfinale=0;

for z=1:4
    [iterations,~]=size(sepclusterKM4(z).Data);
    for i=1:iterations
        for j=1:iterations
            sum=sum+(norm(sepclusterKM4(z).Data(i,:)-sepclusterKM4(z).Data(j,:))^2);
        end
    end
    sumfinale=sumfinale+sum/iterations;
    sum=0;
end

costKM4=sumfinale/2;

sum=0;
sumfinale=0;

for z=1:8
    [iterations,~]=size(sepclusterKM8(z).Data);
    for i=1:iterations
        for j=1:iterations
            sum=sum+(norm(sepclusterKM8(z).Data(i,:)-sepclusterKM8(z).Data(j,:))^2);
        end
    end
    sumfinale=sumfinale+sum/iterations;
    sum=0;
end

costKM8=sumfinale/2;

%% Cost calculation Spectral


sum=0;
sumfinale=0;

for z=1:2
    [iterations,~]=size(sepclusterSC1(z).Data);
    for i=1:iterations
        for j=1:iterations
            sum=sum+(norm(sepclusterSC1(z).Data(i,:)-sepclusterSC1(z).Data(j,:))^2);
        end
    end
    sumfinale=sumfinale+sum/iterations;
    sum=0;
end

costSC2=sumfinale/2;


sepclusterSC4= [sepcluster42 sepcluster41];
sum=0;
sumfinale=0;

for z=1:4
    [iterations,~]=size(sepclusterSC4(z).Data);
    for i=1:iterations
        for j=1:iterations
            sum=sum+(norm(sepclusterSC4(z).Data(i,:)-sepclusterSC4(z).Data(j,:))^2);
        end
    end
    sumfinale=sumfinale+sum/iterations;
    sum=0;
end

costSC4=sumfinale/2;


sepclusterSC8= [sepcluster4181 sepcluster4182 sepcluster4283 sepcluster4284];
sum=0;
sumfinale=0;

for z=1:8
    [iterations,~]=size(sepclusterSC8(z).Data);
    for i=1:iterations
        for j=1:iterations
            sum=sum+(norm(sepclusterSC8(z).Data(i,:)-sepclusterSC8(z).Data(j,:))^2);
        end
    end
    sumfinale=sumfinale+sum/iterations;
    sum=0;
end

costSC8=sumfinale/2;
