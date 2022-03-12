function k= dosis_mes()
registrovacuna;
Tbm =timetable(T',1e-6*marcas.');
Wbm=retime(Tbm,'monthly','sum');
timebm = Wbm.Properties.RowTimes;
Bm = Wbm.Var1;

x=bar(timebm, Bm,'stacked','FaceColor','flat');
x(2).CData = [1 0 0];
x(3).CData = [0.4660 0.6740 0.1880];
x(4).CData = [0.9290 0.6940 0.1250];
x(5).CData = [0 1 1];
x(6).CData = [1 0 1];
x(7).CData=[0.4940 0.1840 0.5560];
xlabel("Fecha: "+date+" @Luis Bres")

ylabel('Dosis Recibidas')
ytickformat('%g M')
title('Avance Mensual | Dosis Recibidas | COVID-19 México')
[x60,x50,x40,x30,x18]=datelines(T);

x60.LabelVerticalAlignment = 'top';
x60.LabelOrientation="horizontal";
x60.LabelHorizontalAlignment = 'right';
x50.LabelVerticalAlignment = 'top';
x50.LabelHorizontalAlignment = 'left';
x50.LabelOrientation="horizontal";
x40.LabelVerticalAlignment = 'top';
x40.LabelHorizontalAlignment = 'left';
x40.LabelOrientation="horizontal";
x30.LabelVerticalAlignment = 'top';
x30.LabelHorizontalAlignment = 'left';
x30.LabelOrientation="horizontal";
x18.LabelVerticalAlignment = 'top';
x18.LabelHorizontalAlignment = 'right';
x18.LabelOrientation="horizontal";

legend({'Pfizer','AstraZeneca','Sinovac','Sputnik V','Cansino','Janssen','Moderna'},'Location','NorthWest','FontSize',8);

for i=1:length(timebm)
xtips = x(7).XEndPoints(i);
ytips = x(7).YEndPoints(i);

labels = CommaFormat(x(1).YData(i).*1e6+x(2).YData(i).*1e6+x(3).YData(i).*1e6+x(4).YData(i).*1e6+x(5).YData(i).*1e6+x(6).YData(i).*1e6+x(7).YData(i).*1e6);
hh=text(xtips,ytips,labels,'HorizontalAlignment','left',...
    'VerticalAlignment','middle');
set(hh,'Rotation',90);
end
ylim([0 70])
ytickformat('%g M')
xtickformat('MMM')

grid()
end

