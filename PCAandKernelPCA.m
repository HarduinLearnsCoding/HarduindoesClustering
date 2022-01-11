
load('hw06-data1.mat')
workingdata=X;

%% Linear PCA

means = zeros(length(workingdata(:,1)),1);
for i=1:length(workingdata(:,1))
    means(i) = mean(workingdata(i,:));
end
data_norm = workingdata-means;

C = cov(transpose(data_norm));
[eig_V,eig_D] = eig(C);
eig_L = diag(eig_D);

data_pca = zeros(1,length(workingdata(1,:)));
for i=1:length(workingdata(1,:))
    data_pca(i) = transpose(data_norm(:,i))*eig_V(:,1);
end

figure(1)
histogram(data_pca,10);
title(' Linear PCA')
xlabel('Linear Dimension')
ylabel('Sample Frequency')
grid on;


%% Kernel PCA
[V,D] = KPCA(workingdata);
N = 700;

KPCAdata = zeros(1,700);

for j=1:N
    KPCAdata(j) = 0;
    for i=1:N
        KPCAdata(j) = KPCAdata(j) + V(i)*rbf_kernel(workingdata(:,j),workingdata(:,i),50);
    end
end

figure(2)
histogram(KPCAdata,10);
title('Kernel PCA')
xlabel('Linear Dimension')
ylabel('Sample Frequency')
grid on;

