function [Hosp,td,CASOS,Casos1,Casos2,Casos3] = Mex_hosp_dia(Mex_dash)
rows1 = Mex_dash.TIPO_PACIENTE == 2 & Mex_dash.INTUBADO==2 & Mex_dash.UCI==2;
rows2 = Mex_dash.TIPO_PACIENTE == 2 & Mex_dash.INTUBADO==1 & Mex_dash.UCI==2;
rows3 = Mex_dash.TIPO_PACIENTE == 2 & Mex_dash.UCI==1;

ts1= sort(Mex_dash.FECHA_INGRESO(rows1));
for i=1:1:length(ts1)
    casos1(i)=1;
end
TT1 =timetable(ts1,casos1');
Cases_1=retime(TT1,"daily","sum");


ts2= sort(Mex_dash.FECHA_INGRESO(rows2));
for i=1:1:length(ts2)
    casos2(i)=1;
end
TT2 =timetable(ts2,casos2');
Cases_2=retime(TT2,"daily","sum");


ts3= sort(Mex_dash.FECHA_INGRESO(rows3));
for i=1:1:length(ts3)
    casos3(i)=1;
end
TT3 =timetable(ts3,casos3');
Cases_3=retime(TT3,"daily","sum");


Casos = synchronize(Cases_1,Cases_2,Cases_3);

Casos1=Casos.Var1_Cases_1;
Casos1(isnan(Casos1))=0;
Casos2=Casos.Var1_Cases_2;
Casos2(isnan(Casos2))=0;
Casos3=Casos.Var1_Cases_3;
Casos3(isnan(Casos3))=0;
td= Casos.Properties.RowTimes;
CASOS=Casos1+Casos2+Casos3;
Hosp=plot(td(1:1:(length(td))),Casos1(1:1:(length(Casos1))),...
    td(1:1:(length(td))),Casos2(1:1:(length(Casos2))),...
    td(1:1:(length(td))),Casos3(1:1:(length(Casos3))));
Hosp(1).LineWidth = 1; 
Hosp(1).Color=[0.4660 0.6740 0.1880];
Hosp(2).LineWidth = 1;
Hosp(2).Color=[0.9290 0.6940 0.1250];
Hosp(3).LineWidth=1;
Hosp(3).Color=[0.6350 0.0780 0.1840];
tss = td(1);
tff =td(length(td));
xlim([tss tff]);
grid()
title('Hospitalizaciones Diarias | COVID-19 México')

xlabel("Fecha: |"+date+"|"+"  @Luis Bres  @DGE")
legend({'Camas Generales','Camas Ventilador','UCI'},"Location","northwest")
ylabel('Casos')



end

