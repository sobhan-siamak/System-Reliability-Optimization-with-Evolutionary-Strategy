


%%%%%%%%%%%%%%@copy sobhan siamak %%%%%%%%

clc;
clear;
close all;

%% init parameter 
population=50;%%initial population
landa=7*population;%%landa is the number of offspring that created.
ns=20;%%length of chromosome for n sigma
WB=200;
C=175;
V=110;
beta=1.5;
wi=[7,8,8,6,9];
wivi2=[1,2,3,4,2];

%% init generation
tic%%%start time

generation2=initgeneration2(population,ns);%% for n sigma
generationSe=generation2; %% for n sigma
generationcount=100;






%%   Complex System for n Sigma

  

 [FitnessComp,generation2]=FitnessComplex2(population,ns,generation2,WB,V,C,beta,wi,wivi2);
 BestFitnessComp=zeros(generationcount,1);
 AvgFitnessComp=zeros(generationcount,1);
 %% Main Loop for Complex System 
 for i=1:generationcount
     %% parent selection
     crossgeneration=SelectionParent2(population,generation2,ns);
     %% mutation
     otherGeneration=Mutation2(crossgeneration);
     NewFitnessNext=FitnessComplex2(population,ns,otherGeneration,WB,V,C,beta,wi,wivi2);
     
     %% Survival selection is Mu+landa or Mu,Landa
     
     NewGeneration=SurvivalSelection2(generation2,otherGeneration,FitnessComp,NewFitnessNext,population,ns);
     NewFitness=FitnessComplex2(population,ns,NewGeneration,WB,V,C,beta,wi,wivi2);
     generation2=NewGeneration;
     FitnessComp=NewFitness;
     
     %% Display best Fitness in every Generation
     
     
     BestFitnessComp(i)=max(NewFitness(:,1));
     AvgFitnessComp(i)=(sum(NewFitness(:,1)))/population;
     disp(['Generation in Complex N Sigma=   ' num2str(i) '   BestFitness in Complex N Sigma=   ' num2str(BestFitnessComp(i))]);
     
      
     
     
     
     
     
 end%%% end of main loop for complex system

FinalFitness=NewFitness;
FinalGeneration=NewGeneration;
FinalFitness=sortrows(FinalFitness);%sort ascending Final Fitness 
FinalFitness=flipud(FinalFitness);%sort descending Final Fitness
bestindex=FinalFitness(1,2);
 
 
 
%%Display Best Solution and Best Fitness in Complex System
disp(['Best Solution=  ' num2str(FinalGeneration(bestindex,:))]);
disp(['Best Fitness=   ' num2str(FinalFitness(1,1))]);
disp(['Time is:' num2str(toc)]); % stop Time


%% Plot Best and Average Fitness based on Generations in Complex System
figure(1)
plot(BestFitnessComp,'b');
xlabel('Generation');
ylabel('Fitness');
legend('Best=Blue    AVG=Red');
% legend({'BestFitness', 'AVGFitness'},'Location','southwest','FontSize',12);
title('Complex System with N Sigma');
hold on
plot(AvgFitnessComp,'r');
hold off


 %% Series System  for n sigma

tic%%%start time for series system

[FitnessSe,generationSe]=FitnessSeries2( population,ns,generationSe,WB,V,C,beta,wi,wivi2);
BestFitnessSe=zeros(generationcount,1);
AvgFitnessSe=zeros(generationcount,1);

 %% Main Loop for Series System 
 for j=1:generationcount
     %% parent selection
    crossgenerationSe=SelectionParent2(population,generationSe,ns);
    %% mutation
     otherGenerationSe=Mutation2(crossgenerationSe);
     NewFitnessNextSe=FitnessSeries2(population,ns,otherGenerationSe,WB,V,C,beta,wi,wivi2);
     %% Survival selection is Mu+landa or Mu,Landa
     
     NewGenerationSe=SurvivalSelection2(generationSe,otherGenerationSe,FitnessSe,NewFitnessNextSe,population,ns);
     NewFitnessSe=FitnessSeries2(population,ns,NewGenerationSe,WB,V,C,beta,wi,wivi2);
     generationSe=NewGenerationSe;
     FitnessSe=NewFitnessSe;
     
    %% Display best Fitness in every Generation
    
     BestFitnessSe(j)=max(NewFitnessSe(:,1));
     AvgFitnessSe(j)=(sum(NewFitnessSe(:,1)))/population;
     disp(['Generation in Series N Sigma=   ' num2str(j) '   BestFitness in Series N Sigma=   ' num2str(BestFitnessSe(j))]);
          
     
 end %%% end of main loop in Series System

 
 
FinalFitnessSe=NewFitnessSe;
FinalGenerationSe=NewGenerationSe;
FinalFitnessSe=sortrows(FinalFitnessSe);%sort ascending Final Fitness 
FinalFitnessSe=flipud(FinalFitnessSe);%sort descending Final Fitness
bestindexSe=FinalFitnessSe(1,2);
 
%% Display Best Solution and Best Fitness in series System
disp(['Best Solution in Series System with N Sigma =  ' num2str(FinalGenerationSe(bestindexSe,:))]);
% disp('Best Solution in Series System in N Sigma =');
% disp(FinalGenerationSe(bestindexSe,:));
disp(['Best Fitness in Series System with N Sigma=   ' num2str(FinalFitnessSe(1,1))]);
disp(['Time is:' num2str(toc)]); % stop Time


%% Plot Best and Average Fitness based on Generations in series System
figure(2)
plot(BestFitnessSe,'b');
xlabel('Generation');
ylabel('Fitness');
legend('Best=Blue    AVG=Red');
% legend({'BestFitness', 'AVGFitness'},'Location','southwest','FontSize',12);
title('Series System with N Sigma');
hold on
plot(AvgFitnessSe,'r');
hold off


