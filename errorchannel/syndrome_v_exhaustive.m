stepsize=0.02;
lastp = 1;
random = 0.5;

numRows = int8((lastp)/stepsize);
ResultMatrixSyn = zeros(numRows , 2); %initialize empty
ResultMatrixEx = zeros(numRows , 2); %initialize empty

%init codebook
codebook = linearblockcodebook844();
H = [rot90(~eye(4)),eye(4)];
E= [zeros(1,8); eye(8,8)];
%Generate the syndrome table
Syn = syndrome_table_gen();

for j = 0: numRows % for each p
    p = double(j)*stepsize;
    errorSumSyn = 0;
    errorSumEx = 0;
    numTrials = 5000;
    index =10;
    for k = 1:numTrials
        [ numDiffEx,numDiffsSyn ] = testencodedecodeboth(p, H, E, Syn, codebook,true);
        errorSumSyn = errorSumSyn+numDiffsSyn;
        errorSumEx = errorSumEx+numDiffEx;
    end
    errorAvgS = (errorSumSyn/numTrials)/4;
    errorAvgE = (errorSumEx/numTrials)/4;
    ResultMatrixSyn(j+1,:) = [p,  errorAvgS];
    ResultMatrixEx(j+1, :) = [p, errorAvgE];
end 
figure
plot(ResultMatrixSyn(:,1),ResultMatrixSyn(:,2));
hold on
plot(ResultMatrixEx(:,1),ResultMatrixEx(:,2));
hold off

title('Both.');
legend('Syndrome','Exhaustive');
xlabel('P_{error}');
ylabel('Error Rate');
