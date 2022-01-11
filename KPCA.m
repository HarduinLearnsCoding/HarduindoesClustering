function [V,D] = kernelPCA(X)

N = length(X(1,:));

K = zeros(N);
for i=1:N
    for j=1:N
        K(j,i) = rbf_kernel(X(:,i),X(:,j),50);
    end
end

% compute the normalized kernel matrix
K_norm = K - (1/N)*ones(N)*K + (1/(N^2))*ones(N)*K*ones(N);

% find eigenvalues and eigenvectors
[V,D] = eig(K_norm);

end