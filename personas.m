function k= personas()
registrovacuna;


esquemas=plot(Tesq(1:1:(length(Tesq)-1)),esquemas_medios(1:1:(end-1))*1e-6,'b',...
    Tesq(1:1:(end-1)),esquemas_completos(1:1:(end-1))*1e-6,'r',...
    Tesq(1:1:(end-1)),totpersonas(1:1:(end-1))*1e-6,'k',...
    Tesq(1:1:(end-1)),refuerzos(1:1:(end-1))*1e-6,'b');
% 
title('Población Total Vacunada | COVID-19 México')
ylabel('Personas Vacunadas')
ytickformat('%g M')
xlabel("Fecha: |"+date+"|"+"     @Luis Bres")
xtickformat('MMM-yy')


[x60,x50,x40,x30,x18]=datelines(T);

x60.LabelVerticalAlignment = 'bottom';
x60.LabelHorizontalAlignment = 'left';
x60.LabelOrientation="horizontal";   
x50.LabelVerticalAlignment = 'bottom';
x50.LabelHorizontalAlignment = 'right';
x50.LabelOrientation="horizontal";

x40.LabelVerticalAlignment = 'bottom';
x40.LabelHorizontalAlignment = 'right';
x40.LabelOrientation="horizontal";

x30.LabelVerticalAlignment = 'top';
x30.LabelHorizontalAlignment = 'right';

x18.LabelVerticalAlignment = 'top';
x18.LabelHorizontalAlignment = 'right';
legend({'Esquemas medios','Esquemas completos','Personas Vacunadas','Refuerzos'},'Location','NorthWest',"FontSize",14)

esquemas(1).LineWidth = 3; 
esquemas(1).Color=[0.9290 0.6940 0.1250];
esquemas(2).LineWidth = 3;
esquemas(2).Color=[0.6350 0.0780 0.1840];
esquemas(3).LineWidth=3;
esquemas(3).Color=[0.4660 0.6740 0.1880];
esquemas(4).LineWidth=3;
ylim([0 130])

grid()


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
    if (i-1)<1
        ref(i)=nan;
    else 
        ref(i)=refuerzos(i)-refuerzos(i-1);
    end
end

medios=CommaFormat(esquemas_medios(end-1));
% medioslast=CommaFormat(esquemas_medios(end-1)-esquemas_medios(end-2));
medioslast=CommaFormat(E_medios(end-1));

completoslast=CommaFormat(esquemas_completos(end-1)-esquemas_completos(end-2));
totperlast=CommaFormat(totpersonas(end-1)-totpersonas(end-2));
completos=CommaFormat(esquemas_completos(end-1));
total_personas=CommaFormat(esquemas_medios(end-1)+esquemas_completos(end-1));

Ref=CommaFormat(refuerzos(end-1));
Reflast=CommaFormat(ref(end-1));


por_m=string(round(esquemas_medios(end-1)/pobtot*100,2));
por_c=string(round(esquemas_completos(end-1)/pobtot*100,2));
por_tot=string(round(totpersonas(end-1)/pobtot*100,2));
por_ref=string(round(refuerzos(end-1)/pobtot*100,2));

%%%%%
esq_med_por=round(esquemas_medios/pobtot*100,2);
esq_comp_por=round(esquemas_completos/pobtot*100,2);
pervac_por=round(totpersonas/pobtot*100,2);
ref_por=round(refuerzos/pobtot*100,2);

medios1=CommaFormat(round(esq_med_por(end-1),3));
medioslast1=CommaFormat(round(esq_med_por(end-1)-esq_med_por(end-2),3));

completoslast1=CommaFormat(round(esq_comp_por(end-1)-esq_comp_por(end-2),3));
totperlast1=CommaFormat(round(pervac_por(end-1),3));
completos1=CommaFormat(round(esq_comp_por(end-1),3));
total_personas1=CommaFormat(round(pervac_por(end-1)-pervac_por(end-2),3));

ref1=CommaFormat(round(ref_por(end-1),3));
reflast1=CommaFormat(round(ref_por(end-1)-ref_por(end-2),3));
%%%%
% str = {'Nuevos Medios Esquemas: ' medios+" ("+medios1+"% |"+"   +"+medioslast+")",...
%        'Esquemas Completos: ' completos+"   ("+por_c+"%)"+"       (+"+completoslast+")",...
%        'Total de personas vacunadas: ' total_personas+"   ("+por_tot+"%)"+"       (+"+totperlast+")"
%        };
dim = [.149 .45 .3 .25];
if (esq_med_por(end-1)-esq_med_por(end-2))>0
     str = {"-Nuevos Medios Esquemas-";medios+" | "+medios1+"%, +"+medioslast1+"%, +"+medioslast;...
       "-Esquemas Completos-";completos+" | "+completos1+"%, +"+completoslast1+"%, +"+completoslast;...
       "-Total de personas vacunadas-";total_personas+" |  "+totperlast1+"%, +"+total_personas1+"%, +"+totperlast;...
       "-Refuerzos-";Ref+" | "+ref1+"%, +"+reflast1+"%, +"+Reflast;...
       };
   str1 = ["Esq Medios: "+medios+" | "+medios1+"%, +"+medioslast1+"%, +"+medioslast;...
       "Esq Completos: "+completos+" | "+completos1+"%, +"+completoslast1+"%, +"+completoslast;...
       "Total: "+total_personas+" | "+totperlast1+"%, +"+total_personas1+"%, +"+totperlast;...
       "Refuerzos: "+Ref+" | "+ref1+"%, +"+reflast1+"%, +"+Reflast;...
       ]; 
disp(str1)
else
    str = {"-Nuevos Medios Esquemas-";medios+" | "+medios1+"%, "+medioslast1+"%, "+"-"+medioslast;...
       "-Esquemas Completos-";completos+" | "+completos1+"%, +"+completoslast1+"%, +"+completoslast;...
       "-Total de personas vacunadas-";total_personas+" |  "+totperlast1+"%, +"+total_personas1+"%, +"+totperlast;...
       "-Refuerzos-";Ref+" | "+ref1+"%, +"+reflast1+"%, +"+Reflast...
       };
       
   str1 = ["Esq Medios: "+medios+" | "+medios1+"%, "+medioslast1+"%, +"+medioslast;...
       "Esq Completos: "+completos+" | "+completos1+"%, +"+completoslast1+"%, +"+completoslast;...
       "Total: "+total_personas+" | "+totperlast1+"%, +"+total_personas1+"%, +"+totperlast;...
       "Refuerzos: "+Ref+" | "+ref1+"%, +"+reflast1+"%, +"+Reflast;...
       ]; 
disp(str1)
end
textbox=annotation('textbox',dim,'String',str,'FitBoxToText','on');
set (textbox,'BackgroundColor','white')
ts_per = T(1);
tf_per =T(length(T));
xlim([ts_per tf_per])

end

