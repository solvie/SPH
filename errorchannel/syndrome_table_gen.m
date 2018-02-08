function [Syn] = syndrome_table_gen()
    % Parity Check Matrix H
    H= [rot90(~eye(4)),eye(4)];
    %Generate the syndrome table error side
    E = [zeros(1,8);eye(8,8)];
    %Generate the syndrome table syndrome side
    Syn= zeros(1,4);
    for i = 2: length(E)
        s = mod(H*E(i,:)',2);
        Syn=[Syn;s'];
    end
end

