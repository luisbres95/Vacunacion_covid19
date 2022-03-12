function k = jab_mes()
registrovacuna;
Tdm =timetable(T',1e-6*jabs');
Wdm=retime(Tdm,"monthly","sum");

timedm = Wdm.Properties.RowTimes;
Branddm = Wdm.Var1;

r=bar(timedm, Branddm);

xlabel("Fecha: "+date+" @Luis Bres")
xticks(timedm)
xtickformat('MMM')
ylabel('Dosis Aplicadas')
ytickformat('%g M')
title('Avance Mensual | Dosis Aplicadas | COVID-19 México')

for i=1:length(timedm)
xtips6 = r(1).XEndPoints(i);
ytips6 = r(1).YEndPoints(i);

labels6 = CommaFormat(r(1).YData(i).*1e6);

h=text(xtips6,ytips6,labels6,'HorizontalAlignment','left',...
    'VerticalAlignment','middle');
set(h,'Rotation',90);
end
ylim([0 45])
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

% legend({'Dosis Aplicadas'},'Location','NorthWest')
grid()
end

