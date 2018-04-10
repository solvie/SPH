function [ X ] = DTFTcomputatation(signal, exponential )
    syms n;
    n = 0:1:3;
    X = symsum(signal* (exponential.^ n), 0, 3);
end