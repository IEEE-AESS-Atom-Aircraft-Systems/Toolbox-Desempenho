%Tra��o e Pot�ncia dispon�vel de maneira te�rica

clear
clc

prompt = {'Pot�ncia dispon�vel no eixo do motor (W)',...
          'Rota��o do motor (rpm)','Passo da h�lice (ft)',...
          'Di�metro da h�lice (ft)' };

default = {'430','1000','0.33333','1.0833'};
rc = [1,40; 1,40; 1,40; 1,40];
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Pot�ncia e Tra��o te�ricas');
else
  v_1 = 0;
  k_t0 = 57000 * (1.97 - str2num (dims{3})/str2num (dims{4}));
  format bank
  T_v0 = ((k_t0 * str2num (dims{1}) / 746) / (str2num (dims{2}) * str2num (dims{4}))) * 4.448; % tra��o est�tica (N)
  Td_1 = T_v0;
  Pd_1 = Td_1 * v_1;
  Nhelice_1 = 0;
  J_1 = v_1 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_2 = 2;
  Pe = str2num (dims{1})*(100 - 12.04)/100;
  Nhelice_2 = 0.092613;
  Td_2 = (Pe*Nhelice_2)./v_2; %condi��o de atmosfera padr�o ao n�vel do mar
  Pd_2 = Td_2 * v_2;
  J_2 = v_2 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_3 = 4;
  Pe = str2num (dims{1})*(100 - 12.19)/100;
  Nhelice_3 = 0.18227;
  Td_3 = (Pe * Nhelice_3) ./ v_3; %condi��o de atmosfera padr�o ao n�vel do mar
  Pd_3 = Td_3 * v_3;
  J_3 = v_3 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_4 = 6;
  Pe = str2num (dims{1})*(100 - 12.55)/100;
  Nhelice_4 = 0.26709;
  Td_4 = (Pe * Nhelice_4) ./ v_4; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_4 = Td_4 * v_4;
  J_4 = v_4 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_5 = 8;
  Pe = str2num (dims{1})*(100 - 13.21)/100;
  Nhelice_5 = 0.34563;
  Td_5 = (Pe * Nhelice_5) ./ v_5; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_5 = Td_5 * v_5;
  J_5 = v_5 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_6 = 10;
  Pe = str2num (dims{1})*(100 - 14.26)/100;
  Nhelice_6 = 0.41673;
  Td_6 = (Pe * Nhelice_6) ./ v_6; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_6 = Td_6 * v_6;
  J_6 = v_6 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_7 = 12;
  Pe = str2num (dims{1})*(100 - 15.79)/100;
  Nhelice_7 = 0.47933;
  Td_7 = (Pe * Nhelice_7) ./ v_7; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_7 = Td_7 * v_7;
  J_7 = v_7 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_8 = 14;
  Pe = str2num (dims{1})*(100 - 17.89)/100;
  Nhelice_8 = 0.53235;
  Td_8 = (Pe * Nhelice_8) ./ v_8; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_8 = Td_8 * v_8;
  J_8 = v_8 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_9 = 16;
  Pe = str2num (dims{1})*(100 - 20.69)/100;
  Nhelice_9 = 0.57452;
  Td_9 = (Pe * Nhelice_9) ./ v_9; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_9 = Td_9 * v_9;
  J_9 = v_9 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_10 = 18;
  Pe = str2num (dims{1})*(100 - 24.33)/100;
  Nhelice_10 = 0.60421;
  Td_10 = (Pe * Nhelice_10) ./ v_10; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_10 = Td_10 * v_10;
  J_10 = v_10 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_11 = 20;
  Pe = str2num (dims{1})*(100 - 28.98)/100;
  Nhelice_11 = 0.61914;
  Td_11 = (Pe * Nhelice_11) ./ v_11; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_11 = Td_11 * v_11;
  J_11 = v_11 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_12 = 22;
  Pe = str2num (dims{1})*(100 - 34.58)/100;
  Nhelice_12 = 0.61592;
  Td_12 = (Pe * Nhelice_12) ./ v_12; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_12 = Td_12 * v_12;
  J_12 = v_12 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_13 = 24;
  Pe = str2num (dims{1})*(100 - 42.05)/100;
  Nhelice_13 = 0.58929;
  Td_13 = (Pe * Nhelice_13) ./ v_13; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_13 = Td_13 * v_13;
  J_13 = v_13 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_14 = 26;
  Pe = str2num (dims{1})*(100 - 51.55)/100;
  Nhelice_14 = 0.53065;
  Td_14 = (Pe * Nhelice_14) ./ v_14; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_14 = Td_14 * v_14;
  J_14 = v_14 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
  v_15 = 28;
  Pe = str2num (dims{1})*(100 - 63.8)/100;
  Nhelice_15 = 0.42496;
  Td_15 = (Pe * Nhelice_15) ./ v_15; % condi��o de atmosfera padr�o ao n�vel do mar
  Pd_15 = Td_15 * v_15;
  J_15 = v_15 / (str2num (dims{2}) * str2num (dims{4})); % raz�o de avan�o
