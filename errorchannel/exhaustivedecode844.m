stepsize=0.02;
lastp = 0.6;
random = 0.5;

numRows = int8((lastp)/stepsize);
ResultMatrix = zeros(numRows , 2); %initialize empty

%init codebook
codebook = linearblockcodebook844();

for j = 0: numRows % for each p
    p = double(j)*stepsize;
    errorSum = 0;
    numTrials = 50000;
    for k = 1:numTrials
        numDiffs = testencodedecodeexhaustive844(p, codebook, true);
        errorSum = errorSum+numDiffs;
    end
    errorAvg = (errorSum/numTrials)/4.0;
    ResultMatrix(j+1,:) = [p,  errorAvg];
end 

plot(ResultMatrix(:,1),ResultMatrix(:,2));
title('BER For Channel Exhaustive Decode ');
xlabel('P_{error}');
ylabel('Error Rate');
