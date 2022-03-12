function k = jabdia()
registrovacuna;

for i=1:7:length(jabs)
        jdom(i) = jabs(i);
end
jd=bar(T(1:1:length(jdom)),jdom*1e-6,'FaceColor',"flat");

hold on
for i=2:7:length(jabs)
jlun(i) = jabs(i);
end
jl=bar(T(1:1:length(jlun)),jlun*1e-6,'FaceColor',"flat");

for i=3:7:length(jabs)
jmar(i) = jabs(i);
end
jma=bar(T(1:1:length(jmar)),jmar*1e-6,'FaceColor',"flat");

for i=4:7:length(jabs)
jmier(i) =jabs(i);
end
jmie=bar(T(1:1:length(jmier)),jmier*1e-6,'FaceColor',"flat");

for i=5:7:length(jabs)
jjuev(i) =jabs(i);
end
jjue=bar(T(1:1:length(jjuev)),jjuev*1e-6,'FaceColor',"flat");

for i=6:7:length(jabs)
jvie(i)=jabs(i);
end
jv=bar(T(1:1:length(jvie)),jvie*1e-6,'FaceColor',"flat");

for i=7:7:length(jabs)
jsab(i)=jabs(i);
end
js=bar(T(1:1:length(jsab)),jsab*1e-6,'FaceColor',"flat");

jabsmean=movmean(jabs(1:1:(end))*1e-6,7);
jabmean=plot(T,jabsmean,'k');
title('Avance Diario | Dosis Aplicadas | COVID-19 México')
ylabel('Dosis Aplicadas')
ytickformat('%g M')

xlabel("Fecha: "+date+"  Último Día: +"+CommaFormat(jabs(end-1))+...
    "   @Luis Bres")
xtickformat('MMM-yy')
hold off

jabmean(1).LineWidth = 1; 

[x60,x50,x40,x30,x18]=datelines(T);

x60.LabelVerticalAlignment = 'bottom';
x60.LabelHorizontalAlignment = 'left';
x60.LabelOrientation="horizontal";

x50.LabelVerticalAlignment = 'top';
x50.LabelHorizontalAlignment = 'right';

x40.LabelVerticalAlignment = 'top';
x40.LabelHorizontalAlignment = 'right';

x30.LabelVerticalAlignment = 'top';
x30.LabelHorizontalAlignment = 'right';

x18.LabelVerticalAlignment = 'top';
x18.LabelHorizontalAlignment = 'right';
ylim([0 1.7])
grid()
lg=legend({'Domingo','lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Med. prog. sem.'},'Location','NorthWest','FontSize',8);

end

