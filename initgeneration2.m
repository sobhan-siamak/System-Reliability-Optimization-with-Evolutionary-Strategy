function [ generation2 ] = initgeneration2( population,n )


generation2=zeros(population,n);
[m,n]=size(generation2);
n1=5;
n2=10;
n3=11;
epsilon=0.001;
for i=1:m
      
      for j=1:n1
                generation2(i,j)=randi([1,3]);
      end
      for j=n1+1:n2
                generation2(i,j) =rand;
                if(generation2(i,j)==0)
                    generation2(i,j)=generation2(i,j)+epsilon;
                end
                if(generation2(i,j)==1)
                    generation2(i,j)=generation2(i,j)-epsilon;
                end
      end
      for j=n3:n
        generation2(i,j)=rand;
        if(generation2(i,j)==0)
           generation2(i,j)=generation2(i,j)+epsilon;
        end
        if(generation2(i,j)==1)
           generation2(i,j)=generation2(i,j)-epsilon;
        end
      end

      
 end
  





end

