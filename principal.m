clc
clear
close all

tempo = readtable('tempo.csv');
distancia = readtable('distancia.csv');
tempo = table2array(tempo);
distancia = table2array(distancia);

qtd = 1;
rotas = zeros(1,250);

reslt_temp = zeros(1,qtd);
reslt_dist = zeros(1,qtd);


qtd1 = 0;
for i = 1:qtd
    init = Sol_Init(distancia);
    [auxT,auxD,auxR] = secundario(tempo,distancia,4,5,i,1,init);
    tam3 = size(auxT);
    
    for j=1:tam3(2)
       reslt_temp(i,i+j-1) = auxT(j);
       reslt_dist(i,i+j-1) = auxD(j);
       rotas(i+j-1,:) = auxR(j,:);

    end
    
end



minimoT =min(reslt_temp);
mediaT = mean(reslt_temp);
desvioPadraoT = std(reslt_temp);
maximoT = max(reslt_temp);

minimoD =min(reslt_dist);
mediaD = mean(reslt_dist);
desvioPadraoD = std(reslt_dist);
maximoD = max(reslt_dist);


    
