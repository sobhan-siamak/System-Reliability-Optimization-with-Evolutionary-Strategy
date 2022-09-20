function [crossgeneration] = SelectionParent2( population,generation2,ns )
   


   n0=0;
   n1=5;
   n2=10;
   n3=11;
   crossgeneration=zeros(7*population,ns);
   for i=1:7*population
       p1=randi([1,population]);
       p2=randi([1,population]);
       while(p2==p1)
           p2=randi([1,population]);
       end
       
       parentN1=generation2(p1,1:n1);
       parentR1=generation2(p1,n1+1:end);
       
       parentN2=generation2(p2,1:n1);
       parentR2=generation2(p2,n1+1:end);
       
       
       N=CrossoverN2(parentN1,parentN2,n1);
       R=CrossoverR2(parentR1,parentR2,n1);
       
       
       offspring=[N,R];
       crossgeneration(i,:)=offspring;
       
    
           
       
       
       
       
       
       
       
       
       
   end

end

