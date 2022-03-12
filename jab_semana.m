function k = jab_semana()
registrovacuna;

Tdw =timetable(T',1e-6*jabs');
Wdw=retime(Tdw,"weekly","sum");

timedw = Wdw.Properties.RowTimes;
Branddw = Wdw.Var1;
p=bar(timedw, Branddw);

xlabel("Fecha: "+date+" @Luis Bres")
xticks(timedw)
xtickangle(90)
xtickformat('MM-dd')
ylabel('Dosis Aplicadas')
ytickformat('%g M')
title("Avance Semanal | Dosis Aplicadas | COVID-19 México ")

for i=1:length(timedw)
xtips5 = p(1).XEndPoints(i);
ytips5 = p(1).YEndPoints(i);
labels5 = CommaFormat(p(1).YData(i).*1e6);
h=text(xtips5,ytips5,labels5,'HorizontalAlignment','left',...
    'VerticalAlignment','middle',"FontSize",8);
set(h,'Rotation',90);
end

[x60,x50,x40,x30,x18]=datelines(T);

x60.LabelVerticalAlignment = 'middle';
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
ylim([0 12])
legend({'Dosis Aplicadas'},'Location','NorthWest')
grid()
end

