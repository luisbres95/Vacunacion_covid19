function p = cases_age(a,b,Mex_dash)
rows = Mex_dash.EDAD >= a &  Mex_dash.EDAD <= b;
tS60=Mex_dash.FECHA_SINTOMAS(rows);

ts60=sort(tS60);
for i=1:1:length(ts60)
    casos60(i)=1;
end

TT60 =timetable(ts60,casos60');
Cases_d60=retime(TT60,"daily","sum");
tf60 = Cases_d60.Properties.RowTimes;
Casos_dia60 = Cases_d60.Var1;
if a==60
    p=plot(tf60,Casos_dia60,'Color',[0, 0, 1],'LineWidth',2);
elseif a==50
     p=plot(tf60,Casos_dia60,'Color',[0, 0.5, 0],'LineWidth',2);
elseif a==40
     p=plot(tf60,Casos_dia60,'Color',[1, 0, 0]);
elseif a==30
     p=plot(tf60,Casos_dia60,'Color',[0, 0.75, 0.75]);
elseif a==15
    p=plot(tf60,Casos_dia60,'Color',[0.75, 0, 0.75]);
% elseif a==10
%     p=plot(tf60,Casos_dia60,'Color',[0.75, 0.75, 0]);
elseif a==0
    p=plot(tf60,Casos_dia60,'Color',[0.25, 0.25, 0.25]);
end
end

