function k = acumulado()
registrovacuna;
bar(T, cumsum(allvaccines*1e-6))
hold on
bar(T,cumsum(jabs*1e-6))
bar(T,cumsum(allvaccines*1e-6-jabs*1e-6))
hold off
title('Avance Acumulado | Dosis COVID-19 | México')
xlabel("Fecha: "+date+"   @Luis Bres")
ylabel('Dosis Recibidas')
ylim([0 230])
ytickformat('%g M')
xtickformat('MMM-yy')
grid()
[x60]=datelines(T);
x60.LabelVerticalAlignment = 'bottom';
x60.LabelHorizontalAlignment = 'left';
x60.LabelOrientation="horizontal";
trans=cumsum(allvaccines-jabs);
transito=CommaFormat(trans(length(trans)));

legend({'Dosis Recibidas','Dosis Aplicadas','Dosis en Transito'},'Location','NorthWest','FontSize',14);


dim = [.149 .5 .25 .25];

str = {'Total de dosis recibidas: ' sumallvac,...
       'Total de dosis aplicadas: ' jabssum,...
       'Dosis en transito: ' transito};
str1 = ["Recibidas: "+sumallvac;...
       "Aplicadas: "+jabssum+" (+"+CommaFormat(jabs(end-1))+")";...
       "En transito: "+transito;
       ]; 
disp(str1)
textbox1=annotation('textbox',dim,'String',str,'FitBoxToText','on');
set (textbox1,'BackgroundColor','white')

end

