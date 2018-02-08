function [ c ] = gaussiandecode844( message )
   m= [sym('m', [1 4]), sym('p', [1 4])];
    for i= 1: length(message)
       if message(i) == 1
           m(i)=1;
       end
       if message(i) == 0
           m(i)=0;
       end
    end
   eqn1= m(5)== m(1)+m(2)+m(3);
   eqn2= m(6)== m(1)+m(2)+m(4);
   eqn3= m(7)== m(1)+m(3)+m(4);
   eqn4= m(8)== m(2)+m(3)+m(4);
   
   X(1) = mod(solve(eqn1), 2);
   X(2) = mod(solve(eqn2), 2);
   X(3) = solve(eqn3);
   X(4) = solve(eqn4);
   end