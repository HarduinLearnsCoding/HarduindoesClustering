function [data_spectral] = Spectralsolver(workingdata,NumClasses)

[NumSamples,SampleSize]=size(workingdata);
data_spectral=zeros(NumSamples,SampleSize+1);
simmatrix=similarity(workingdata);
eigenproblem=[];

for i=1:NumSamples
    degreeundiag(i,1)=sum(simmatrix(i,:));
end

degreematrix=diag(degreeundiag.');
eigenproblem=(inv(degreematrix)^1/2)*(degreematrix-simmatrix)*(inv(degreematrix)^1/2);
[eigvec,eigval]=eig(eigenproblem,'vector');
[eigval, ind] = sort(eigval);
eigvec = eigvec(:, ind);

eigvec=eigvec(:,2);
y= (inv(degreematrix)^1/2)*eigvec;

for i=1:NumSamples
    y(i,1)=sign(y(i,1));
    data_spectral(i,1)=1+((1+y(i,1))/2);
    data_spectral(i,2:3)=workingdata(i,1:2);
end

end

