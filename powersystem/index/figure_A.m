clc;
define_constants;
mpc = loadcase('case39');
initial_PD = mpc.bus(:,3);
data = xlsread("costP1(pd-PD).xlsx");
for i = 1:6
    x = linspace(round(initial_PD(i)+1),round(initial_PD(i)+1)+length(data(:,i)),length(data(:,i)));
    y = data(:,i);
    figure(1)
    plot(x,y,'LineWidth',1.5);
    legend_str{i} = ['�ڵ�' num2str(i)];
    xlabel('�����й����ʣ�MW��','FontSize',12);
    ylabel('����֧·�й���ģ�MW��','FontSize',12);  
    hold on;
end
legend (legend_str)