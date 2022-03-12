function [td,CASOS,Casos,p] = Mex_casos_dia(Mex_dash)
rows1 = Mex_dash.CLASIFICACION_FINAL == 1;
rows2 = Mex_dash.CLASIFICACION_FINAL == 2;
rows3 = Mex_dash.CLASIFICACION_FINAL == 3;

ts1= sort(Mex_dash.FECHA_SINTOMAS(rows1));
for i=1:1:length(ts1)
    casos1(i)=1;
end
TT1 =timetable(ts1,casos1');
Cases_1=retime(TT1,"daily","sum");
% tf1= Cases_1.Properties.RowTimes;
% Casos_d1 = Cases_1.Var1;

ts2= sort(Mex_dash.FECHA_SINTOMAS(rows2));
for i=1:1:length(ts2)
    casos2(i)=1;
end
TT2 =timetable(ts2,casos2');
Cases_2=retime(TT2,"daily","sum");
% tf2= Cases_2.Properties.RowTimes;
% Casos_d2 = Cases_2.Var1;

ts3= sort(Mex_dash.FECHA_SINTOMAS(rows3));
for i=1:1:length(ts3)
    casos3(i)=1;
end
TT3 =timetable(ts3,casos3');
Cases_3=retime(TT3,"daily","sum");
% tf3= Cases_3.Properties.RowTimes;
% Casos_d3 = Cases_3.Var1;

Casos = synchronize(Cases_1,Cases_2,Cases_3);

Casos1=Casos.Var1_Cases_1;
Casos1(isnan(Casos1))=0;
Casos2=Casos.Var1_Cases_2;
Casos2(isnan(Casos2))=0;
Casos3=Casos.Var1_Cases_3;
Casos3(isnan(Casos3))=0;
td= Casos.Properties.RowTimes;
CASOS=Casos1+Casos2+Casos3;
p=bar(td,CASOS*1e-3,'r');
tss = td(1);
tff =td(length(td));
xlim([tss tff]);
grid()
title('Casos Positivos Diarios | COVID-19 México')

xlabel("Fecha: |"+date+"|"+"  Total: "+CommaFormat(sum(CASOS))+"  @Luis Bres @DGE")
legend({'Casos Positivos'},"Location","northwest")
ylabel('Casos')
ytickformat('% g k')

end

