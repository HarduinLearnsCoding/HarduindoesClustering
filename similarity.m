function [simmatrix] = similarity(workingdata)

simmatrix=[];
[NumSamples,SampleSize]=size(workingdata);

for i=1:NumSamples
    for j=1:NumSamples
        simmatrix(i,j)=exp(-(norm(workingdata(i,:)-workingdata(j,:))^2)/10);
    end
end


end

