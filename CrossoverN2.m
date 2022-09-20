function [ N ] = CrossoverN2( p1,p2,n1 )


[m,n]=size(p1);
 N=zeros(m,n);
 
 
    for i=1:n1
      if(rand>0.5)
        N(1,i)=p1(1,i);
      else
        N(1,i)=p2(1,i); 
      end
        
    end


end

