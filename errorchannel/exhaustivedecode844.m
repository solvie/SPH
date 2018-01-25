stepsize=0.02;
lastp = 1;
random = 0.5;

numRows = int8((lastp)/stepsize);
ResultMatrix = zeros(numRows , 2); %initialize empty

%init codebook
codebook = zeros(16,8);
for i = 0:(2^4-1)
   codebook(i+1,:) = mod(de2bi(i,4,'left-msb')*G,2);%generate codebook entry
end

codebook = logical(codebook);

for j = 0: numRows % for each p
    p = double(j)*stepsize;
    errorSum = 0;
    numTrials = 50000;
    for k = 1:numTrials % take average over 10 values, arbitrarily for now
        %Generate random message
        m = rand(1,4) < random;
        %Generator Matrix G = [1 0 0 0 1 1 1 0;0 1 0 0 1 1 0 1; 0 0 1 0 1 0 1 1; 0 0 0 1 0 1 1 1];
        G= [eye(4),rot90(~eye(4))];
        
        %Bit Error function from channel, p hardcoded to 0.2
        e = rand(1,8) < p;
        %Codeword created from message and Generator 
        c = mod (m*G,2);
        %Corrupt part of the codeword using bit error channel
        y = mod (c+e,2);

        chat = [];
        v = 9; % Set initial hamming distance to arbitrary max greater than 8

        for z = 1:(2^4)
          if v > sum(abs(y-codebook(z,:))) %found a codeword with a lower hamming distance
              v = sum(abs(y-codebook(z,:)));
              chat = codebook(z,:);
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

plot(ResultMatrix(:,1),ResultMatrix(:,2));
title('BER For Channel Exhaustive Decode ');
xlabel('P_{error}');
ylabel('Error Rate');
