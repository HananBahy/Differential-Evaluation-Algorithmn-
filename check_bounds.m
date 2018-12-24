function[bounded_e]= check_bounds(unbounded_e ,stand_e,bound,case_used)
%unbounded_e -- the element that is out of boundary
% stand_e ---bounded element  used in calculations and corresponding to unbounded_e
%bound -- boundary , search domain for that element
%case_used -- 1,2,3 there are 3 ways we can used for this.
if nargin < 4    %way to make default value for arguments
    case_used=1;     %default value for case_used  
end

if case_used ==1
    if unbounded_e < bound(1)    %under low limit
        bounded_e= bound(1) +rand*(stand_e - bound(1));
    elseif unbounded_e > bound(2)   %ebounded_eceed upper limit
        bounded_e= bound(2) +rand*(stand_e - bound(2));
    else
    bounded_e = unbounded_e;
        
    end
           %way2 has problems , doen't work%
% elseif case_used ==2
%     if unbounded_e < bound(1)    %under low limit
%         %bounded_e= 2*bound(1) -unbounded_e;
%     elseif unbounded_e > bound(2)   %ebounded_eceed upper limit
%         %bounded_e= 2*bound(2) -unbounded_e;\
%      else
%   bounded_e = unbounded_e
%     end
    
else
    if unbounded_e < bound(1)    %under low limit
        bounded_e= (bound(1)+stand_e)/2;
    elseif unbounded_e > bound(2)   %ebounded_eceed upper limit
        bounded_e=(bound(2)+stand_e)/2;
    else
    bounded_e = unbounded_e;
    end 

end
%test case>> z=check_bounds(-5,.5,[0,1],1)
%test case >>>z=check_bounds(2.5,.5,[0,1],1)
%test case>> z=check_bounds(-5,.5,[0,1],3)
%test case >>>z=check_bounds(2.5,.5,[0,1],3)