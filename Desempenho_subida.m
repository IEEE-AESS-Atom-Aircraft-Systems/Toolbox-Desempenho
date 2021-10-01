%Desempenho na subida

clear
clc

prompt = {'Massa total (kg)','Acelera��o da gravidade (m/s�)','Coeficiente de Oswald',...
          'Alongamento','Densidade do ar (kg/m�)','�rea da asa (m�)',...
          'Coeficiente de sustenta��o m�ximo','Coeficiente de arrassto m�nimo',...
          'Coeficiente de sustenta��o-arrasto m�nimo'};
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
  ylabel('Raz�o de Subida (m/s)');
  RCmax = max(RC);
  [L,C]= find(RC == RCmax);
  V = Vh(L,C);
  theta = asind(RCmax/V);
  
  helpdlg (sprintf ('A raz�o de subida m�xima � de %.4f m/s, cujo �ngulo � %.4f�. \nJ� a maior velocidade vertical corresponde a %.4f m/s.\n',... 
                    RCmax, V, theta), 'Desempenho na subida');
endif
