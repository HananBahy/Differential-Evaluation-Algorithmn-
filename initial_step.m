function[para_vecs]=initial_step(NP ,D,bounds)
%NP:size of population
%D:size of parameter vector (cost function dimensionality)
%para_vecs >> Population 
if D==size(bounds,1)   %case 1 , each component has its search range
    s=true
else                  %case 2 ,all components has its search range
    s=false
end

para_vecs =[];
for i=1:NP    %iterate over each parameter vector
    vec=[];
    for j=1:D   %for every element in parameter vector
        %%%check case%%
        if s
            m=j;   %case 1
        else m=1;   %case 2
        end
         
        x=bounds(m,1)+rand*(bounds(m,2)-bounds(m,1) );
        vec =[vec,x];    %append element to vec
    end
    para_vecs =[para_vecs;vec];  %append para_vec to population
    
end

%test case1>>p=initial_step(4 ,3,[[1,2];[1,2];[1,2];[1,2])
%test case2>>p=initial_step(4,3,[[1,2]])