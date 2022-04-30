function output = ahp(solucao,MatrizT,MatrizD,MatrizP,MatrizC)

tam = size(solucao);

descTempo = zeros(tam(1)+1,tam(1)+1);
descDistancia = zeros(tam(1)+1,tam(1)+1);
descPreco = zeros(tam(1)+1,tam(1)+1);
descConsumo= zeros(tam(1)+1,tam(1)+1);
for i = 1: tam(1)
descPreco(i+1,1)= rota_Total(solucao(i,:),MatrizD);
descPreco(1,i+1) = rota_Total(solucao(i,:),MatrizD);
descPreco(i+1,i+1) = 1;
end


for i = 1: tam(1)
descTempo(i+1,1)= rota_Total(solucao(i,:),MatrizT);
descTempo(1,i+1) = rota_Total(solucao(i,:),MatrizT);
descTempo(i+1,i+1) = 1;
end

for i = 1: tam(1)
descDistancia(i+1,1)= rota_Total(solucao(i,:),MatrizD);
descDistancia(1,i+1) = rota_Total(solucao(i,:),MatrizD);
descDistancia(i+1,i+1) = 1;
end
for i = 1: tam(1)
descPreco(i+1,1)= rota_Total(solucao(i,:),MatrizP);
descPreco(1,i+1) = rota_Total(solucao(i,:),MatrizD);
descPreco(i+1,i+1) = 1;
end

for i = 1: tam(1)
descConsumo(i+1,1)= rota_Total(solucao(i,:),MatrizC);
descConsumo(1,i+1) = rota_Total(solucao(i,:),MatrizD);
descConsumo(i+1,i+1) = 1;
end


tam2 =1;
%Preenchendo a matriz A do tempo com a intensidade de importancia

for i = 1: tam(1)
    for j = 1: tam(1)
        if i ~= j
            if descTempo(i+1,1) <  descTempo(1,j+1)
               %Tamanho da diferença
               tam2 = descTempo(1,j+1) - descTempo(i+1,1);
               descTempo = ahpPreencherMatrizA(tam2,0,i+1,j+1,descTempo);
            end
            if descTempo(i+1,1) >  descTempo(1,j+1)
               %Tamanho da diferença
               tam2 = descTempo(1,j+1) - descTempo(i+1,1);
               descTempo = ahpPreencherMatrizA(-tam2,1,i+1,j+1,descTempo);
            end
            if descTempo(i+1,1) ==  descTempo(1,j+1)
               descTempo(i+1,j+1) = 1;
               descTempo(j+1,i+1) = 1;
               
            end
        end
    end
end
descTempo
A = descTempo(2:tam(1)+1,2:tam(1)+1);
QCT = julgamento(A);
n = size(A);
x0 = rand(n(1),1);
x = fsolve(@(x)(A -max(eig(A))*eye(n(1)))*x,x0,optimset('Algorithm','trust-region-dogleg','Display','off'));
v1 = x/sum(x);
sum(v1);


for i = 1: tam(1)
    for j = 1: tam(1)
        if i ~= j
            if descDistancia(i+1,1) <  descDistancia(1,j+1)
               %Tamanho da diferença
               tam2 = descDistancia(1,j+1) - descDistancia(i+1,1);
               descDistancia = ahpPreencherMatrizA(tam2,0,i+1,j+1,descDistancia);
            end
            if descDistancia(i+1,1) >  descDistancia(1,j+1)
               %Tamanho da diferença
               tam2 = descDistancia(1,j+1) - descDistancia(i+1,1);
               descDistancia = ahpPreencherMatrizA(-tam2,1,i+1,j+1,descDistancia);
            end
            if descDistancia(i+1,1) ==  descDistancia(1,j+1)
               descDistancia(i+1,j+1) = 1;
               descDistancia(j+1,i+1) = 1;
               
            end
        end
    end
end
descDistancia
A = descDistancia(2:tam(1)+1,2:tam(1)+1);
QCD = julgamento(A);
n = size(A);
x0 = rand(n(1),1);
x = fsolve(@(x)(A -max(eig(A))*eye(n(1)))*x,x0,optimset('Algorithm','trust-region-dogleg','Display','off'));
v2 = x/sum(x);
sum(v2);

