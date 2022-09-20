function [ FitnessComp,generation2 ] = FitnessComplex2( population,ns,generation2,WB,V,C,beta,wi,wivi2 )


[m,ns]=size(generation2);
     FitnessComp=zeros(m,2);
     R=zeros(m,5);  
     n0=0;
     n1=5;
     n2=10;
     n3=11;
     alpha1=2.330/(10^5);
     alpha2=1.450/(10^5);
     alpha3=0.541/(10^5);
     alpha4=8.050/(10^5);
     alpha5=1.950/(10^5);
     alpha=[alpha1,alpha2,alpha3,alpha4,alpha5];
     
     for i=1:m
        
             R(i,1)=(1-(1-generation2(i,n1+1)).^generation2(i,n0+1));
             R(i,2)=(1-(1-generation2(i,n1+2)).^generation2(i,n0+2));
             R(i,3)=(1-(1-generation2(i,n1+3)).^generation2(i,n0+3));
             R(i,4)=(1-(1-generation2(i,n1+4)).^generation2(i,n0+4));
             R(i,5)=(1-(1-generation2(i,n1+5)).^generation2(i,n0+5));
          for j=1:5
             g1=(sum(wivi2(j)*(generation2(i,j).^2)));
             if((g1-V)>0)
                 generation2(i,j)=1;
             end
             g2=sum(alpha(j)*((-1000/(log(generation2(i,n1+j)))).^beta))*(generation2(i,n0+j)+exp(0.25*generation2(i,n0+j)));
             if((g1-C)>0)
                 generation2(i,n0+j)=1;
             end
             g3=sum(wi(j)*generation2(i,n0+j)*exp(0.25*generation2(i,n0+j)));
             if((g1-WB)>0)
                 generation2(i,n0+j)=1;
             end
          end
          g1=g1-V;
          g2=g2-C;
          g3=g3-WB;
             
          if(g1<=0 && g2<=0 && g3<=0)
              FitnessComp(i,1)=((R(i,1)*R(i,2))+(R(i,3)*R(i,4))+(R(i,1)*R(i,4)*R(i,5))+(R(i,2)*R(i,3)*R(i,5))-(R(i,1)*R(i,2)*R(i,3)*R(i,4))-(R(i,1)*R(i,2)*R(i,3)*R(i,5))-(R(i,1)*R(i,2)*R(i,4)*R(i,5))-(R(i,1)*R(i,3)*R(i,4)*R(i,5))-(R(i,2)*R(i,3)*R(i,4)*R(i,5))-(R(i,2)*R(i,3)*R(i,4)*R(i,5))+2*(R(i,1)*R(i,2)*R(i,3)*R(i,4)*R(i,5)));
              FitnessComp(i,2)=i;
          else
              FitnessComp(i,1)=0;
              FitnessComp(i,2)=i;
          end
        
         
     end


end

