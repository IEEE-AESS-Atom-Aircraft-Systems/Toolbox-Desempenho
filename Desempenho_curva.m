%Desempenho em curva

clear
clc

prompt = {'Coeficiente de Oswald','Alongamento',...
          'Densidade do ar (kg/m³)','Aceleração da gravidade (m/s²)',...
          'Massa total (kg)','Área da asa (m²)',...
          'Tração (N)','Coeficiente de arrasto mí­nimo'};

default = {'0.75','20','1.225','9.80665','1.21','0.6','16.38','0.0038'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40];
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Desempenho em curva');
else
  k = ((pi) * str2num (dims{1}) * str2num (dims{2})).^(-1);
  vrmin = sqrt(4 * k * (str2num (dims{4}) * str2num (dims{5})).^2/...
               (str2num (dims{6}) * str2num (dims{3}) * str2num (dims{7})));
  nrmin = sqrt(2-(4 * k * str2num (dims{8}))/(str2num (dims{7}) * str2num (dims{5})).^2);
  rmin = 4 * k * str2num (dims{4}) * str2num (dims{5}) / str2num (dims{6}) /...
         (str2num (dims{3}) * str2num (dims{7}) / str2num (dims{5}) *...
          sqrt(1-4*k*str2num (dims{8}) / (str2num (dims{7}) / (str2num (dims{4}) * str2num (dims{5}))).^2));
  theta = acosd(1 / nrmin);
  
  helpdlg (sprintf ('A velocidade para o raio mínimo é de %.4f m/s.\nO ângulo máximo de inclinação das asas corresponde a %.4f º.',...
                     vrmin,theta), 'Desempenho em curva');
endif
