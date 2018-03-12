function [ codeword ] = viterbi_decode_844( r )
    CodeBits = inf(4,4);
    CodeBits(1, :) = [0,3,2,1]; %encode two bits decimal bits
    
    SurvivorEdges = inf(4,4);%stores the edge weights (will become 3D matrix)
    SurvivorPres = zeros(4,2);%index (i,j) indicates the ith node at stage j (offset 1) and the value is its predecessor 
        
    %Edge vals stage 1 (m1, m2)
    SurvivorEdges(1,1) = r(1)^2+r(2)^2;
    SurvivorEdges(1,2) = (r(1)-1)^2+(r(2)-1)^2;
    SurvivorEdges(1,3) = (r(1)-1)^2+(r(2))^2;
    SurvivorEdges(1,4) = (r(1))^2+(r(2)-1)^2;
    
    %Finding survivors stage 2 (m3,pv1)
    SurvivorEdges(:,:,2) = inf(4,4);
    CodeBits(:,:,2) = inf(4,4);
    
    d00 = r(3)^2+r(5)^2;
    d11 = (r(3)-1)^2+(r(5)-1)^2;
    d10 = (r(3)-1)^2+ r(5)^2;
    d01 = r(3)^2+(r(5)-1)^2;
    
    if (d00<d11)
       SurvivorPres(1,1)=1;
       SurvivorPres(2,1)=2;
       SurvivorEdges(1,1,2) = d00;
       SurvivorEdges(2,2,2) = d00;
       CodeBits(1,1,2)= 0;
       CodeBits(2,2,2)= 0;
    else
       SurvivorPres(1,1)=2;
       SurvivorPres(2,1)=1;
       SurvivorEdges(1,2,2)= d11;
       SurvivorEdges(2,1,2) = d11;
       CodeBits(1,2,2)= 3;
       CodeBits(2,1,2)= 3;
    end
    if (d10<d01)
       SurvivorPres(3,1)=4;
       SurvivorPres(4,1)=3; 
       SurvivorEdges(3,4,2) = d10;
       SurvivorEdges(4,3,2) = d10;
       CodeBits(3,4,2)= 2;
       CodeBits(4,3,2)= 2;
    else
       SurvivorPres(3,1)=3;
       SurvivorPres(4,1)=4;
       SurvivorEdges(3,3,2) = d01;
       SurvivorEdges(4,4,2) = d01;
       CodeBits(3,3,2)= 1;
       CodeBits(4,4,2)= 1;
    end
    
    %Finding survivors stage 3 (m4,p2)
    SurvivorEdges(:,:,3) = inf(4,4);
    CodeBits(:,:,3) = inf(4,4);
    
    d00 = r(4)^2+r(6)^2;
    d11 = (r(4)-1)^2+(r(6)-1)^2;
    d10 = (r(4)-1)^2+ r(6)^2;
    d01 = r(5)^2+(r(6)-1)^2;
    
    if (d00<d11)
       SurvivorPres(1,2)=1;
       SurvivorPres(2,2)=2; 
       SurvivorEdges(1,1,3) = d00;
       SurvivorEdges(2,2,3) = d00;
       CodeBits(1,1,3) = 0;
       CodeBits(2,2,3) = 0;
    else
       SurvivorPres(1,2)=2;
       SurvivorPres(2,2)=1;
       SurvivorEdges(1,2,3)= d11;
       SurvivorEdges(2,1,3) = d11;
       CodeBits(1,2,3)= 3;
       CodeBits(2,1,3) = 3;
    end
    if (d10<d01)
       SurvivorPres(3,2)=4;
       SurvivorPres(4,2)=3; 
       SurvivorEdges(3,4,3) = d10;
       SurvivorEdges(4,3,3) = d10;
       CodeBits(3,4,3)= 2;
       CodeBits(4,3,3)= 2;
    else
       SurvivorPres(3,2)=3;
       SurvivorPres(4,2)=4;
       SurvivorEdges(3,3,3) = d01;
       SurvivorEdges(4,4,3) = d01;
       CodeBits(3,3,3)= 1;
       CodeBits(4,4,3)= 1;
    end
    
    %survivor vals stage 4 (p3, p4)
    SurvivorEdges(:,:,4) = inf(4,4);
    CodeBits(:,:,4) = inf(4,4);
    SurvivorEdges(1,1,4) = r(7)^2+r(8)^2;
    SurvivorEdges(2,1,4) = (r(7)-1)^2+(r(8)-1)^2;
    SurvivorEdges(3,1,4) = (r(7)-1)^2+(r(8))^2;
    SurvivorEdges(4,1,4) = (r(7))^2+(r(8)-1)^2;
    CodeBits(1,1,4) = 0;
    CodeBits(2,1,4) = 3;
    CodeBits(3,1,4) = 2;
    CodeBits(4,1,4) = 1;

    %construct each of the 4 paths
    pathmatrix = zeros(4,3);
    for i = 1:4 
        pathmatrix(i,3)= i;
        pathmatrix(i,2)= SurvivorPres(i,2);
        pathmatrix(i,1)= SurvivorPres(pathmatrix(i,2),1);
    end
    pathmatrix = [ones(4,1),pathmatrix,ones(4,1)];
    %disp(pathmatrix);
    
    DistanceVector = zeros(4,1);
    for i = 1:4
        DistanceVector(i) = SurvivorEdges(pathmatrix(i,1),pathmatrix(i,2),1)+ SurvivorEdges(pathmatrix(i,2),pathmatrix(i,3),2)+ SurvivorEdges(pathmatrix(i,3),pathmatrix(i,4),3)+ SurvivorEdges(pathmatrix(i,4),pathmatrix(i,5),4);
    end

    [minDistance, i]= min(DistanceVector);

    SimplifiedVector = [CodeBits(pathmatrix(i,1),pathmatrix(i,2),1), CodeBits(pathmatrix(i,2),pathmatrix(i,3),2), CodeBits(pathmatrix(i,3),pathmatrix(i,4),3), CodeBits(pathmatrix(i,4),pathmatrix(i,5),4)];

    codeword = [de2bi(SimplifiedVector(1), 2,'left-msb' ),de2bi(SimplifiedVector(2), 2,'left-msb'),de2bi(SimplifiedVector(3), 2,'left-msb'),de2bi(SimplifiedVector(4), 2,'left-msb')];
    temp= codeword(4);
    codeword(4)= codeword(5);
    codeword(5)= temp;
    disp(codeword);
end

