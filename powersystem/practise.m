clear; clc;
define_constants;
mpc = loadcase('case39');
% mpc.bus(4,:) =[];
% mpc.branch(4,:) = [];
% mpc.branch([5,6,7,8],:) = [];
% N = 1;
% a = [];
% for i =1:N
%     mpc.bus(28,PD)=normrnd(206,206*0.2);%功率变化模型
% %     mpc.bus(4,PD)= 500;
%     [MVAbase, bus, gen, branch, success,et] = runpf(mpc);
%     a(i) = sum(bus(28,VA));
%   
% end
% b = sum(a)./N
%% 连续潮流计算CPF的使用
clear; clc;
define_constants;
mpopt = mpoption('out.all', 0, 'verbose', 2);
mpopt = mpoption(mpopt,'cpf.stop_at','FULL','cpf.step',0.2);
mpopt = mpoption(mpopt,'cpf.plot.level',2);
mpcb = loadcase('case39');
mpct = mpcb;
mpct.gen(:, [PG QG]) = mpcb.gen(:, [PG QG]) * 2.5;
mpct.bus(:, [PD QD]) = mpcb.bus(:, [PD QD]) * 2.5;
results = runcpf(mpcb, mpct, mpopt);