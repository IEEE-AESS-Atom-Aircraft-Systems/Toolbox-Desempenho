%Gasto de Energia da Bateria

clear
clc

prompt = {'Tens�o da bateria (V)','Tempo de decolagem (s)',...
          'Altura de opera��o (m)','M�xima raz�o de subida',...
          'Pot�ncia no voo de cruzeiro (W)'};

default = {'11.1','0.31103','80','16.50','100.9'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40]; 
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Bateria');
else
  gtotal = (430 / 3.6) * str2num (dims{2}) / str2num (dims{1}) + ...
             (430 / 3.6) * str2num (dims{3}) / (str2num (dims{4}) * str2num (dims{1})) + ...
             (75.5663 / 3.6) * str2num (dims{5}) / str2num (dims{1});

  helpdlg (sprintf ('A bateria precisa ter uma capacidade maior do que %.4f mAh.\n', ...
                     gtotal), 'Bateria');
endif
