function k = vac_edad()
registrovacuna;
salud=1254790;
maestros=2588603;
p60=12864979;
p50=12888568;
p40=13550303;
ptodos=28852030;
p14=4681237 ;


Ecell = cell(1,6);
Ecell{1}='Personal de Salud'; Ecell{2}='Profesores'; Ecell{3}='Adultos mayores'; Ecell{4}='50-59 años'; Ecell{5}='40-49 años'; Ecell{6}='Resto de la población';
Ecell{7}='14-17 años';
dat=[salud
    maestros
    p60
    p50
    p40
    ptodos
    p14];
datR=[saludR profR p60R p50R p40R p30R p14R];
val=[100 87 87 98 84 74 53;...
    105 81 70 47 47 52 0]';
p=barh(val);
for i=1:length(dat)
xtips6 = p(1).XEndPoints(i);
ytips6 = p(1).YEndPoints(i);

labels6 ="  "+ CommaFormat(dat(i)')+" | "+val(i)+"%";

h=text(ytips6,xtips6,labels6,'HorizontalAlignment','left',...
    'VerticalAlignment','middle');

end


valR=val(:,2)';
for i=1:length(datR)
xtips = p(2).XEndPoints(i);
ytips = p(2).YEndPoints(i);

labels ="  "+ CommaFormat(datR(i)')+" | "+valR(i)+"%";

h1=text(ytips,xtips,labels,'HorizontalAlignment','left',...
    'VerticalAlignment','middle');

end
legend({'Esquema Primario','Refuerzos'},'Location','NorthEast',"FontSize",8)
xlim([0 150])
title('Vacunación por Grupo de Riesgo')
yticks([1 2 3 4 5 6 7])
yticklabels(Ecell)
ylim([0 8])
xlabel("Porcentaje [%]   "+date+"   @Luis Bres")
grid()
end

