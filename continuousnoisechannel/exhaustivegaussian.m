stepsize=0.01;
lastsigma = 1.5;
sigma= 0.01;

numRows = int8((lastp)/stepsize);
ResultMatrix = zeros(numRows , 2); %initialize empty

codebook = gen_convtl_codebook();

for j = 0: numRows % for each p
    sigma = double(j)*stepsize;
    errorSum = 0;
    numTrials = 10000;
    
    for k = 1:numTrials % take average over 10 values, arbitrarily for now
        numDiffs = testencodedecodeexhaustive(sigma, codebook, false);
        errorSum = errorSum+numDiffs;
    end
    errorAvg = (errorSum/numTrials)/4;
    snr= 10*log(1/(2*(sigma^2)));
    ResultMatrix(j+1,:) = [snr,  errorAvg];
end


semilogx(ResultMatrix(:,1),ResultMatrix(:,2));
title('BER For Gaussian Noise Convolutional Encode Exhaustive Decode ');
xlabel('sigma');
ylabel('Error Rate');
