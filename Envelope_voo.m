%Envelope de Voo

prompt = {'Fator de carga máximo','Densidade do ar (kg/m³)',...
          'Aceleração da gravidade (m/s²)',...
          'Massa total (kg)','Área da asa (m²)',...
          'Altura de operação (m)','Coeficiente de sustentação máximo',...
          'Velocidade máxima (m/s)','Velocidade mínima (m/s)'};
default = {'2.5','1.225','9.80665','1.21','0.6','80','1','29.2835','0.19857'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40;];
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Envelope de voo');
else
  Po = 101325; % pressao final
  To = 15 + 273.15; % temperatura inicial (em Kelvin)
  R = 287.04; % constante universal dos gases perfeitos (para o ar)  
  if(str2num (dims{6}) >= 0 && str2num (dims{6}) <= 11000);
    Th = To - 6.5 * str2num (dims{6})/1000;
    P = Po*(1-0.0065*str2num (dims{6})/To)^(5.2561);
  else 
    Th =  216.6500;
    P =  22632 * exp(1)^(-(str2num (dims{3})/(R*Th))(str2num (dims{6})-11000));
  end
  rho_operacao = (P/(R*Th));
  rho_max = str2num (dims{2})
  rho_min = rho_operacao
  v_max = str2num (dims{8}) 
  v_min = str2num (dims{9})
  VMin = [v_min,23.3013];
  VMax = [v_max,23.3013]; 
  rho = [rho_min,rho_max]; 
  h_operacao = str2num (dims{6});
  h = [0,h_operacao]
  Vestol = sqrt((2 .* str2num (dims{3}) * str2num (dims{4})) ./ (rho .* str2num (dims{5}) .* str2num (dims{7})));
  Vmanobra = Vestol .* sqrt(str2num (dims{1}));

  plot(VMin,h,'LineWidth',2)
  hold on 
  plot(VMax, h,'LineWidth',2) 
  plot(Vestol, h,'LineWidth',2)
  plot(Vmanobra, h,'LineWidth',2)
  ylabel('Altitude (m)')
  xlabel('Velocidade (m/s)')
  title('Envelope de voo')
  grid on   
  legend('Velocidade mínima','Velocidade máxima','Velocidade de estol','Velocidade de manobra')
  
  helpdlg (sprintf ('O gráfico do envelope de voo foi plotado.'),... 
                    'Envelope de voo');
endif
