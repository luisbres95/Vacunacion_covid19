function k = VAC_EDAD1()
registrovacuna;
esq_m=esquemas_medios(end-1);
esq_c=esquemas_completos(end-1);
esq_tot=totpersonas(end-1);
esq_ref=refuerzos(end-1);

EsqCompleto = [round(esq_c/pobtot*100,2);round(esq_c/pob12*100,2);round(esq_c/pobm*100,2)];
EsqTotales=[round(esq_tot/pobtot*100,2);round(esq_tot/pob12*100,2);90];
EsqRef = [round(esq_ref/pobtot*100,2);round(esq_ref/pob12*100,2);round(esq_ref/pobm*100,2)];

% T = table(EsqCompleto,EsqTotales,EsqRef,'RowNames',{'Población Total';'Población >12 años';'Población >18 años'});
% T.Properties.VariableNames = {'Esquema Completo' 'Medio+Completo' 'Refuerzos'};
figure
subplot(2,1,1)
vac_edad()

% colNames={'Esquema Completo [%]','Medio+Completo [%]' 'Refuerzos [%]'};
% rowNames={'Población Total';'Población >12 años';'Población >18 años'};
% data=[EsqCompleto,EsqTotales,EsqRef];
% t=uitable(f,'Data',data,'ColumnName',colNames,'RowName',rowNames,'FontSize',16);
% 'Position',[70,73,463,73],
% t.Position = [45 55 t.Extent(3) t.Extent(4)];
%%%%%
Ecell = cell(1,3);
Ecell{1}='Población Total'; Ecell{2}='Población +12 años'; Ecell{3}='Población +18 años';
dat=[EsqCompleto(1) EsqTotales(1) EsqRef(1);
    EsqCompleto(2) EsqTotales(2) EsqRef(2);
    EsqCompleto(3) EsqTotales(3) EsqRef(3)];

dat1=[EsqCompleto(1) EsqCompleto(2) EsqCompleto(3)];
dat2=[EsqTotales(1) EsqTotales(2) EsqTotales(3)];
dat3=[EsqRef(1) EsqRef(2) EsqRef(3)];
subplot(2,1,2)
p=barh(dat);
for i=1:length(dat1)
xtips1 = p(1).XEndPoints(i);
ytips1 = p(1).YEndPoints(i);
labels1 ="  "+dat1(i)+"%";
h1=text(ytips1,xtips1,labels1,'HorizontalAlignment','left',...
    'VerticalAlignment','middle');

xtips2 = p(2).XEndPoints(i);
ytips2 = p(2).YEndPoints(i);
labels2 ="  "+dat2(i)+"%";
h2=text(ytips2,xtips2,labels2,'HorizontalAlignment','left',...
    'VerticalAlignment','middle');

xtips3 = p(3).XEndPoints(i);
ytips3 = p(3).YEndPoints(i);
labels3 ="  "+dat3(i)+"%";
h3=text(ytips3,xtips3,labels3,'HorizontalAlignment','left',...
    'VerticalAlignment','middle');



end

legend({'Esquemas Completos','Medio+Completos','Refuerzos'},'Location','SouthEast',"FontSize",10)
xlim([0 120])
title('Cobertura por Grupo de Edad')
yticks([1 2 3])
yticklabels(Ecell)
xlabel("Porcentaje [%]   "+date+"   @Luis Bres")
grid()



end

