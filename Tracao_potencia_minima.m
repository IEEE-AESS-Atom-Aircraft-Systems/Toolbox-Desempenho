%M�nima Tra��o Requerida e M�nima Pot�ncia Requerida

clear
clc

prompt = {'Coeficiente de Oswald','Alongamento',...
          'Densidade do ar (kg/m�)','Acelera��o da gravidade (m/s�)',...
          'Massa total (kg)','�rea da asa (m�)',...
          'Coeficiente de arrasto m�nimo',...
          'Coeficiente de sustenta��o-arrasto m�nimo'};

default = {'0.75','20','1.225','9.80665','1.21','0.6','0.0038','0.2'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40];
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'M�nima Tra��o e Pot�ncia');
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
  
  
  
  helpdlg (sprintf ('A m�nima tra��o requerida � de %.4f N.\nO referido valor � encontrado no momento em que a aeronave est� a %.4f m/s.\nA m�nima pot�ncia requerida � de %.4f W.\nO referido valor � encontrado no momento em que a aeronave est� a %.4f m/s.\n',...
                    Trmin,V_tmin,Prmin, V_pmin),'M�nima Tra��o e Pot�ncia');
endif
