function [ retval ] = gaussiandecode844( message )
    %message= [0.5, 0.5, 0.5, 1, 0.5,1,0,0];

    %case 1: 0 error- message returned
    if(sum(message(1:4) ==0.5)>0)
        % if errors exist
        while(sum(message(1:4) ==0.5)~=0)
            error_index=find(message==0.5);
            
            eqn1= [message(1),message(2),message(3), message(5)];
            eqn1_index= [1,2,3,5];
            erasures_eqn1= find(eqn1==0.5);
            eqn2= [message(1),message(2),message(4), message(6)];
            eqn2_index= [1,2,4,6];
            erasures_eqn2= find(eqn2==0.5);
            eqn3= [message(1),message(3),message(4), message(7)];
            eqn3_index= [1,3,4,7];
            erasures_eqn3= find(eqn3==0.5);
            eqn4= [message(2),message(3),message(4), message(8)];
            eqn4_index= [2,3,4,8];
            erasures_eqn4= find(eqn4==0.5);

            length_erasures= [length(erasures_eqn1), length(erasures_eqn2),length(erasures_eqn3), length(erasures_eqn4)];
            three_erasure_eqn= find(length_erasures == 3) ;
            two_erasure_eqn= find(length_erasures == 2) ;

            if length(find(length_erasures >= 3))>=2 || length(find(length_erasures == 2))>=3
                disp('More than 3 errors');
                % randomly guess the message
                while ~isempty(error_index)
                    message(error_index(1))= rand(1,1) < 0.5;
                    error_index=find(message==0.5);
                end
                break;
            end
            
            if ( length(erasures_eqn1)==1)
                eqn1(erasures_eqn1)=0;
                eqn1(erasures_eqn1)=mod(sum(eqn1), 2);
                message(eqn1_index(erasures_eqn1))= eqn1(erasures_eqn1);
                continue;
            end
            if ( length(erasures_eqn2)==1)
                eqn2(erasures_eqn2)=0;
                eqn2(erasures_eqn2)=mod(sum(eqn2), 2);
                message(eqn2_index(erasures_eqn2))= eqn2(erasures_eqn2);
                continue;
            end
            if ( length(erasures_eqn3)==1)
                eqn3(erasures_eqn3)=0;
                eqn3(erasures_eqn3)=mod(sum(eqn3), 2);
                message(eqn3_index(erasures_eqn3))= eqn3(erasures_eqn3);
                continue;
            end
            if ( length(erasures_eqn4)==1)
                eqn4(erasures_eqn4)=0;
                eqn4(erasures_eqn4)=mod(sum(eqn4), 2);
                message(eqn4_index(erasures_eqn4))= eqn4(erasures_eqn4);
                continue;
            end

            if length(three_erasure_eqn)==1
                switch three_erasure_eqn(1)
                    case 1
                        %r3==r4
                        %r2==r4
                        %r1==r4
                        if (message(6)==message(5))
                            message(3) = message(4);
                        end
                        if (message(6)~=message(5))
                            message(3) = ~message(4);
                        end
                        continue;
                    case 2
                        %r2==r3
                        %r1==r3
                        %r4==r3
                        if (message(5)==message(6))
                            message(4) = message(3);
                        end
                        if (message(5)~=message(6))
                            message(4) = ~message(3);
                        end
                        continue;
                    case 3
                        %r1==r2
                        %r4==r2
                        %r3==r2
                        if (message(6)==message(7))
                            message(3) = message(2);
                        end
                        if (message(6)~=message(7))
                            message(3) = ~message(2);
                        end
                        continue;
                    case 4
                        %r4==r1
                        %r3==r1
                        %r2==r1
                        if (message(7)==message(8))
                            message(2) = message(1);
                        end
                        if (message(7)~=message(8))
                            message(2) = ~message(1);
                        end
                        continue;
                    otherwise
                        disp('BIG PROBLEM');
                        break;
                end
            end
        end
    end
    retval=message(1:4);
end