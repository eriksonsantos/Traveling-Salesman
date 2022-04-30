%Tipo: 1 - Minimizar 2 - Maximizar
%Peso(Em porcentagem) 1 - 100% Distancia  0 - 100% Tempo

function [reslt_temp,reslt_dist,rota] = secundario(MatrizT,MatrizD,kmax,tmax,curva,tipo,init)

MIND = rota_Total(GVNS(init,MatrizD,kmax,tmax,1),MatrizD);
MINT = rota_Total(GVNS(init,MatrizT,kmax,tmax,1),MatrizT);
MAXD = rota_Total(GVNS(init,MatrizD,kmax,tmax,2),MatrizD);
MAXT = rota_Total(GVNS(init,MatrizT,kmax,tmax,2),MatrizT);

rota = zeros(1,250);
figure

qtd =1;
for i = 1:20
    peso = 1/(i);
    rotas = GVNS2(init,MatrizT,MatrizD,kmax,tmax,tipo,peso,MIND,MINT,MAXD,MAXT,curva);
    tam2 = size(rotas);
    for j = 1: tam2(1)
         rota(qtd,:)=  rotas(j,:);
         qtd = qtd + 1;

    end
    init = rota(1,:);
end

tam = size(rota);

reslt_temp = zeros(1,tam(1));
reslt_dist = zeros(1,tam(1));

figure

for i = 1: tam(1)
    reslt_temp(i) = rota_Total(rota(i,:),MatrizT);
    reslt_dist(i) = rota_Total(rota(i,:),MatrizD);
    
    plot(reslt_dist(i),reslt_temp(i),"b:s");
    title("Conjunto de soluções");
    ylabel("Tempo");
    xlabel("Distancia");
    hold on
end

rota = paredoOtima(rota,MatrizT,MatrizD);

tam = size(rota);

reslt_temp = zeros(1,tam(1));
reslt_dist = zeros(1,tam(1));

figure

for i = 1: tam(1)
    reslt_temp(i) = rota_Total(rota(i,:),MatrizT);
    reslt_dist(i) = rota_Total(rota(i,:),MatrizD);
    
    plot(reslt_dist(i),reslt_temp(i),"b:s");
    title("Paredo Otimo");
    ylabel("Tempo");
    xlabel("Distancia");
    hold on
end

MatrizprecoCombustivel = (4 + (7.5-4).*rand(250,250));
MatrizConsumoCombustivel = (7 + (15-7).*rand(250,250));

rota = ahp(rota,MatrizT,MatrizD,MatrizprecoCombustivel,MatrizConsumoCombustivel);
tam = size(rota);

reslt_temp = zeros(1,tam(1));
reslt_dist = zeros(1,tam(1));

figure

for i = 1: tam(1)
    reslt_temp(i) = rota_Total(rota(i,:),MatrizT);
    reslt_dist(i) = rota_Total(rota(i,:),MatrizD);
    
    plot(reslt_dist(i),reslt_temp(i),"b:s");
    title("Solução final");
    ylabel("Tempo");
    xlabel("Distancia");
    hold on
end






