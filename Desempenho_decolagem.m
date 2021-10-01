%Desempenho na Decolagem

clear
clc

prompt = {'Envergadura da asa (m)','�rea da asa (m�)',...
          'Coeficiente de atrito da superf�cie de decolagem','Coeficiente de proporcionalidade',...
          'Altura da asa em rela��o ao solo (m)','Acelera��o da gravidade (m/s�)',...
          'Massa total (kg)','Densidade do ar (kg/m�)',...
          'Coeficiente de sustenta��o m�ximo','Coeficiente de arrasto m�nimo','Tra��o (N)'};
default = {'3.4641','0.6','0.03','0.02','0.3','9.80665','1.21','1.225','1.65','0.0038','16.399'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40]; 
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Desempenho na decolagem');
else
  AR = str2num (dims{1}).^2 / str2num (dims{2});
  phi = ((16 * str2num (dims{5}) / str2num (dims{1})).^2) / (1 + (16 * str2num (dims{5}) /...
         str2num (dims{1})).^2);
  ClLo = (pi * 0.75 * AR * str2num (dims{3})) / (2 * phi);
  CdLo = str2num (dims{10}) + (phi * str2num (dims{4}) * (ClLo.^2));
  Vestol = sqrt(2 * (str2num (dims{6})* str2num (dims{7})) / (str2num (dims{8}) * str2num (dims{2})* str2num (dims{9})));
  VLo = 1.2 * Vestol;
  L = 0.5 * str2num (dims{8}) * (0.7 * VLo).^2 * str2num (dims{2}) * ClLo;
  D = 0.5 * str2num (dims{8}) * (0.7 * VLo).^2 * str2num (dims{2}) * CdLo;
  SLo = 1.44 * ((str2num (dims{6}) * str2num (dims{7})).^2) / (str2num (dims{6}) * str2num (dims{8}) * str2num (dims{2}) *... 
                str2num (dims{9}) * (str2num (dims{11}) - (D + (str2num (dims{3}) * (str2num (dims{6}) * str2num (dims{7}) - L)))));
  
  helpdlg (sprintf ('A decolagem deve ser encerrada com velocidade de %.2f m/s. \nO comprimento da pista necess�rio � de %.2f m.\nO coeficiente de sustenta��o da decolagem vale %.4f.\n',...
                     VLo, SLo, ClLo), 'Desempenho na decolagem');
endif
