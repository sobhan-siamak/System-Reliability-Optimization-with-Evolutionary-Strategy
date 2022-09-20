function [ generation ] = initgeneration( population,n )

  

generation=zeros(population,n);
[m,n]=size(generation);
n1=5;
n2=10;
epsilon=0.001;
  for i=1:m
      
      for j=1:n1
                generation(i,j)=randi([1,4]);
      end
      for j=n1+1:n2
                generation(i,j) =rand;
                if(generation(i,j)==0)
                    generation(i,j)=generation(i,j)+epsilon;
                end
                if(generation(i,j)==1)
                    generation(i,j)=generation(i,j)-epsilon;
                end
      end
      %generation(i,end)=normrnd(0,1);
      generation(i,end)=rand;
      if(generation(i,end)==0)
           generation(i,j)=generation(i,j)+epsilon;
      end
      if(generation(i,end)==1)
           generation(i,j)=generation(i,j)-epsilon;
      end

      
 end
  


end

