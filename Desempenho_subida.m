%Desempenho na subida

clear
clc

prompt = {'Massa total (kg)','Aceleração da gravidade (m/s²)','Coeficiente de Oswald',...
          'Alongamento','Densidade do ar (kg/m³)','Área da asa (m²)',...
          'Coeficiente de sustentação máximo','Coeficiente de arrassto mínimo',...
          'Coeficiente de sustentação-arrasto mínimo'};
default = {'1.21','9.80665','0.75','20','1.225','0.6','1','0.0038','0.2'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; ];
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Desempenho no pouso');
else
  Vh = [0: 2: 30];
  Td = [224.3389 17.5144 17.2055 16.7392 16.1235 15.3641 14.4639 13.4256 12.2456 10.9221 9.4538 7.8755 6.1184 4.2520 2.3635 0.7664];
  Pd = Td .* Vh;
  Cl = (2 * str2num (dims{1}) * str2num (dims{2})) ./ (str2num (dims{5}) * str2num (dims{6}) .* (Vh.^2));
  Cd = str2num (dims{8}) + (1 / (pi * str2num (dims{3}) * str2num (dims{4}))) * (str2num (dims{8}) - str2num (dims{9}))^2;
  Tr = (str2num (dims{1}) * str2num (dims{2})) / (str2num (dims{7}) / Cd);
  Pr = Tr .* Vh;
  RC = (Pd - Pr) /(str2num (dims{1}) * str2num (dims{2}));
  
  plot(Vh, RC,'LineWidth',2)
  grid on
  title('Polar de velocidades (subida)');
  xlabel('Velocidade horizontal (m/s)');
  ylabel('Razão de Subida (m/s)');
  RCmax = max(RC);
  [L,C]= find(RC == RCmax);
  V = Vh(L,C);
  theta = asind(RCmax/V);
  
  helpdlg (sprintf ('A razão de subida máxima é de %.4f m/s, cujo ângulo é %.4fº. \nJá a maior velocidade vertical corresponde a %.4f m/s.\n',... 
                    RCmax, V, theta), 'Desempenho na subida');
endif
