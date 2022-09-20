function [ NewGeneration] = SurvivalSelection2( generation2,otherGeneration,FitnessComp,NewFitnessNext,population,ns )

NewGeneration=zeros(population,ns);

F1=sortrows(FitnessComp);
F1=flipud(F1);

F2=sortrows(NewFitnessNext);
F2=flipud(F2);


%% Mu+Landa   Means Elitism , selection between good parents and good offsprings
for i=1:0.8*population
    NewGeneration(i,:)=otherGeneration(F2(i,2),:);
end
for i=0.8*population+1:population
    NewGeneration(i,:)=generation2(F1(i,2),:);
end
   
%% Mu,Landa   without elitism , selection from good offsprings
% for i=1:population
%     NewGeneration(i,:)=otherGeneration(F2(i,2),:);
% end






end

