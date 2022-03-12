function [c,Estados,Promedio] = Mex_H_G(M_H_G,a)
Estados=M_H_G.Estado;

Por_oc=((M_H_G.x_Ocupaci_n));


c=bar(Por_oc,0.5,'FaceColor','flat');
for i=1:1:32
    if Por_oc(i)<40
        c.CData(i,:) = [0 1 0];
    elseif Por_oc(i)<55 && Por_oc(i)>=40
        c.CData(i,:) = [0.4660 0.6740 0.1880];
    elseif Por_oc(i)< 70 && Por_oc(i)>=55
        c.CData(i,:) = [1 1 0];
    elseif Por_oc(i)<80 && Por_oc(i)>= 70
        c.CData(i,:) = [0.9290 0.6940 0.1250];
    elseif Por_oc(i)<=100 && Por_oc(i)>= 80
        c.CData(i,:) =[1 0 0] ;
    end 
end
EVer=find(Estados=="Veracruz de Ignacio de La Llave");
EMich=find(Estados=="Michoacán de Ocampo");
ECoah=find(Estados=="Coahuila de Zaragoza");
for i=1:1:32
    Estados{EVer}="Veracruz";
    Estados{EMich}="Michoacán";
    Estados{ECoah}="Coahuila";
end
Promedio=sum(Por_oc)/32;
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32])
xticklabels(Estados)
title('Ocupación Hospitalaria | Camas Generales | COVID-19')
xlabel(date+"  Promedio de ocupación: "+string(round(Promedio,a))+"%   | @Luis Bres  @DGE")
ylabel('Porcentaje [%]')

ylim([0 105])
for i=1:1:32
    xtipse = c.XEndPoints(i);
    ytipse = c.YEndPoints(i);
    labelse = CommaFormat(c.YData(i))+"%";
    he=text(xtipse,ytipse,labelse,'HorizontalAlignment','left',...
    'VerticalAlignment','middle',"FontSize",10);
    set(he,'Rotation',90);
end
xtickangle(90)
grid()

end

