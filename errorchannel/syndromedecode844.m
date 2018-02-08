stepsize=0.02;
lastp = 0.6;
random = 0.5;

numRows = int8((lastp)/stepsize);
ResultMatrix = zeros(numRows , 2); %initialize empty

%init codebook
codebook = linearblockcodebook844();
H = [rot90(~eye(4)),eye(4)];
E= [zeros(1,8); eye(8,8)];
%Generate the syndrome table
Syn = syndrome_table_gen();

for j = 0: numRows % for each p
    p = double(j)*stepsize;
    errorSum = 0;
    numTrials = 10000;
    index =10;
    for k = 1:numTrials % take average over 10 values, arbitrarily for now
        numDiffs = testencodedecodesyndrome844(p, H, E, Syn, true);
        errorSum = errorSum+numDiffs;
    end
    errorAvg = (errorSum/numTrials)/4;
    ResultMatrix(j+1,:) = [p,  errorAvg];
end 

plot(ResultMatrix(:,1),ResultMatrix(:,2));
title('BER For Channel Syndrome Decode ');
xlabel('P_{error}');
ylabel('Error Rate');
