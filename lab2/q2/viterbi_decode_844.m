function [ c ] = viterbi_decode_844( r )
    SurvivorVals = zeros(4,4);%stores the minimum distance survivor values
    SurvivorPres = zeros(4,2);%index (i,j) indicates the ith node at stage j (offset 1) and the value is its predecessor 
    
    s1_i = [0 3 2 1]; %encoded binary 2 bit values into integers
    s1_o = [0 3 2 1];
    
    %negative 1 denotes empty, index i,j is edge value from node i to j
    s2_i = [ 0 1 -1 -1;1 0 -1 -1; -1 -1 0 1; -1 -1 1 0];
    s2_o = [0 3 -1 -1;3 0 -1 -1; -1 -1 0 3; -1 -1 3 0];
    
    s3_i = [ 0 1 -1 -1;1 0 -1 -1; -1 -1 0 1; -1 -1 1 0];
    s3_o = [ 1 2 -1 -1;2 1 -1 -1;-1 -1 1 2; -1 -1 2 1 ]; 
    
    s4_o = [0 3 2 1];
    
    %survivor vals stage 1 (m1, m2)
    SurvivorVals(1,1) = r(1)^2+r(2)^2;
    SurvivorVals(2,1) = (r(1)-1)^2+(r(2)-1)^2;
    SurvivorVals(3,1) = (r(1)-1)^2+(r(2))^2;
    SurvivorVals(4,1) = (r(1))^2+(r(2)-1)^2;
    
    %Finding survivors stage 2 (m3,p1)
    d00 = r(3)^2+r(5)^2;
    d11 = (r(3)-1)^2+(r(5)-1)^2;
    d10 = (r(3)-1)^2+ r(5)^2;
    d01 = r(3)^2+(r(5)-1)^2;
    
    if (d00<d11)
       SurvivorPres(1,1)=1;
       SurvivorPres(2,1)=2; 
       SurvivorVals(1,2)=d00;
       SurvivorVals(2,2)=d00;
    else
       SurvivorPres(1,1)=2;
       SurvivorPres(2,1)=1;
       SurvivorVals(1,2)=d11;
       SurvivorVals(2,2)=d11;
    end
    if (d10<d01)
       SurvivorPres(3,1)=4;
       SurvivorPres(4,1)=3; 
       SurvivorVals(3,2)=d10;
       SurvivorVals(4,2)=d10;
    else
       SurvivorPres(3,1)=3;
       SurvivorPres(4,1)=4;
       SurvivorVals(3,2)=d01;
       SurvivorVals(4,2)=d01;
    end
    
    %Finding survivors stage 3 (m4,p2)
    d00 = r(4)^2+r(6)^2;
    d11 = (r(4)-1)^2+(r(6)-1)^2;
    d10 = (r(4)-1)^2+ r(6)^2;
    d01 = r(5)^2+(r(6)-1)^2;
    
    if (d00<d11)
       SurvivorPres(1,2)=1;
       SurvivorPres(2,2)=2; 
       SurvivorVals(1,3)=d00;
       SurvivorVals(2,3)=d00;
    else
       SurvivorPres(1,2)=2;
       SurvivorPres(2,2)=1;
       SurvivorVals(1,3)=d11;
       SurvivorVals(2,3)=d11;
    end
    if (d10<d01)
       SurvivorPres(3,2)=4;
       SurvivorPres(4,2)=3; 
       SurvivorVals(3,3)=d10;
       SurvivorVals(4,3)=d10; 
    else
       SurvivorPres(3,2)=3;
       SurvivorPres(4,2)=4;
       SurvivorVals(3,3)=d01;
       SurvivorVals(4,3)=d01; 
    end
    
    %survivor vals stage 4 (p3, p4)
    SurvivorVals(1,4) = r(7)^2+r(8)^2;
    SurvivorVals(2,4) = (r(7)-1)^2+(r(8)-1)^2;
    SurvivorVals(3,4) = (r(7)-1)^2+(r(8))^2;
    SurvivorVals(4,4) = (r(7))^2+(r(8)-1)^2;
    
    disp('survivorvals');
    disp(SurvivorVals);
    
    disp('SurvivorPres');
    disp(SurvivorPres);
    
    %construct each of the 4 paths
    pathmatrix = zeros(4,3);
    for i = 1:4 
        pathmatrix(i,3)= i;
        pathmatrix(i,2)= SurvivorPres(i,2);
        pathmatrix(i,1)= SurvivorPres(pathmatrix(i,2),1);
    end

    disp(pathmatrix);
    
end

