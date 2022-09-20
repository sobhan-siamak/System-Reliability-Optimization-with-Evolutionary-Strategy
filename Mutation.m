function [ otherGeneration ] = Mutation( crossgeneration )

  [m,n]=size(crossgeneration);
  otherGeneration=zeros(m,n);
  p=10;
  tau=1/(sqrt(p));
  epsilon0=0.0001;
  n0=0;
  n1=5;
  n2=10;
  n3=11;
  
  nrd=normrnd(0,1);
  for i=1:m
      sigma=crossgeneration(i,n3);
      sigmaprim=sigma*(exp(tau*nrd));
      if(sigmaprim<epsilon0)
          sigmaprim=epsilon0;
      end
      sigma=sigmaprim;
      for j=1:n-1
         N=crossgeneration(i,1:n1);
         R=crossgeneration(i,n1+1:n2);
         
         
         
         if(j<=n1)
           N(j)=N(j)+sigmaprim*nrd;
           if(rand<0.5)
                  N(j)=ceil(N(j));
           else
                  N(j)=floor(N(j));
           end
         end
         if(j>=n1+1)
           R(j-n1)=R(j-n1)+sigmaprim*nrd;
           if(R(j-n1)>=1)
               tmp=R(j-n1)-1;
               tmp=tmp+1000*epsilon0;
               R(j-n1)=R(j-n1)-tmp;
           end
           if(R(j-n1)<=0)
               R(j-n1)=epsilon0;
           end
           
         end
          
      end
      
      otherGeneration(i,:)=[N,R,sigma];
  end
  
  
  
     
    


   

end

