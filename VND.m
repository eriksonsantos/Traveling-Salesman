%O parametro "x" é a solução inicial, um vetor.
%tipo -> 1 : Minimo 2 : Maximo
function [output,valoresSol] = VND(x,Matriz,k_max,tipo)
k = 1;
valoresSol = zeros(1,1);
i = 1;
while k <= k_max 
    if tipo == 1
        x_linha = arg_min_f(x,Matriz,k);
    end
    if tipo == 2
         x_linha = arg_max_f(x,Matriz,k);
    end
    [x,k] = Neigh_Change(x,x_linha,k,Matriz,tipo);
    valoresSol(i) = rota_Total(x,Matriz);
    i = i+1;
end
output = x;

    