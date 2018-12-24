function[trial_vecs] =crossover_step(CR ,population,mutant_vecs,bounds)
%CR -- cross rate [0,1]
%population-- parameters vectors
%mutant_vecs-- output of mutation_step
%bounds --- used to ensure that all elements in trial vector lies in search
%domain of that element
NP =size(population,1);   %no.of parameter vectors
D =size(population,2);    %size of each parameter vector
Irand = randperm(NP,1); %random element from 1:Np
%%%%
if D==size(bounds,1)   %case 1 , each component has its search range
    s=true;
else                  %case 2 ,all components has its search range
    s=false;
end
%generat randb(j)%>>> that makes randb(j) for each j component in all
%parameter vectors equal 
randb=[];
for j=1:D
    randb=[randb ,rand()];
end
%%%
trial_vecs=[];
for i=1:NP
    vec=[]
    for j=1:D
        if randb(j)<= CR | j==Irand
           %check boundary of element from mutant vector befor added it to
           %trial vector
               %%%check case%%
            if s
                boundary=bounds(j);   %case 1
            else boundary=bounds;   %case 2
            end
           x=check_bounds(mutant_vecs(i,j) ,population(i,j),boundary,1)
           vec=[vec,x];       %component from mutant vector after bounding it
        else
           vec=[vec, population(i,j)]; %component from target vector
        end
    end
    trial_vecs =[trial_vecs;vec];   %
end

%test case>> trial_vecs=crossover_step(.1 ,p,muts,[1,2])