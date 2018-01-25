p = 0.05; % increment by 0.05 up until 1 
lastp = 0.6;

numRows = int8((lastp-0.05)/0.05);
ResultMatrix = zeros(numRows , 2); %initialize empty

for j = 0: numRows % for each p
    p = 0.05+double(j)*0.05;
    errorSum = 0;
    numTrials = 5000;
    for k = 1:numTrials % take average over 10 values, arbitrarily for now
        %Generate random message
        m = rand(1,4) < 0.5;
        %Generator Matrix G = [1 0 0 0 1 1 1 0;0 1 0 0 1 1 0 1; 0 0 1 0 1 0 1 1; 0 0 0 1 0 1 1 1];
        G= [eye(4),rot90(~eye(4))];
        %Erasure function from channel, p hardcoded to 0.2
        e = rand(1,8) < p;
        %Codeword created from message and Generator 
        c = mod (m*G,2);
        %Erase part of the codeword using erasure channel
        y = mod (c+e,2);
        %init codebook
        codebook = zeros(16,8);

        chat = [];
        v = 9; % Set initial hamming distance to arbitrary max greater than 8

        for i = 0:(2^4-1)
           codebook(i+1,:) = mod(de2bi(i,4,'left-msb')*G,2);%generate codebook entry while decoding
           if v >sum(abs(y-codebook(i+1,:))) %found a codeword with a lower hamming distance
              v = sum(abs(y-codebook(i+1,:)));
              chat = codebook(i+1,:);
           end
        end
        mhat = chat(1:4);
        %find number of different bits between mhat and m 
        numDiffs = sum(abs(mhat-m));
        errorSum = errorSum+numDiffs;
    end
    errorAvg = (errorSum/numTrials)/length(m);
    ResultMatrix(j+1,:) = [p,  errorAvg];
end 
xlabel('P_error');
ylabel('Error Rate');
plot(ResultMatrix(:,1),ResultMatrix(:,2));
