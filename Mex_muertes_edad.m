function [CASOS,Csum,p] = Mex_muertes_edad(Mex_dash,a,b,A)

rows1 = Mex_dash.CLASIFICACION_FINAL == 1 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b ;
rows2 = Mex_dash.CLASIFICACION_FINAL == 2 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b ;
rows3 = Mex_dash.CLASIFICACION_FINAL == 3 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b ;


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


CASOS1=Casos1+Casos2+Casos3;

       
td1= Casos.Properties.RowTimes;
TT =timetable(td1,CASOS1);
Wc=retime(TT,"weekly","sum");

td = Wc.Properties.RowTimes;
CASOS = Wc.CASOS1;
Csum=sum(CASOS);
CASOST=timetable(td,CASOS);
if a==60
    p=plot(td(1:1:(length(td)-A)),CASOS(1:1:(length(CASOS)-A)),'Color',[0, 0, 1],'LineWidth',2);
elseif a==50
     p=plot(td(1:1:(length(td)-A)),CASOS(1:1:(length(CASOS)-A)),'Color',[0, 0.5, 0],'LineWidth',2);
elseif a==40
     p=plot(td(1:1:(length(td)-A)),CASOS(1:1:(length(CASOS)-A)),'Color',[1, 0, 0],'LineWidth',1.5);
elseif a==30
     p=plot(td(1:1:(length(td)-A)),CASOS(1:1:(length(CASOS)-A)),'Color',[0, 0.75, 0.75],'LineWidth',1.5);
elseif a==15
    p=plot(td(1:1:(length(td)-A)),CASOS(1:1:(length(CASOS)-A)),'Color',[0.75, 0, 0.75],'LineWidth',1.5);
elseif a==0
    p=plot(td(1:1:(length(td)-A)),CASOS(1:1:(length(CASOS)-A)),'Color',[0.25, 0.25, 0.25],'LineWidth',1.5);
end
tss = td(1);
tff =td(length(td)-A);
xlim([tss tff]);
title('Defunciones Semanales | Edad | COVID-19 México')

xlabel("Fecha: "+date+" @Luis Bres  @DGE")
ylabel('Casos')
xticks(td(1:2:length(td)))
xtickangle(90)
xtickformat('dd-MM-yy')
end
