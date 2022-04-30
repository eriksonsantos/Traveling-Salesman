% O parametro "x" e o "x_linha" são necessariamente vetores, unicos e
% exclusivamente vetores.
%xa -> Estrutura de vizinhança atual
%x_linha -> possível proxima estrutura de vizinhança
%Tipo: 1- Minimo  2- Maximo
function [x, k] = Neigh_Change(x,x_linha,k,Matriz,tipo)

d1 = rota_Total(x,Matriz);
d2 = rota_Total(x_linha,Matriz);

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
