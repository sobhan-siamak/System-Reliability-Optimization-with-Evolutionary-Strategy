


%%%%%%%%%%%%%%@copy sobhan siamak %%%%%%%%

clc;
clear;
close all;

%% init parameter 
population=50;%%initial population
landa=7*population;%%landa is the number of offspring that created.
n=11;%%length of chromosome for one sigma
ns=20;%%length of chromosome for n sigma
WB=200;
C=175;
V=110;
beta=1.5;
wi=[7,8,8,6,9];
wivi2=[1,2,3,4,2];

%% init generation
tic%%%start time
generation=initgeneration(population,n);%% for one sigma
generationSe=generation;%% for one sigma
generationcount=100;






%%   Complex System

  

 [FitnessComp,generation]=FitnessComplex(population,n,generation,WB,V,C,beta,wi,wivi2);
 BestFitnessComp=zeros(generationcount,1);
 AvgFitnessComp=zeros(generationcount,1);
 %% Main Loop for Complex System 
 for i=1:generationcount
     %% parent selection
     crossgeneration=SelectionParent(population,generation,n);
     %% mutation
     otherGeneration=Mutation(crossgeneration);
     NewFitnessNext=FitnessComplex(population,n,otherGeneration,WB,V,C,beta,wi,wivi2);
     
     %% Survival selection is Mu+landa or Mu,Landa
     
     NewGeneration=SurvivalSelection(generation,otherGeneration,FitnessComp,NewFitnessNext,population,n);
     NewFitness=FitnessComplex(population,n,NewGeneration,WB,V,C,beta,wi,wivi2);
     generation=NewGeneration;
     FitnessComp=NewFitness;
     
     %% Display best Fitness in every Generation
     
     
     BestFitnessComp(i)=max(NewFitness(:,1));
     AvgFitnessComp(i)=(sum(NewFitness(:,1)))/population;
     disp(['Generation in Complex System=   ' num2str(i) '   BestFitness in Complex System=   ' num2str(BestFitnessComp(i))]);
     
      
     
     
     
     
     
 end%%% end of main loop for complex system

FinalFitness=NewFitness;
FinalGeneration=NewGeneration;
FinalFitness=sortrows(FinalFitness);%sort ascending Final Fitness 
FinalFitness=flipud(FinalFitness);%sort descending Final Fitness
bestindex=FinalFitness(1,2);
 
 
 
%%Display Best Solution and Best Fitness in Complex System
disp(['Best Solution in Complex one Sigma=  ' num2str(FinalGeneration(bestindex,:))]);
disp(['Best Fitness Complex one Sigma=   ' num2str(FinalFitness(1,1))]);
disp(['Time is:' num2str(toc)]); % stop Time


%% Plot Best and Average Fitness based on Generations in Complex System
figure(1)
plot(BestFitnessComp,'b');
xlabel('Generation');
ylabel('Fitness');
legend('Best=Blue    AVG=Red');
% legend({'BestFitness', 'AVGFitness'},'Location','southwest','FontSize',12);
title('Complex System with one Sigma');
hold on
plot(AvgFitnessComp,'r');
hold off


%% Series System

tic%%%start time for series system

[FitnessSe,generationSe]=FitnessSeries( population,n,generationSe,WB,V,C,beta,wi,wivi2);
BestFitnessSe=zeros(generationcount,1);
AvgFitnessSe=zeros(generationcount,1);

 %% Main Loop for Series System 
 for j=1:generationcount
     %% parent selection
    crossgenerationSe=SelectionParent(population,generationSe,n);
    %% mutation
     otherGenerationSe=Mutation(crossgenerationSe);
     NewFitnessNextSe=FitnessSeries(population,n,otherGenerationSe,WB,V,C,beta,wi,wivi2);
     %% Survival selection is Mu+landa or Mu,Landa
     
     NewGenerationSe=SurvivalSelection(generationSe,otherGenerationSe,FitnessSe,NewFitnessNextSe,population,n);
     NewFitnessSe=FitnessSeries(population,n,NewGenerationSe,WB,V,C,beta,wi,wivi2);
     generationSe=NewGenerationSe;
     FitnessSe=NewFitnessSe;
     
    %% Display best Fitness in every Generation
    
     BestFitnessSe(j)=max(NewFitnessSe(:,1));
     AvgFitnessSe(j)=(sum(NewFitnessSe(:,1)))/population;
     disp(['Generation in Series System=   ' num2str(j) '   BestFitness in Series System=   ' num2str(BestFitnessSe(j))]);
          
     
 end %%% end of main loop in Series System

 
 
FinalFitnessSe=NewFitnessSe;
FinalGenerationSe=NewGenerationSe;
FinalFitnessSe=sortrows(FinalFitnessSe);%sort ascending Final Fitness 
FinalFitnessSe=flipud(FinalFitnessSe);%sort descending Final Fitness
bestindexSe=FinalFitnessSe(1,2);
 
%%Display Best Solution and Best Fitness in series System
disp(['Best Solution in Series one Sigma=  ' num2str(FinalGenerationSe(bestindexSe,:))]);
disp(['Best Fitness in Series one Sigma=   ' num2str(FinalFitnessSe(1,1))]);
disp(['Time is:' num2str(toc)]); % stop Time


%% Plot Best and Average Fitness based on Generations in series System
figure(2)
plot(BestFitnessSe,'b');
xlabel('Generation');
ylabel('Fitness');
legend('Best=Blue    AVG=Red');
% legend({'BestFitness', 'AVGFitness'},'Location','southwest','FontSize',12);
title('Series System with one Sigma');
hold on
plot(AvgFitnessSe,'r');
hold off


