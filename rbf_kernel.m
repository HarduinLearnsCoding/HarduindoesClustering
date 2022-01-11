
function [result] = rbf_kernel(x,y,sigma)

result = exp(-((norm(x-y))^2)/sigma);

end