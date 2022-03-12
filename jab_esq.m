function k= jab_esq()
registrovacuna;
for i=1:length(esquemas_completos)
    if (i-1)<1
        E_completos(i)=nan;
    else 
        E_completos(i)=esquemas_completos(i)-esquemas_completos(i-1);
    end
    if (i-1)<1
        tp_dia(i)=nan;
    else 
        tp_dia(i)=totpersonas(i)-totpersonas(i-1);
    end
    
    if (i-1)<1
        E_medios(i)=nan;
%     elseif esquemas_completos(i)==0
%         E_medios(i)=esquemas_medios(i)-esquemas_medios(i-1);
%     elseif esquemas_completos(i)>0
    else 
        E_medios(i)=abs(tp_dia(i)-E_completos(i));
        
    end
end

esq_dosis=[E_medios(1:1:length(E_medios)-1);E_completos(1:1:length(E_completos)-1)];
e_d=bar(Tesq(1:1:length(Tesq)-1),esq_dosis*1e-6,'stacked','FaceColor','flat');
e_d(1).CData = [0.9290 0.6940 0.1250];
e_d(2).CData = [0.6350 0.0780 0.1840];
title('Avance Diario | Personas Vacunadas | COVID-19 México')
ylabel('Personas Vacunadas')
ytickformat('%g M')

xlabel("Fecha: |"+date+"|"+"     @Luis Bres")
xtickformat('MMM-yy')
[x60,x50,x40,x30,x18]=datelines(T);

x60.LabelVerticalAlignment = 'middle';
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
legend({'Esquemas medios','Esquemas completos'},'Location','NorthWest',"FontSize",14)
grid

end

