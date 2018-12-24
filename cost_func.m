function[value] =cost_func(x ,n)
%cost functions are some of Bench mark functions
%n=1 ---- sphere function 
%n=2---
%x -- is row vector
if size(x,1)==1 %row vector
    D=size(x,2);
else       %column vector
   D=size(x,1);
end

if nargin < 2    %way to make default value for arguments
    n=1;     %default value for n  %%%%you can change it to use another cost function
end

if n==1 %sephere function
    value = sum(x.^2);
elseif n==2 %Ackely function 
    value =20+exp(1)-20*exp(-.2*sqrt(sum(x.^2)/D)) - exp(sum(cos(2*pi.*x))/D);
end
%test case1>> value=cost_func([1,2,3],1)
%test case2>>value=cost_func([1,2,3],2)
%test case3 >>value=cost_func([1,2,3])