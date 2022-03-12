function k = estados()
registrovacuna;
c=bar(vac_estatal,0.5,'FaceColor','flat');
for i=1:1:32
    if vac_estatal(i)<40
        c.CData(i,:) = [1 0 0];
    elseif vac_estatal(i)<55 && vac_estatal(i)>=40
        c.CData(i,:) = [0.9290 0.6940 0.1250];
    elseif vac_estatal(i)< 70 && vac_estatal(i)>=55
        c.CData(i,:) = [1 1 0];
    elseif vac_estatal(i)<80 && vac_estatal(i)>= 70
        c.CData(i,:) = [0.4660 0.6740 0.1880];
    elseif vac_estatal(i)<=100 && vac_estatal(i)>= 80
        c.CData(i,:) = [0 1 0];
    end 
end
E = cell(1,32);
E{1}='Aguascalientes'; E{2}='Baja California'; E{3}='Baja California Sur'; E{4}='Campeche'; E{5}='Chiapas'; E{6}='Chihuahua';...
E{7}='Ciudad de México';E{8}='Coahuila';E{9}='Colima';E{10}='Durango';...
E{11}='Estado de México';E{12}='Guanajuato';E{13}='Guerrero';...
E{14}='Hidalgo';E{15}='Jalisco';E{16}='Michoacán';E{17}='Morelos';...
E{18}='Nayari';E{19}='Nuevo León';E{20}='Oaxaca';E{21}='Puebla';...
E{22}='Querétaro';E{23}='Quintana Roo';E{24}='San Luis Potosí';E{25}='Sinaloa';...
E{26}='Sonora';E{27}='Tabasco';E{28}='Tamaulipas';E{29}='Tlaxcala';...
E{30}='Veracruz';E{31}='Yucatán';E{32}='Zacatecas';
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32])
xticklabels(E)
total_personas=CommaFormat(esquemas_medios(end-1)+esquemas_completos(end-1));

por_m=string(round(esquemas_medios(end-1)/pobm*100,2));
por_c=string(round(esquemas_completos(end-1)/pobm*100,2));
por_tot=string(round(totpersonas(end-1)/pobm*100,2));
title('Cobertura de Vacunación Estatal | COVID-19')
xlabel(date+"|   Población 18+ años Vacunada: 88%"+"   |@Luis Bres")
ylabel('Porcentaje')

ylim([0 110])
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

