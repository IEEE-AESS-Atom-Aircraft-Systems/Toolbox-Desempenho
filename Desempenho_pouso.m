%Desempenho no Pouso

clear
clc

prompt = {'Envergadura da asa (m)','Área da asa (m²)',...
          'Coeficiente de atrito da superfície de poso','Coeficiente de proporcionalidade',...
          'Altura da asa em relação ao solo (m)','Aceleração da gravidade (m/s²)',...
          'Massa total (kg)','Densidade do ar (kg/m³)',...
          'Coeficiente de sustentação máximo','Coeficiente de arrasto mí­nimo'};
default = {'3.4641','0.6','0.03','0.02','0.3','9.80665','1.21','1.225','1.65','0.0038'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40];  
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Desempenho no pouso');
else
  AR = str2num (dims{1}).^2 / str2num (dims{2});
  eo = 1 / (pi * str2num (dims{1}).^2 / str2num (dims{2}) * str2num (dims{4}));
  phi = ((16 * str2num (dims{5}) / str2num (dims{1})).^2) / (1 + (16 * str2num (dims{5}) /...
         str2num (dims{1})).^2);
  ClLo = (pi * eo * AR * str2num (dims{3})) / (2 * phi);
  CdLo = str2num (dims{10}) + (phi * str2num (dims{4}) * (ClLo.^2));
  Vestol = sqrt(2 * (str2num (dims{6})* str2num (dims{7})) / (str2num (dims{8}) * str2num (dims{2})* str2num (dims{9})));
  Vt = 1.3 * Vestol;
  L = 0.5 * str2num (dims{8}) * (0.7 * Vt).^2 * str2num (dims{2}) * ClLo;
  D = 0.5 * str2num (dims{8}) * (0.7 * Vt).^2 * str2num (dims{2}) * CdLo;
  SL = 1.69 * ((str2num (dims{6}) * str2num (dims{7})).^2) / (str2num (dims{6}) * str2num (dims{8}) * str2num (dims{2}) *... 
                str2num (dims{9}) * (D + (str2num (dims{3}) * (str2num (dims{6}) * str2num (dims{7}) - L))));
  
  helpdlg (sprintf ('O pouso deve ser iniciado com velocidade de %.2f m/s. \nO comprimento da pista necessário é de %.2f m.\n',...
                     Vt, SL), 'Desempenho no pouso');
endif
