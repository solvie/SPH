stepsize=0.02;
lastp = 1;
numTrials = 10000;
numsteps = int8(lastp/stepsize);
ResultMatrixGaus = zeros(numsteps , 2); %initialize empty
ResultMatrixEx = zeros(numsteps , 2); %initialize empty

%Generate codebook for exhaustive decoding
codebook = linearblockcodebook844();

for j = 0: numsteps
    p = double(j)*stepsize;
    errorSumGaus = 0.0;
    errorSumEx = 0.0;
    for k = 1:numTrials
        retvalGaus = testgaussiandecode(p, false);
        if retvalGaus==false
            errorSumGaus= errorSumGaus+1;
        end
        retvalEx = testencodedecodeexhaustive844(p, codebook, false);
        if retvalEx==false
            errorSumEx= errorSumEx+1;
        end
    end
    ResultMatrixGaus(j+1,:) = [p,  errorSumGaus/numTrials];
    disp( ResultMatrixGaus(j+1,:));
    ResultMatrixEx(j+1,:) = [p,  errorSumEx/numTrials];
    disp( ResultMatrixEx(j+1,:));
end

figure
plot(ResultMatrixGaus(:,1),ResultMatrixGaus(:,2));
hold on
plot(ResultMatrixEx(:,1),ResultMatrixEx(:,2));
hold off

title('BER error channel with gaussian and exhaustive decoding');
legend('Gaussian','Exhaustive');
xlabel('P_{error}');
ylabel('Error Rate');
