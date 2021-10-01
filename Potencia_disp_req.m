%Potência Disponível x Potência Requerida

clear
clc

prompt = {'Coeficiente de Oswald','Alongamento',...
          'Densidade do ar (kg/m³)','Aceleração da gravidade (m/s²)',...
          'Massa total (kg)','Área da asa (m²)',...
          'Coeficiente de arrasto mínimo',...
          'Coeficiente de sustentação-arrasto mínimo'};

default = {'0.75','20','1.225','9.80665','1.21','0.6','0.0038','0.2'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40]; 
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Potências Disponível e Requerida');
else
  Td = [224.3389 17.5144 17.2055 16.7392 16.1235 15.3641 14.4639 13.4256 12.2456 10.9221 9.4538 7.8755 6.1184 4.2520 2.3635 0.7664];
  v = [0:2:30];
  Pd = Td .* v;

%Polar de arrasto para perfil arqueado (cumbered)
  k = 1 / (pi * str2num (dims{1}) * str2num (dims{2}));
  V = [0.01:0.01:30];
  Cl = ((2 * str2num (dims{4}) * str2num (dims{5})) ./ (str2num (dims{3}) * str2num (dims{6}).*V.^2));
  Cd = str2num (dims{7}) + k * (str2num (dims{8}) - Cl).^2;
  Tr = (str2num (dims{4}) * str2num (dims{5})) ./ (Cl ./ Cd);
  Pr = Tr .* V;

  hold on
  plot (v,Pd,'-g');
  grid on
  plot (V,Pr,'-b');
  title('Potência Disponível x Potência Requerida');
  xlabel('Velocidade do escoamento livre V (m/s)');
  ylabel('Potência (W)');
  ylim([0 , 220])
  xlim([0 , 30])
  legend('Potência Disponível', 'Potência Requerida');
  
  helpdlg (sprintf ('O gráfico das Potências Disponível e Requerida foi plotado.'), 'Potências Disponível e Requerida');
endif
