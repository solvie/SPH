
%Generate random message
m = rand(1,4) < 0.5;
%Generator Matrix G = [1 0 0 0 1 1 1 0;0 1 0 0 1 1 0 1; 0 0 1 0 1 0 1 1; 0 0 0 1 0 1 1 1];
G= [eye(4),rot90(~eye(4))];

%Erasure function from channel
e = 0.5*(rand(1,8) < 0.2);
%Codeword created from message and Generator 
c = mod (m*G,2);
%Erase part of the codeword using erasure channel
y = abs(c-e);

%init codebook
codebook = zeros(16,8);

for i = 0:(2^4-1)
   codebook(i+1,:) = mod(de2bi(i,4,'left-msb')*G,2);%generate codebook entry while decoding
   if max(abs(y-codebook(i+1,:))) ~= 1 %A match was found
      disp('decoded');
      disp(codebook(i+1,:));
      disp('message');
      disp(m);
      break
   end
end