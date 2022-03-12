function [p,LET,Letabs] = letalidad(a,b,A,Mex_dash)

rows1 = Mex_dash.CLASIFICACION_FINAL == 1 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b;
rows2 = Mex_dash.CLASIFICACION_FINAL == 2 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b;
rows3 = Mex_dash.CLASIFICACION_FINAL == 3 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b;

ts1= sort(Mex_dash.FECHA_SINTOMAS(rows1));
for i=1:1:length(ts1)
    casos1(i)=1;
end
TT1 =timetable(ts1,casos1');
Cases_1=retime(TT1,"daily","sum");


ts2= sort(Mex_dash.FECHA_SINTOMAS(rows2));
for i=1:1:length(ts2)
    casos2(i)=1;
end
TT2 =timetable(ts2,casos2');
Cases_2=retime(TT2,"daily","sum");


ts3= sort(Mex_dash.FECHA_SINTOMAS(rows3));
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
CASOS = Wc.CASOS1*1e-3;
CASOST=timetable(td,CASOS*1e3);



% % % % % % % 
rows4 = Mex_dash.CLASIFICACION_FINAL == 1 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b ;
rows5 = Mex_dash.CLASIFICACION_FINAL == 2 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b ;
rows6 = Mex_dash.CLASIFICACION_FINAL == 3 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b ;


strDates4 = string(Mex_dash.FECHA_DEF(rows4)); 
strDates4 = erase(strDates4, ('9999-99-99')); 
T4=datetime(strDates4, 'Locale',"en_US");
% Ts1 = T1(~isnat(T1));
ts4= sort(T4);

for i=1:1:length(ts4)
    casos4(i)=1;
end
TT4 =timetable(ts4,casos4');
Cases_4=retime(TT4,"daily","sum");


strDates5 = string(Mex_dash.FECHA_DEF((rows5))); 
strDates5 = erase(strDates5, ('9999-99-99')); 
T5=datetime(strDates5, 'Locale',"en_US");
% Ts2 = T2(~isnat(T2));
ts5= sort(T5);

for i=1:1:length(ts5)
    casos5(i)=1;
end
TT5 =timetable(ts5,casos5');
Cases_5=retime(TT5,"daily","sum");


strDates6 = string(Mex_dash.FECHA_DEF(rows6)); 
strDates6 = erase(strDates6, ('9999-99-99')); 
T6=datetime(strDates6, 'Locale',"en_US");
% Ts3 = T3(~isnat(T2));
ts6= sort(T6);

for i=1:1:length(ts6)
    casos6(i)=1;
end
TT6 =timetable(ts6,casos6');
Cases_6=retime(TT6,"daily","sum");


Casos = synchronize(Cases_4,Cases_5,Cases_6);

Casos4=Casos.Var1_Cases_4;
Casos4(isnan(Casos4))=0;
Casos5=Casos.Var1_Cases_5;
Casos5(isnan(Casos5))=0;
Casos6=Casos.Var1_Cases_6;
Casos6(isnan(Casos6))=0;


CASOS2=Casos4+Casos5+Casos6;

       
td2= Casos.Properties.RowTimes;
TT2 =timetable(td2,CASOS2);
Wc2=retime(TT2,"weekly","sum");

td22 = Wc2.Properties.RowTimes;
Muertes1 = Wc2.CASOS2;
MUERTES=timetable(td22,Muertes1);







Let=synchronize(CASOST,MUERTES);
Casos=Let.Var1;
Casos(isnan(Casos))=0;
Muertes=Let.Muertes1;
Muertes(isnan(Muertes))=0;

t= Let.Properties.RowTimes;
LET=Muertes./(Casos)*100;

Msum=sum(Muertes);
Csum=sum(Casos);
Letabs=Msum./Csum*100;
if a==60
    COLOR=[0, 0, 1];
elseif a==50
    COLOR=[0, 0.5, 0];
elseif a==40
     COLOR=[1, 0, 0];
elseif a==30
     COLOR=[0, 0.75, 0.75];
elseif a==15
    COLOR=[0.75, 0, 0.75];
elseif b==14
   COLOR=[0.25, 0.25, 0.25];
elseif a==0
    COLOR=[0.9290 0.6940 0.1250];
end
p=plot(t(1:1:(length(t)-A)),LET(1:1:(length(LET)-A)),'Color',COLOR,'LineWidth',2);
tss = t(1);
tff =t(length(t)-A);
xlim([tss tff]);
xlabel("Fecha: "+date+"   @Luis Bres  @DGE")
title('Letalidad Semanal | Edad | COVID-19 México')
ylabel('Porcentaje %')
xticks(t(1:2:length(t)))
xtickangle(90)
xtickformat('dd-MM-yy')
end

