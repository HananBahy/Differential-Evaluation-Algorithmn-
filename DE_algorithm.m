function[optimum_vec,optimum_val] =DE_algorithm(cost_func,NP,D,bounds,F,CR,num_epochs)
   %%Input
%cost_func -- objective function that we want to optimize
%NP--- hyperparameter(control parameter) , size of population must be >4
%D -- Dimension of cost_function
%bounds-- contains boundary for each dimension/component in cost_func
%F---hyperparameter(control parameter),mutation factor [0,2]
%CR---hyperparameter(control parameter),crossover rate[0,1]
%num_epochs --- number of Iteration that algorithm steps iterate over
  %%Output
%optimum_vec -- it is the best vector in population after comepleting 
          %number of iterations , the optimum_vec is the best values for
          %dimensions of cost_func that algorithm reaches 
%optimum_val -- optimum value of objective function using optimum_vec

     %%%1-Initialization step %%%
 %%initialize all parameter vectors in a population 
 population =initial_step(NP ,D,bounds);
 
 for num_iter=1: num_epochs
     %%mutation_step
     mutant_vecs=mutation_step(F,population);
     %%crossover_step
     trial_vecs =crossover_step(CR ,population,mutant_vecs,bounds);
     %selection_step
     new_population=selection_step(cost_func ,trial_vecs,population);
     population =new_population;  %update population for the next iteration
     
 end
  %%%find optimum parameter vector%%%
  %%%initialize%%
  index=1   %initial value
  optimum_val=cost_func(population(1,:));
  for i=2:NP
      val =cost_func(population(i,:));
      if val < optimum_val
          index=i;
          optimum_val=val;      
      end
  end
  optimum_vec = population(index,:);
  
 %test_case1 >> [vec,val]=DE_algorithm(@cost_func,30,4,[-100,100],.5,.5,80)
 %test_case2  , make default n=2 in cost_func.m
       %[vec,val]=DE_algorithm(@cost_func,30,4,[-100,100],.5,.5,80)
 
      