function[mutant_vecs]=mutation_step(F,population)
%F--Mutation factor [0,2]
%population --parameter vectors
NP = size(population,1)  %no.of parameter vectors (target vectors)
mutant_vecs=[]
for i=1:NP
  %select 3 unique number !=j
  r=randperm(NP,4)  %select unique 4 
  r(r==i) = [];      %remove element ==j
  if size(r)~=3      %in case of all numbers !=j
      r=r(1:3);  
  end
  %%%%%%%%%%%%%%
  Vec= population(r(1),:) +F.*(population(r(2),:) - population(r(3),:))
  mutant_vecs=[mutant_vecs;Vec]    %append to mutant vectors
end
%Note that : elements in mutant vectors may be out of search range of each
%element
%test case1 >> muts=mutation_step(1.5,[[.5 .6 .6];[.2 .2 .4];[.2 .1 .5];[.1 .1 .1]])
%test case2 >> muts=mutation_step(1.5,p)