clear; clc;
define_constants;
mpc = loadcase('case39');
% mpc.bus(4,:) =[];
% mpc.branch(4,:) = [];
% mpc.branch([5,6,7,8],:) = [];
N = 1;
a = [];
for i =1:N
    mpc.bus(28,PD)=normrnd(206,206*0.2);%功率变化模型
%     mpc.bus(4,PD)= 500;
    [MVAbase, bus, gen, branch, success,et] = runpf(mpc);
    a(i) = sum(bus(28,VA));
  
end
b = sum(a)./N