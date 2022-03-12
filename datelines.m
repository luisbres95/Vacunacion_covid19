function [x60,x50,x40,x30,x18] = datelines(T)

x60=xline(T(56),'-',{'60+'});
x60.LabelVerticalAlignment = 'middle';
x60.LabelHorizontalAlignment = 'right';
x50=xline(T(132),'-',{'50-59'});
x50.LabelVerticalAlignment = 'middle';
x50.LabelHorizontalAlignment = 'right';
x40=xline(T(161),'-',{'40-49'});
x40.LabelVerticalAlignment = 'middle';
x40.LabelHorizontalAlignment = 'right';
x30=xline(T(185),'-',{'30-39'});
x30.LabelVerticalAlignment = 'middle';
x30.LabelHorizontalAlignment = 'right';
x18=xline(T(199),'-',{'18-29'});
x18.LabelVerticalAlignment = 'middle';
x18.LabelHorizontalAlignment = 'right';
end

