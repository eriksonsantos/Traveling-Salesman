% O parametro "rota" tem que ser um vetor linha
function f = fobj(rota,entrada)
tam = size(rota);
f = 0;
for i = 1:tam(2)-1
    f = f + entrada(rota(i),rota(i+1));
end
f = f + entrada(rota(tam(2)),rota(1));