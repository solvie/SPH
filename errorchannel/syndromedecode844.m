stepsize=0.05;
lastp = 1;
random = 0.5;

numRows = int8((lastp)/stepsize);
ResultMatrix = zeros(numRows , 2); %initialize empty

%Generator Matrix G = [1 0 0 0 1 1 1 0;0 1 0 0 1 1 0 1; 0 0 1 0 1 0 1 1; 0 0 0 1 0 1 1 1];
G= [eye(4),rot90(~eye(4))];
% Parity Check Matrix H
H= [rot90(~eye(4)),eye(4)];

%init codebook
codebook = zeros(16,8);
for i = 0:(2^4-1)
   codebook(i+1,:) = mod(de2bi(i,4,'left-msb')*G,2);%generate codebook entry
end


%Generate the syndrome table error side
E = [zeros(1,8);eye(8,8)];

%Generate the syndrome table syndrome side
Syn= zeros(1,4);
for i = 2: length(E)
    s = mod(H*E(i,:)',2);
    Syn=[Syn;s'];
end


codebook = logical(codebook);

for j = 0: numRows % for each p
    p = double(j)*stepsize;
    errorSum = 0;
    numTrials = 50000;
    index =10;
    for k = 1:numTrials % take average over 10 values, arbitrarily for now
        %Generate random message
        m = rand(1,4) < random;
        %Bit Error function from channel, p hardcoded to 0.2
        e = rand(1,8) < p;
        %Codeword created from message and Generator 
        c = mod (m*G,2);
        %Corrupt part of the codeword using bit error channel
        r = mod (c+e,2);
       
        Hrt =mod( H*r',2);
        for i = 1: length(Syn)
           if max(abs(Hrt'-Syn(i,:)))==0 
              index = i;
              break
           end
        end
        if index==10 % if not found, max error
            numDiffs=4;
        else 
            ehat = E(index,:);
            chat = mod(ehat+r,2);
            mhat = chat(1:4);
            numDiffs = sum(abs(mhat-m));
        end
        errorSum = errorSum+numDiffs;
    end
    errorAvg = (errorSum/numTrials)/length(m);
    ResultMatrix(j+1,:) = [p,  errorAvg];
end 

plot(ResultMatrix(:,1),ResultMatrix(:,2));
title('BER For Channel Syndrome Decode ');
xlabel('P_{error}');
ylabel('Error Rate');
