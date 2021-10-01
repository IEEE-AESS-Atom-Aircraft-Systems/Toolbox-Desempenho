%Traçado do Diagrama v-n

clear
clc

prompt = {'Densidade do ar (kg/m³)','Área da asa (m²)',...
          'Coeficiente de sustentação máximo','Aceleração da gravidade (m/s²)',...
          'Massa total (kg)','Velocidade de estol (m/s)',...
          'Velocidade máxima (m/s)','Velocidade do fator de carga máximo (m/s)'};

default = {'1.225','0.6','1','9.80665','1.21','5.68','29.4076','8.9845'};
rc = [1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40; 1,40];
dims = inputdlg (prompt, 'Preencha com os dados do VANT', rc, default);

if (isempty (dims))
  helpdlg ('Preencha corretamente', 'Diagrama vn de Manobra');
else
  nmax = (str2num (dims{1}) * str2num (dims{8}).^2 * str2num (dims{2}) * str2num (dims{3})) /...
         (2 * str2num (dims{4}) * str2num (dims{5})); 
  nAB = [0: 0.01: nmax];
  Vestol = str2num (dims{6});
  Vmanobra = Vestol * sqrt(nAB);
  p1 = plot(Vmanobra, nAB, 'b');
  title('Diagrama v-n de manobra');
  xlabel('Velocidade (m/s)');
  ylabel("Fator de carga (g's)");
  grid on

%Curva BC

  nBC = nmax;
  VmanobraBC = Vestol * sqrt(nBC);
  Vd = 1.25* str2num (dims{7});
  Vmergulho = [VmanobraBC: 0.01: Vd];
  hold on
  p2 = plot(Vmergulho, nBC, 'b');

%Curva CD

  nlimpos = nmax;
  nlimneg = (-1)*0.4*nlimpos; % fartor de carga limite negativo
  nCD = [nlimneg: 0.01: nlimpos];
  p3 = plot(Vd, nCD, 'b');

%Curva AE

  nAE = [nlimneg: 0.1: 0.1];
  VmanobraAE = Vestol * sqrt(abs(nAE)); % velocidade de manobra
  p4 = plot(VmanobraAE, nAE, 'b');

%Curva DE

  nDE = nlimneg;
  
  VmergulhoDE = [Vestol: 0.01: Vd];
  p5 = plot(VmergulhoDE, nDE, 'b');

%Curva BF

  nultpos = 1.5*nlimpos; % fator de carga último positivo
  nBF = [nlimpos: 0.04: nultpos];
  VmanobraBF = Vestol * sqrt(nBF);
  p6 = plot(VmanobraBF, nBF, 'ro');

%Curva FG

  VmanobraFG = Vestol * sqrt(nultpos);
  VmergulhoFG = [VmanobraFG: 0.2: Vd];
  p7 = plot(VmergulhoFG, nultpos, 'ro');

%Curva GC

  nGC = [nlimpos: 0.08: nultpos];
  p8 = plot(Vd, nGC, 'ro');

%Curva DI

  nultneg = 1.5*nlimneg; % fator de carga último negativo
  nDI = [nultneg: 0.08: nlimneg];
  p9 = plot(Vd, nDI, 'ro');

%Curva EH

  nEH = [nultneg: 0.03: nlimneg];
  VmanobraEH = Vestol * sqrt(abs(nEH));
  p10 = plot(VmanobraEH, nEH, 'ro');

%Curva HI

  VmanobraHI = Vestol * sqrt(abs(nultneg));
  VmergulhoHI = [VmanobraHI: 0.2: Vd];
  p11 = plot(VmergulhoHI, nultneg, 'ro');

  [~, imn] = min (Vmanobra);
  [~, imx] = max (nAB);            
  ix = [imn; imx];
  plot (Vmanobra (ix), nAB (ix), 'xk' );  
  
  helpdlg (sprintf ('Fator de carga máximo: %.2f. \nFator de carga mínimo: %.2f.\nFator de carga último positivo: %.2f. \nFator de carga último negativo: %.2f.\nAcima do fator %.2f ou abaixo do fator %.2f, haverá falha estrutural.\n',...
                    nmax, nlimneg,nultpos, nultneg,nultpos, nultneg), 'Diagrama vn de Manobra');
endif
