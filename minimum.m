function[mini_val,index] = minimum(func,p)
%cost function -- that we want find best vector that find minimum value for
%p-- population of vectors   %array of vectors
NP=size(p,1);  %-- number of rows in population

index=1;   %initial value
 optimum_val=func(p(1,:));
 for i=2:NP
      val =func(p(i,:));
      if val < optimum_val
          index=i;
          optimum_val=val;      
      end
  end
  mini_val = p(index,:);
  %test_case 1>> [mini_val,index]=minimum(@(x) sum(x.^2),P)