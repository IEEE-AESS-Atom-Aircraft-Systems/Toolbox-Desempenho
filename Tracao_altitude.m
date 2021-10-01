%Tração Disponível x Tração Requerida (difentes altitudes)

clear
clc

prompt = {'Coeficiente de Oswald','Alongamento',...
          'Densidade do ar (kg/m³)','Aceleração da gravidade (m/s²)',...
          'Massa total (kg)','Área da asa (m²)',...
          'Altura de operação (m)','Coeficiente de arrasto mínimo',...
          'Coeficiente de sustentação-arrasto mínimo'};

default = {'0.75','20','1.225','9.80665','1.21','0.6','80','0.0038','0.2'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40];
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Tração em altitute');
else
  Td = [224.3389 17.5144 17.2055 16.7392 16.1235 15.3641 14.4639 13.4256 12.2456 10.9221 9.4538 7.8755 6.1184 4.2520 2.3635 0.7664];
  v = [0:2:30];

  figure(1)

  hold on
  plot (v,Td,'-b');
  grid on
  plot (v,Td,'-r');
  title('Tração Disponível em diferentes altitudes');
  xlabel('Velocidade do escoamento livre V (m/s)');
  ylabel('Tração (N)');
  ylim([0 , 300])
  xlim([0, 30])
  legend('h = 0', 'h = altura de operação');

%Polar de arrasto para perfil arqueado (cumbered)
  k = 1 / (pi * str2num (dims{1}) * str2num (dims{2}));
  V = [0.001:0.01:30];
  Cl = ((2 * str2num (dims{4}) * str2num (dims{5})) ./ (str2num (dims{3}) * str2num (dims{6}).*V.^2));
  Cd = str2num (dims{8}) + k * (str2num (dims{9}) - Cl).^2;
  Tr = (str2num (dims{4}) * str2num (dims{5})) ./ (Cl ./ Cd); 
  
  figure(2)

  hold on
  plot (V,Tr,'-b');
  grid on

  Po = 101325; % pressao final
  To = 15 + 273.15; % temperatura inicial (em Kelvin)
  R = 287.04; % constante universal dos gases perfeitos (para o ar)
  
  if(str2num (dims{7}) >= 0 && str2num (dims{7}) <= 11000);
    Th = To - 6.5 * str2num (dims{7})/1000;
    P = Po*(1-0.0065*str2num (dims{7})/To)^(5.2561);
  else 
    Th =  216.6500;
    P =  22632 * exp(1)^(-(str2num (dims{4})/(R*Th))(str2num (dims{7})-11000));
  end
  rho_operacao = (P/(R*Th));
  
  Cl = (2 * str2num (dims{4}) * str2num (dims{5})) ./ (rho_operacao * str2num (dims{6}) * (V.^2));
  Cd = str2num (dims{8}) + k * (str2num (dims{9}) - Cl).^2;
  Tr = (str2num (dims{4}) * str2num (dims{5})) ./ (Cl ./ Cd);
  
  plot(V, Tr, '-r');
  title('Tração Requerida em diferentes altitudes');
  xlabel('Velocidade do escoamento livre V (m/s)');
  ylabel('Tração (N)');
  ylim([0, 60])
  xlim([0 , 30])
  legend('h = 0', 'h = altura de operação');
  
  helpdlg (sprintf ('A densidade do ar na altura de operação do VANT corresponde a %.4f kg/m³.',...
                     rho_operacao), 'Tração em altitute');
endif
