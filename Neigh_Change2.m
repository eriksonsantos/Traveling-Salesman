% O parametro "x" e o "x_linha" são necessariamente vetores, unicos e
% exclusivamente vetores.
%xa -> Estrutura de vizinhança atual
%x_linha -> possível proxima estrutura de vizinhança
%Tipo: 1- Minimizar  2- Maximizar
function [x, k] = Neigh_Change2(x,x_linha,k,MatrizT,MatrizD,tipo,peso,MIND,MINT,MAXD,MAXT)

d1T = rota_Total(x,MatrizT);
d1D = rota_Total(x,MatrizD);

d2T = rota_Total(x_linha,MatrizT);
d2D = rota_Total(x_linha,MatrizD);

%Normalização
d1D = normalizacao(d1D,MIND,MAXD);
d1T = normalizacao(d1T,MINT,MAXT);

d2D = normalizacao(d2D,MIND,MAXD);
d2T = normalizacao(d2T,MINT,MAXT);

d1 = soma_pond(peso,d1D,d1T);
d2 = soma_pond(peso,d2D,d2T);


if tipo == 1

    if d2 < d1
        x = x_linha;
        k = 1;
    else
    k = k + 1;
    end
end

if tipo == 2

    if d2 > d1
        x = x_linha;
        k = 1;
    else
    k = k + 1;
    end
end
