function k = dosis_semana()
registrovacuna;

Tbrand =timetable(T',1e-6*marcas.');
Wbrand=retime(Tbrand,"weekly","sum");

timebrand = Wbrand.Properties.RowTimes;
Brand = Wbrand.Var1;

s=bar(timebrand, Brand,'stacked','FaceColor','flat');
s(2).CData = [1 0 0];
s(3).CData = [0.4660 0.6740 0.1880];
s(4).CData = [0.9290 0.6940 0.1250];
s(5).CData = [0 1 1];
s(6).CData = [1 0 1];
s(7).CData=[0.4940 0.1840 0.5560];
xlabel("Fecha: "+date+" @Luis Bres")
xticks(timebrand)
xtickangle(90)
xtickformat('MM-dd')
ylabel('Dosis Recibidas')
ytickformat('%g M')
title("Avance Semanal | Dosis Recibidas | COVID-19 México ")
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

for i=1:length(timebrand)
xtips2 = s(7).XEndPoints(i);
ytips2 = s(7).YEndPoints(i);
labels2 = CommaFormat(s(1).YData(i).*1e6+s(2).YData(i).*1e6+s(3).YData(i).*1e6+s(4).YData(i).*1e6+s(5).YData(i).*1e6+s(6).YData(i).*1e6+s(7).YData(i).*1e6);
h=text(xtips2,ytips2,labels2,'HorizontalAlignment','left',...
    'VerticalAlignment','middle',"FontSize",8);
set(h,'Rotation',90);
end

ylim([0 25])
grid()
end

