%Voo de Planeio (Descida)

clear
clc

prompt = {'Coeficiente de Oswald','Alongamento',...
          'Aceleração da gravidade (m/s²)',...
          'Massa total (kg)','Área da asa (m²)',...
          'Altura de operação (m)','Coeficiente de arrasto mínimo',...
          'Coeficiente de sustentação mínimo','Coeficiente de sustentação máximo'};

default = {'0.75','20','9.80665','1.21','0.6','80','0.0038','0.2','1'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40];
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Voo de planeio');
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
  Clmin = str2num (dims{8});
  Clmax = str2num (dims{9});
  k = 1 / (pi * str2num (dims{1}) * str2num (dims{2}));
  Cl = [Clmin:0.0001:Clmax];
  Cd = str2num (dims{7}) + k * (Cl).^2;
  E = Cl ./ Cd; 
  gama = atand(1 ./E);
  V = sqrt((2 * str2num (dims{3}) .* str2num (dims{4}) .* cosd(gama))./(rho_operacao .* str2num (dims{5}) .* Cl));
  Vh = V .*cosd(gama);
  RD = -V .* sind(gama);
  figure(1)
  hold on
  plot(Vh,RD)
  grid on
  axis on 
  title('Polar de velocidades (planeio)')
  xlabel('Velocidade horizontal (Vh)')
  ylabel('Razão de descida (m/s)')
  
  max_autonomia = max(RD);
  [L,C]= find(RD == max_autonomia);
  max_alcance = min(gama);
  [L,C] = find(gama == max_alcance);

  helpdlg (sprintf ('Para uma condição de máxima autonomia, a razão de descida será %.2f m/s.\nPara uma condição de máximo alcance, a razão de descida será %.2f m/s.',...
                    max_autonomia,RD(L,C)), 'Voo de planeio');
endif
