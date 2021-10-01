%Mínima Tração Requerida e Mínima Potência Requerida

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
  helpdlg ('Preencha corretamente', 'Mínima Tração e Potência');
else
%Polar de arrasto para perfil arqueado (cumbered)
  k = 1 / (pi * str2num (dims{1}) * str2num (dims{2}));
  V = [0.01:0.1:30];
  Cl = ((2 * str2num (dims{4}) * str2num (dims{5})) ./ (str2num (dims{3}) * str2num (dims{6}).*V.^2));
  Cd = str2num (dims{7}) + k * (str2num (dims{8}) - Cl).^2;

  Tr = (str2num (dims{4}) * str2num (dims{5})) ./ (Cl ./ Cd);
  Trmin = min(Tr);
  [L,C] = find(Tr == Trmin);
  V_tmin = V(L,C);
  
  Pr = Tr .* V;
  Prmin = min(Pr);
  [L,C] = find(Pr == Prmin);
  V_pmin = V(L,C);
  
  
  
  helpdlg (sprintf ('A mínima tração requerida é de %.4f N.\nO referido valor é encontrado no momento em que a aeronave está a %.4f m/s.\nA mínima potência requerida é de %.4f W.\nO referido valor é encontrado no momento em que a aeronave está a %.4f m/s.\n',...
                    Trmin,V_tmin,Prmin, V_pmin),'Mínima Tração e Potência');
endif
