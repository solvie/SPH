% viterbi BER

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
        retval = viterbi_decode_844(r);
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