%Seleção dos códigos

clear all
close all
clc

d = dir;
nome_codigo = {d.name};
[indx,tf] = listdlg('PromptString',{'Abaixo estão listados os códigos da Aircraft Performance Toolbox.',...
    'Selecione somente um código.',''},...
    'ListSize',[300 250],'SelectionMode','single','ListString',nome_codigo);

if sum(indx == 3)>0
    Bateria
elseif sum(indx == 4)>0
    Desempenho_curva
elseif sum(indx == 5)>0
    Desempenho_decolagem
elseif sum(indx == 6)>0
    Desempenho_pouso
elseif sum(indx == 7)>0
    Desempenho_subida
elseif sum(indx == 8)>0
    Diagrama_vn_Manobra
elseif sum(indx == 9)>0
    Envelope_voo
elseif sum(indx == 10)>0
    Potencia_altitude
elseif sum(indx == 11)>0
    Potencia_disp_req
elseif sum(indx == 12)>0
    Potencia_tracao_teorica
elseif sum(indx == 13)>0
    Tracao_altitude
elseif sum(indx == 14)>0
    Tracao_disp_req
elseif sum(indx == 15)>0
    Tracao_potencia_minima
elseif sum(indx == 16)>0
    Voo_planeio
elseif sum(indx == 17)>0 || sum(indx == 18)>0
    opcoes = struct('WindowStyle','modal',... 
              'Interpreter','tex');
    f = warndlg('\color{black} Escolha um código válido',...
             'UAV Performance Toolbox', opcoes);
else
    opcoes = struct('WindowStyle','modal',... 
              'Interpreter','tex');
    f = warndlg('\color{black} Selecione um código',...
             'UAV Performance Toolbox', opcoes);
end