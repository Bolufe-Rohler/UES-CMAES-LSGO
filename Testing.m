function Testing(func_num, trial, algorithm)

fprintf('Optimizing Function %i, trial %i\n', func_num, trial);
tic;

runs = 1; % number of independent runs for each function, should be set to 25
Max_FEs = 3e+06; % maximal number of FEs, should be set to 3e+06
global initial_flag; % the global flag used in test suite
global FEs;          %MODIFICATION OF THE BENCHMARK: it counts the FEs
format short e;


    %for overlapping function D = 905
    if func_num > 12 && func_num < 15
        D = 905; % dimensionality of the objective function.
    else
        D = 1000;
    end

    % Search Range
    if (func_num == 1 | func_num == 4 | func_num == 7 | func_num == 8 | func_num == 11 | func_num == 12 | func_num == 13 | func_num == 14 | func_num == 15 )
        lb = -100;
        ub = 100;
    end
    if (func_num == 2 | func_num == 5 | func_num == 9)
        lb = -5;
        ub = 5;
    end
    if (func_num == 3 | func_num == 6 | func_num == 10)
        lb = -32;
        ub = 32;
    end

    xbound = ub; 
                
	FEs=0;
	initial_flag = 0; % should set the flag to 0 for each run, each function

    
    
    LSGO(0, func_num, trial, algorithm);
    
    f = @(pop) LSGO(pop);
    
    feval(algorithm, f, D, Max_FEs, ub);

toc;

end
