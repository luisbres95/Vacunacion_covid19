function [CASOS1,Csum,p] = Mex_casos_edad(Mex_dash,a,b,A)
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
CASOS1=Wc.CASOS1;
Csum=sum(CASOS1);
CASOST=timetable(td,CASOS*1e3);
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
xlabel("Fecha: |"+date+"|   @Luis Bres  @DGE")
title('Casos Positivos Semanales | Edad | COVID-19 México')
ylabel('Casos')
ytickformat('%g k')
xticks(td(1:2:length(td)))
xtickangle(90)
xtickformat('dd-MM-yy')
end

