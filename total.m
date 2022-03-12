function k = total()
registrovacuna;

c=bar((sum_v)*1e-6,0.5,'FaceColor','flat');
c.CData(2,:) = [1 0 0];
c.CData(3,:) = [0.4660 0.6740 0.1880];
c.CData(4,:) = [0.9290 0.6940 0.1250];
c.CData(5,:) = [0 1 1];
c.CData(6,:) = [1 0 1];
c.CData(7,:)=[0.4940 0.1840 0.5560];
l = cell(1,6);
l{1}='Pfizer'; l{2}='AstraZeneca'; l{3}='Sinovac'; l{4}='Sputnik V'; l{5}='Cansino'; l{6}='Janssen';l{7}='Moderna';    
set(gca,'xticklabel', l) 
title('Dosis Totales | Marca | COVID-19 México')
xlabel(date+"   @Luis Bres")
ylabel('Dosis Recibidas')
ytickformat('%g M')
ylim([0 130])
for i=1:7
    xtips4 = c.XEndPoints(i);
    ytips4 = c.YEndPoints(i);
    labels4 = CommaFormat(c.YData(i).*1e6);
    h4=text(xtips4,ytips4,labels4,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom');
end
grid()
end

