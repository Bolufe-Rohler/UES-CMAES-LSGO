results = zeros(11*25,15);
for fun = 1:15
    for trial = 1 : 25


        res = load(sprintf('UES_CMAES (fun = %i, trial = %i)', fun, trial), '-ascii');

        k=0;
        results(k*25 + trial, fun) = res(24);
        
        for k =1:10
            results(k*25 + trial, fun) = res(k*60);
        end       
     
    end 
    
end

