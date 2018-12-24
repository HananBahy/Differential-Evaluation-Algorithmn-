function[new_population] =selection_step(cost_func ,trial_vecs,population)
NP =size(population,1) %size of population

new_population=[];
for i=1:NP
    if cost_func(trial_vecs(i,:)) <= cost_func(population(i,:))
       new_population = [new_population;trial_vecs(i,:)]; %append
    else
       new_population = [new_population;population(i,:)]; %append    
    end
end

%test_case>>selection_step(@cost_func ,trial_vecs,p)