function results = LSGO(sols, num, trial, algorithm)   
    global gbest;
    global index;
    global FEvals;
    global t;
    global alg;
    global bf_num;
    
    if (exist('trial', 'var'))
        t = trial; 
        alg = algorithm;
        gbest = 1e+50;
        index = 1;
        FEvals = 0;
        bf_num = num;
    else

        results = benchmark_func(sols, bf_num); 
        gbest = min(min(results), gbest);   
        newFEvals = FEvals + size(sols,2); 

        if (FEvals < index * 5000 && newFEvals >= index * 5000 )          
            fprintf('newFEs = %d, gbest = %d , fun = %d, trial = %d \n', newFEvals, gbest, bf_num, t);
            save(sprintf('%s (fun = %i, trial = %i).mat', alg, bf_num, t), 'gbest', '-append', '-ASCII', '-TABS'); 
            index = index + 1;
        end
        FEvals = newFEvals;
    end
end 
