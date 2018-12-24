function[] =main()
    disp( 'Enter your cost function, hint you can define it as sqr = @(x) x.^2; ');   
    cost_func =input('or you can use default function (sphere)by entering @cost_func:');
    NP =input('Enter size of population NP: ');
    D = input('no.of dimensions of objective function :');
    bounds=input('Enter boundary for each dimension: ');
    F=input('Mutation factor F :');
    CR = input('crossover rate CR :');
    num_epochs =input('no. of iterations :');

    [vec,val]=DE_algorithm(cost_func,NP,D,bounds,F,CR,num_epochs);
    disp('optimum value: '); disp(val);   
    disp('optimum parameter vector: ');disp(vec );
%          %%%%%plot values of optimum function through through iterations%%%
%          y_itr=1:num_epochs;
%          figure
%          plot(x_vals,y_itr,'r');
    
    