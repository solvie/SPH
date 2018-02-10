%(8,4,4) Linear Block code passed through erasure channel, decoded using
% exhaustive method. Test bench 

stepsize=0.02;
lastp = 1.0;
numTrials = 10000;
numsteps = int8(lastp/stepsize);
ResultMatrix = zeros(numsteps , 2); %initialize empty

%Generate codebook for exhaustive decoding
codebook = linearblockcodebook844();


for j = 0: numsteps
    p = double(j)*stepsize;
    errorSum = 0.0;
    for k = 1:numTrials
        retval = testencodedecodeexhaustive844(p, codebook, false);
        if retval==false
            errorSum= errorSum+1;
        end
    end
    ResultMatrix(j+1,:) = [p,  errorSum/numTrials];
    disp( ResultMatrix(j+1,:));
end

plot(ResultMatrix(:,1),ResultMatrix(:,2));
title('BER For Erasure Channel Exhaustive Decode ');
xlabel('P_{error}');
ylabel('Error Rate');