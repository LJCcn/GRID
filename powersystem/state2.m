clc;
define_constants;
mpc = loadcase('case39');
% voltage = zeros(2000,1);
% node_load = [];
% data = xlsread('�ٽ繦��.xlsx');
% critP = data(:,2); %ÿ���ڵ���ٽ�P
% initial_P = mpc.bus(:,3)
% for k=1:39 %�õ����ɽڵ������������
%     if mpc.bus(k,2) == 1 %���ɽڵ��type��1��
%         node_load = [node_load;mpc.bus(k,1)]; %�õ����ɽڵ�Ľڵ�����
%     end
% end
% const = length(node_load);

%ͳ��29�����ɽڵ�
%�Ӷֵ���ٽ�ֵ
% for i = 1:const  
%     for j = round(initial_P(i)+1):critP(i) %�Ӷֵ���ٽ�ֵ
%         mpc.bus(i,PD) = j;
%         [MVAbase, bus, gen, branch, success,et] = runpf(mpc);
%         costP(j-round(initial_P(i)),i) = sum(branch(:,PF)+branch(:,PT));
%         mpc.bus(i,PD) = initial_PD(i);%�ָ�ԭ����ֵ
%     end

%��0-�ֵ��1.1��
%     for j = 1:round(initial_P(i)*1.1+1) %��1���ֵ��1.1��
%         mpc.bus(i,PD) = j;
%         [MVAbase, bus, gen, branch, success,et] = runpf(mpc);
%         costP(j,i) = sum(branch(:,PF)+branch(:,PT));
%         mpc.bus(i,3) = initial_P(i);%�ָ�ԭ����ֵ

% %����1�й�����������֧·���й����
% for i = 98:1596
%     mpc.bus(1,PD) = i;
%     [MVAbase, bus, gen, branch, success,et] = runpf(mpc);
%     P1(i) = branch(1,PT)+branch(1,PF);
%     P2(i) = branch(2,PT)+branch(2,PF);
% end
%  xlswrite('costbranch1.xlsx',P1','SHEET1','A1');
%  xlswrite('costbranch1.xlsx',P2','SHEET1','B1');

%ͳ����0.9�����ѹ��Χ�ڵĸ����й�����
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





  




