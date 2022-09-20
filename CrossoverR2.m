function [ R ] = CrossoverR2( p1,p2,n1 )




[m,n]=size(p1);
 R=zeros(m,n);
 
    for i=1:n
        R(1,i)=(p1(1,i)+p2(1,i))/2;%%crossover  r and sigma part in chorom
        
    end

%  for i=1:n
%      if(rand>0.5)
%         R(1,i)=p1(1,i);%%crossover  r and sigma part in chorom
%      else
%          R(1,i)=p2(1,i);%%crossover  r and sigma part in chorom
%      end 
%   end


end

