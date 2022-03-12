function a = dosisdia()
registrovacuna;
k=find(allvaccines>0);


Marcas=marcas(:,k);
Tr = datetime([2020,12,20]) + caldays(k);
Trd=datestr(Tr,'dd/mm/yy');
TTr=1:1:length(Tr);
d=bar(TTr,Marcas*1e-6,'stacked','FaceColor','flat');
d(2).CData = [1 0 0];
d(3).CData = [0.4660 0.6740 0.1880];
d(4).CData = [0.9290 0.6940 0.1250];
d(5).CData = [0 1 1];
d(6).CData = [1 0 1];
d(7).CData=[0.4940 0.1840 0.5560];

title('Avance Diario | Dosis Recibidas | COVID-19 México')
xticklabels([])
xticks(1:5:length(TTr))

xlabel("Fecha: "+date+" @Luis Bres")
ylabel('Dosis Recibidas')
ytickformat('%g M')
ylim([0 8])
grid()

% [x60]=datelines(T);
% x60.LabelVerticalAlignment = 'bottom';
% x60.LabelHorizontalAlignment = 'left';
% x60.LabelOrientation="horizontal";
ld=legend({'Pfizer','AstraZeneca','Sinovac','Sputnik V','Cansino','Janssen','Moderna'},'Location','NorthWest','FontSize',8);

end

