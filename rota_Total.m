% O argumento de entrada "x" é uma matriz em que cada linha corresponde a uma rota, ou
% seja uma sequencia de cidades.
% O parametro "Matriz" é a matriz de custos, ou de tempo ou de distancia
% dado no enunciando do trabalho
function output = rota_Total(x,Matriz)
output = zeros(1,size(x,1));

for i = 1:size(x,1)
    for j = 1:size(x,2)
        if j == size(x,2)
            output(i) = Matriz(x(i,j),x(i,1)) + output(i);
        else
        output(i) = Matriz(x(i,j),x(i,j+1)) + output(i);
        end
    end
end