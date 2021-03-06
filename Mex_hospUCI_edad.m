function [CASOS3,Cs,u] = Mex_hospUCI_edad(Mex_dash,a,b,A)
rows1 = Mex_dash.TIPO_PACIENTE == 2 & Mex_dash.INTUBADO==2 & Mex_dash.UCI==2 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b ;
rows2 = Mex_dash.TIPO_PACIENTE == 2 & Mex_dash.INTUBADO==1 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b & Mex_dash.UCI==2;
rows3 = Mex_dash.TIPO_PACIENTE == 2 & Mex_dash.UCI==1 & Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b ;

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
td1= Casos.Properties.RowTimes;

TT =timetable(td1,Casos1,Casos2,Casos3);
Wc=retime(TT,"weekly","sum");
td = Wc.Properties.RowTimes;
CASOS = Wc.Casos1+Wc.Casos2+Wc.Casos3;

CASOS3 =Wc.Casos3;
Cs=sum(CASOS3);

if a==60
    u=plot(td(1:1:(length(td)-A)),CASOS3(1:1:(length(CASOS3)-A)),'Color',[0, 0, 1],'LineWidth',2);
elseif a==50
     u=plot(td(1:1:(length(td)-A)),CASOS3(1:1:(length(CASOS3)-A)),'Color',[0, 0.5, 0],'LineWidth',2);
elseif a==40
     u=plot(td(1:1:(length(td)-A)),CASOS3(1:1:(length(CASOS3)-A)),'Color',[1, 0, 0],'LineWidth',1.5);
elseif a==30
     u=plot(td(1:1:(length(td)-A)),CASOS3(1:1:(length(CASOS3)-A)),'Color',[0, 0.75, 0.75],'LineWidth',1.5);
elseif a==15
    u=plot(td(1:1:(length(td)-A)),CASOS3(1:1:(length(CASOS3)-A)),'Color',[0.75, 0, 0.75],'LineWidth',1.5);
elseif a==0
    u=plot(td(1:1:(length(td)-A)),CASOS3(1:1:(length(CASOS3)-A)),'Color',[0.25, 0.25, 0.25],'LineWidth',1.5);
end
tss = td(1);
tff =td(length(td)-A);
xlim([tss tff]);
title('Hospitalizaciones Semanales | Camas UCI | Edad | COVID-19 M?xico')

xlabel("Fecha: "+date+" @Luis Bres @DGE")
ylabel('Casos')
xticks(td(1:2:length(td)))
xtickangle(90)
xtickformat('dd-MM-yy')
end

