function [ c ] = linearblockencoder844( message )
    %Generator Matrix G = [1 0 0 0 1 1 1 0;0 1 0 0 1 1 0 1; 0 0 1 0 1 0 1 1; 0 0 0 1 0 1 1 1];
    G= [eye(4),rot90(~eye(4))];
    %Codeword created from message and Generator 
    c= mod (message*G,2);
end