%Preenchendo a matriz A do preco com a intensidade de importancia

for i = 1: tam(1)
    for j = 1: tam(1)
        if i ~= j
            if descPreco(i+1,1) <  descPreco(1,j+1)
               %Tamanho da diferença
               tam2 = descPreco(1,j+1) - descPreco(i+1,1);
               descPreco = ahpPreencherMatrizA(tam2,0,i+1,j+1,descPreco);
            end
            if descPreco(i+1,1) >  descPreco(1,j+1)
               %Tamanho da diferença
               tam2 = descPreco(1,j+1) - descPreco(i+1,1);
               descPreco = ahpPreencherMatrizA(-tam2,1,i+1,j+1,descPreco);
            end
            if descPreco(i+1,1) ==  descPreco(1,j+1)
               descPreco(i+1,j+1) = 1;
               descPreco(j+1,i+1) = 1;
               
            end
        end
    end
end
descPreco
A = descPreco(2:tam(1)+1,2:tam(1)+1);
QCP = julgamento(A);
n = size(A);
x0 = rand(n(1),1);
x = fsolve(@(x)(A -max(eig(A))*eye(n(1)))*x,x0,optimset('Algorithm','trust-region-dogleg','Display','off'));
v3 = x/sum(x);
sum(v3);


%Preenchendo a matriz A do consumo com a intensidade de importancia

for i = 1: tam(1)
    for j = 1: tam(1)
        if i ~= j
            if descConsumo(i+1,1) <  descConsumo(1,j+1)
               %Tamanho da diferença
               tam2 = descConsumo(1,j+1) - descConsumo(i+1,1);
               descConsumo = ahpPreencherMatrizA(tam2,0,i+1,j+1,descConsumo);
            end
            if descConsumo(i+1,1) >  descConsumo(1,j+1)
               %Tamanho da diferença
               tam2 = descConsumo(1,j+1) - descConsumo(i+1,1);
               descConsumo = ahpPreencherMatrizA(-tam2,1,i+1,j+1,descConsumo);
            end
            if descConsumo(i+1,1) ==  descConsumo(1,j+1)
               descConsumo(i+1,j+1) = 1;
               descConsumo(j+1,i+1) = 1;
               
            end
        end
    end
end
descConsumo

A = descConsumo(2:tam(1)+1,2:tam(1)+1);
QCC = julgamento(A);
n = size(A);
x0 = rand(n(1),1);
x = fsolve(@(x)(A -max(eig(A))*eye(n(1)))*x,x0,optimset('Algorithm','trust-region-dogleg','Display','off'));
v4 = x/sum(x);
sum(v4);


%Criterio

% A = [TT TD TP TC; DT DD DP DC; PT PD PP PC; CT CD CP CC]



QCF = julgamento(A);
n = size(A);
x0 = rand(n(1),1);
x = fsolve(@(x)(A -max(eig(A))*eye(n(1)))*x,x0,optimset('Algorithm','trust-region-dogleg','Display','off'));
v5 = x/sum(x);
sum(v5);

%Prioridade Global

P = zeros(tam(1)+1,n(1)+1);
%Colunas na linha 1=> T = -1, D = -2 P = -3 C = -4
P(1,2) = -1;
P(1,3) = -2;
P(1,4) = -3;
P(1,5) = -4;

%Linhas na coluna 1=> 
%1 => Solucao 1, 2=> Solucao 2, 3=> Solucao 3 ...
for i = 1:tam(1)
   P(i+1,1) = i; 
end

for i =1:tam(1)
    %Solucao para o tempo
    P(i+1,2) = v1(i)*v5(1);
    
    %Solucao para a distancia
    P(i+1,3) = v2(i)*v5(2);
    
    %SOlucao para o preco
    P(i+1,4) = v3(i)*v5(3);
    
    %Solucao para o consumo
    P(i+1,5) = v4(i)*v5(4);
end

%Solucao Final
S= zeros(tam(1),1);

for i = 1:tam(1)
   S(i) = P(i+1,2)+ P(i+1,3) + P(i+1,4) + P(i+1,5); 
end

vMaximo = max(S);

for i=1:tam(1)
   if S(i) == vMaximo
       posicaoFinal = i;
   end    
end

output = solucao(posicaoFinal,:);





