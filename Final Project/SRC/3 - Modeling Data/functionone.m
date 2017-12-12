function logsum = functionone(lambda, c, t)
    
N0 = 100000;
logsum = log(N0) + (lambda*(1 - exp(-c*t)));

end
