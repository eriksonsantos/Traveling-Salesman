%O parametro "x" é a solução inicial, um vetor.
%tipo -> 1 : Minimo 2 : Maximo
%VND para o multiobjetivo

function [output,valoresSolT,valoresSolD] = VND2(x,MatrizT,MatrizD,k_max,tipo,peso,MIND,MINT,MAXD,MAXT)
k = 1;
valoresSolT = zeros(1,1);
valoresSolD = zeros(1,1);
i = 1;
while k <= k_max 
    if tipo == 1
        x_linha = arg_min_f(x,MatrizT,k);
        [x,k] = Neigh_Change2(x,x_linha,k,MatrizT,MatrizD,tipo,peso,MIND,MINT,MAXD,MAXT);
        x_linha = arg_min_f(x,MatrizD,k);
        [x,k] = Neigh_Change2(x,x_linha,k,MatrizT,MatrizD,tipo,peso,MIND,MINT,MAXD,MAXT);
    end
    if tipo == 2
         x_linha = arg_max_f(x,MatrizT,k);
         [x,k] = Neigh_Change2(x,x_linha,k,MatrizT,MatrizD,tipo,peso,MIND,MINT,MAXD,MAXT);
         x_linha = arg_max_f(x_linha,MatrizD,k);
         [x,k] = Neigh_Change2(x,x_linha,k,MatrizT,MatrizD,tipo,peso,MIND,MINT,MAXD,MAXT);
    end
    
    valoresSolT(i) = rota_Total(x,MatrizT);
    valoresSolD(i) = rota_Total(x,MatrizD);
    i = i+1;
end
output = x;

    