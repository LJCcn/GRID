clc;
define_constants;
mpc = loadcase('case39');
% voltage = zeros(2000,1);
% node_load = [];
% data = xlsread('临界功率.xlsx');
% critP = data(:,2); %每个节点的临界P
% initial_P = mpc.bus(:,3)
% for k=1:39 %得到负荷节点的索引向量；
%     if mpc.bus(k,2) == 1 %负荷节点的type是1；
%         node_load = [node_load;mpc.bus(k,1)]; %得到负荷节点的节点名；
%     end
% end
% const = length(node_load);

%统计29各负荷节点
%从额定值到临界值
% for i = 1:const  
%     for j = round(initial_P(i)+1):critP(i) %从额定值到临界值
%         mpc.bus(i,PD) = j;
%         [MVAbase, bus, gen, branch, success,et] = runpf(mpc);
%         costP(j-round(initial_P(i)),i) = sum(branch(:,PF)+branch(:,PT));
%         mpc.bus(i,PD) = initial_PD(i);%恢复原功率值
%     end

%从0-额定值的1.1倍
%     for j = 1:round(initial_P(i)*1.1+1) %从1到额定值的1.1倍
%         mpc.bus(i,PD) = j;
%         [MVAbase, bus, gen, branch, success,et] = runpf(mpc);
%         costP(j,i) = sum(branch(:,PF)+branch(:,PT));
%         mpc.bus(i,3) = initial_P(i);%恢复原功率值

% %负荷1有功增加其所在支路的有功损耗
% for i = 98:1596
%     mpc.bus(1,PD) = i;
%     [MVAbase, bus, gen, branch, success,et] = runpf(mpc);
%     P1(i) = branch(1,PT)+branch(1,PF);
%     P2(i) = branch(2,PT)+branch(2,PF);
% end
%  xlswrite('costbranch1.xlsx',P1','SHEET1','A1');
%  xlswrite('costbranch1.xlsx',P2','SHEET1','B1');

%统计在0.9倍额定电压范围内的负荷有功功率
% data = xlsread('voltage.xlsx');
% for i = 1:29
%     y = data(:,i);
%     const = length(y);
%     for j = 1:const
%         if y(j)<= 0.95
%             v(i) = j;
%             break
%         end
%     end
% end
%  xlswrite('0.95.xls',v')
% mpc = loadcase('case39');
% initial_PD = mpc.bus(:,3);
% load_P = round(initial_PD);
% data = xlsread('0.95.xls');
% data1 = xlsread('costP1(pd-3000).xlsx');
% for i = 1:29
%     x = data(i);
%     y = data1(:,i);
%     sens(i) = (y(x)-y(1))./(x);
% end
% xlswrite('index1-3.xls',sens');

%在额定功率的平衡点±10%处进行灵敏度分析
clc;
define_constants;
mpc = loadcase('case39');
initial_PD = mpc.bus(:,PD);
pd2 = zeros(29,2);
cost_PD=zeros(29,100);
%求上下限的负荷节点的有功功率
for i = 1:29
    pd2(i,1) = initial_PD(i)*0.9;
    pd2(i,2) = initial_PD(i)*1.1;
end
%等间隔取100个点，慢慢增加负荷
% for k = 1:29
%     temp_pd = linspace(pd2(k,1),pd2(k,2),100);
%     for j = 1:100
%         mpc.bus(k,PD) = temp_pd(j);
%         [MVAbase, bus, gen, branch, success,et] = runpf(mpc);
%         cost_PD(k,j) = sum(branch(:,PF)+branch(:,PT));
%         mpc.bus(k,PD) = initial_PD(k);
%     end
% end
% xlswrite("cost0.1_P.xlsx",cost_PD')

%求取灵敏度指标
data = xlsread("cost0.1_P.xlsx");

for j =1:29
    y = data(:,j);
    gap_pd = pd2(j,2) - pd2(j,1);
    gap_netpd = y(100) - y(1);
    if gap_pd == 0
        sens(j)=0
    else
        sens(j) = abs(gap_netpd./gap_pd);
    end
end
xlswrite("index_sense.xlsx",sens')
        

    
    





  




