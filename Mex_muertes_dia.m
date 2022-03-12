function [p,td,CASOS] = Mex_muertes_dia(Mex_dash)
rows1 = Mex_dash.CLASIFICACION_FINAL == 1 ;
rows2 = Mex_dash.CLASIFICACION_FINAL == 2 ;
rows3 = Mex_dash.CLASIFICACION_FINAL == 3 ;


strDates1 = string(Mex_dash.FECHA_DEF(rows1)); 
strDates1 = erase(strDates1, ('9999-99-99')); 
T1=datetime(strDates1, 'Locale',"en_US");
% Ts1 = T1(~isnat(T1));
ts1= sort(T1);

for i=1:1:length(ts1)
    casos1(i)=1;
end
TT1 =timetable(ts1,casos1');
Cases_1=retime(TT1,"daily","sum");


strDates2 = string(Mex_dash.FECHA_DEF((rows2))); 
strDates2 = erase(strDates2, ('9999-99-99')); 
T2=datetime(strDates2, 'Locale',"en_US");
% Ts2 = T2(~isnat(T2));
ts2= sort(T2);

for i=1:1:length(ts2)
    casos2(i)=1;
end
TT2 =timetable(ts2,casos2');
Cases_2=retime(TT2,"daily","sum");


strDates3 = string(Mex_dash.FECHA_DEF(rows3)); 
strDates3 = erase(strDates3, ('9999-99-99')); 
T3=datetime(strDates3, 'Locale',"en_US");
% Ts3 = T3(~isnat(T2));
ts3= sort(T3);

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


CASOS=Casos1+Casos2+Casos3;

       
td= Casos.Properties.RowTimes;
p=bar(td(1:1:(length(td))),CASOS(1:1:(length(CASOS))),'k');

tss = td(1);
tff =td(length(td));
xlim([tss tff]);
title('Defunciones Diarias | COVID-19 México')

xlabel("Fecha: |"+date+"|"+" Total: "+CommaFormat(sum(CASOS))+" |  @Luis Bres @DGE")
legend({'Casos Positivos'},"Location","northwest")
ylabel('Casos')
grid()
end

