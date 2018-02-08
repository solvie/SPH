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
   eqn1= m(5)== xor(xor(m(1),m(2)),m(3));
   eqn2= m(6)== xor(xor(m(1),m(2)),m(4));
   eqn3= m(7)== xor(xor(m(1),m(3)),m(4));
   eqn4= m(8)== xor(xor(m(2),m(3)),m(4));
   
   X(1) = mod(solve(eqn1), 2);
   X(2) = mod(solve(eqn2), 2);
   X(3) = mod(solve(eqn3), 2);
   X(4) = mod(solve(eqn4), 2);
   
   end