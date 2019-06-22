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
mpc = loadcase('case39');
initial_PD = mpc.bus(:,3);
load_P = round(initial_PD);
data = xlsread('0.95.xls');
data1 = xlsread('costP1(pd-3000).xlsx');
for i = 1:29
    x = data(i);
    y = data1(:,i);
    sens(i) = (y(x)-y(1))./(x);
end
xlswrite('index1-3.xls',sens');





  




