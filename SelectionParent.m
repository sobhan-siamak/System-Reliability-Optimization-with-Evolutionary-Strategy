function [ crossgeneration ] = SelectionParent( population,generation,n )
 
   n0=0;
   n1=5;
   n2=10;
   crossgeneration=zeros(7*population,n);
   for i=1:7*population
       p1=randi([1,population]);
       p2=randi([1,population]);
       while(p2==p1)
           p2=randi([1,population]);
       end
       
       parentN1=generation(p1,1:n1);
       parentR1=generation(p1,n1+1:end);
       
       parentN2=generation(p2,1:n1);
       parentR2=generation(p2,n1+1:end);
       
       
       N=CrossoverN(parentN1,parentN2,n1);
       R=CrossoverR(parentR1,parentR2,n1);
       
       
       offspring=[N,R];
       crossgeneration(i,:)=offspring;
       
    
           
       
       
       
       
       
       
       
       
       
   end

  


end