%=========================================
%Tabela da Tra��o e Pot�ncia
%=========================================
  figure(1);
  col = {'V (m/s)','Td (N)','Pd (W)'};
  data = {v_1,Td_1,Pd_1; v_2,Td_2,Pd_2; v_3,Td_3,Pd_3; v_4,Td_4,Pd_4; v_5,Td_5,Pd_5; v_6,Td_6,Pd_6;
  v_7,Td_7,Pd_7; v_8,Td_8,Pd_8; v_9,Td_9,Pd_9; v_10,Td_10,Pd_10; v_11,Td_11,Pd_11; v_12,Td_12,Pd_12;
  v_13,Td_13,Pd_13; v_14,Td_14,Pd_14; v_15,Td_15,Pd_15};
  uitable('columnname', col, 'data', data, 'columnwidth', {60}, 'columnformat', {'bank'},'Position', [2 2 250 400], 'fontname','arial');
%=========================================
%Gr�fico da Tra��o
%=========================================
  figure(2);
  subplot(2,1,1);

  Td = [Td_1, Td_2, Td_3, Td_4, Td_5, Td_6, Td_7, Td_8, Td_9, Td_10, Td_11, Td_12, Td_13, Td_14, Td_15];
  v = [0: 2: 28];
  plot(v, Td, '-r');
  grid on;
  title('Tra��o dispon�vel de maneira te�rica');
  xlim([-1,29]);
  ylim([0, 300]);
  xlabel('Velocidade (m/s)');
  ylabel('Tra��o');
  legend('Tra��o te�rica');
%=========================================
%Gr�fico da Pot�ncia
%=========================================
  subplot(2,1,2);
  Td = [Pd_1, Pd_2, Pd_3, Pd_4, Pd_5, Pd_6, Pd_7, Pd_8, Pd_9, Pd_10, Pd_11, Pd_12, Pd_13, Pd_14, Pd_15];
  v = [0: 2: 28];
  plot(v, Td, '-g');
  grid on;
  title('Pot�ncia dispon�vel de maneira te�rica');
  xlim([-1,29]);
  ylim([0, 260]);
  xlabel('Velocidade (m/s)');
  ylabel('Pot�ncia');
  legend('Pot�ncia te�rica');
%=========================================
%Gr�fico da raz�o de avan�o
%=========================================
  J = [J_1, J_2, J_3, J_4, J_5, J_6, J_7, J_8, J_9, J_10, J_11, J_12, J_13, J_14, J_15];
  Nhelice = [Nhelice_1, Nhelice_2, Nhelice_3, Nhelice_4, Nhelice_5, Nhelice_6, Nhelice_7, Nhelice_8, Nhelice_9, Nhelice_10, Nhelice_11, Nhelice_12, Nhelice_13, Nhelice_14, Nhelice_15];

  figure(3);
  hold on
  plot(J, Nhelice, '-b');
  grid on
  title('Efici�ncia da h�lice em fun��o da raz�o de avan�o');
  xlabel('Raz�o de avan�o (J)');
  ylabel('Efici�ncia da h�lice (\etahelice)');
  legend('Raz�o de avan�o');
  
  helpdlg (sprintf ('A tra��o est�tica do conjunto motopropulsor � de %.2f N. \n',...
                      T_v0), 'Pot�ncia e Tra��o te�ricas');
endif
