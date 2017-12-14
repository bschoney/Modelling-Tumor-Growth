function problog = functiontwo(parameters)

problog = 0;
global ndata T logcellNum
for i = 1:ndata
    mean = functionone(parameters(1),parameters(2),T(i));
    problog = problog + log(normpdf(logcellNum(i),mean,parameters(3)));
end

problog = -problog;

end