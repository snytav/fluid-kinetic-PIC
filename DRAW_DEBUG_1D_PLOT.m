function [outputArg1,outputArg2] = DRAW_DEBUG_1D_PLOT(rho,tit,L,it,DT)
    N_deb = size(rho,1)
    x_deb = linspace(0,L,N_deb)
    plot(x_deb,rho)
    xlabel('X')
    ylabel(tit)
    title(strcat('t = ',num2str(it*DT,'%15.5e')))
    
    tit = strcat(tit,'_')
    fn = strcat(strcat(tit,num2str(it,'%05d')),'.jpg')
    Image = getframe(gcf);
    imwrite(Image.cdata, fn);
    fntext = strcat(strcat(tit,num2str(it,'%05d')),'.dat')
    fileID = fopen(fntext,'w');
    fprintf(fileID,'%15.5e %25.15e \n',x_deb,rho)
end

