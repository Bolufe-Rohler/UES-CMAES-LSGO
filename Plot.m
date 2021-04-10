
for fun = [2 12]
    plotData = zeros(600,1);
    plotData1 = zeros(600,1);
    plotData2 = zeros(600,1);
    if fun==2 
        fun1=7;
        fun2=11;
    end
    if fun ==12
        fun1=13;
        fun2=14;
    end
    
    for trial = 1 : 25
        
        UES = load(sprintf('UES_CMAES (fun = %i, trial = %i)',fun, trial), '-ascii');
        
        plotData =  plotData + UES;
        
        UES = load(sprintf('UES_CMAES (fun = %i, trial = %i)',fun1, trial), '-ascii');

        plotData1 =  plotData1 + UES;
        
        UES = load(sprintf('UES_CMAES (fun = %i, trial = %i)',fun2, trial), '-ascii');

        plotData2 =  plotData2 + UES;
    end
    
    plotData = plotData/5;
    plotData1 = plotData1/5;
    plotData2 = plotData2/5;
    
    %h = figure('Position',[20 400 1100 400]);
    h = figure('Position',[20 300 1500 300]);
    
    h.PaperPositionMode = 'auto';

    subplot(1,3,1);
    
    x = 1:5000:3000000;
    
    semilogy(x,plotData,'LineWidth',2);
    legend('UES-CMAES', 'Location', 'NE');
    
    
    subplot(1,3,2);
    semilogy(x,plotData1,'LineWidth',2);
           
    legend('UES-CMAES', 'Location', 'NE');
    
     subplot(1,3,3);
    semilogy(x,plotData2,'LineWidth',2);
           
    legend('UES-CMAES', 'Location', 'NE');
    
    print(h,'-dpng','-r0', sprintf('%s\\3plots_fun%i_log.png', pwd, fun));
    close();
end
    