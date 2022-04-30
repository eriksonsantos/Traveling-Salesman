% O argumento de entrada "x" é um vetor que corresponde a uma rota, ou
% seja uma sequencia de cidades.
% O parametro "Matriz" é a matriz de custos, ou de tempo ou de distancia
% dado no enunciando do trabalho.
% O argumento "k" é o numero da estrutura de vizinhança (k=1 -> Shift...
% As variaveis "output_1" e "output_2" são vetores de tamanho igual a
% quantidade linhas de "x".
% Atribui ao "output_1" a menor distancia entre todas as rota de "x".
% O "output_2" é uma varivel auxiliar utilizada para encontrar
% a linha da matriz "x" que tem as estruturas de vizinhança.

function output = arg_min_f(x1,Matriz,k)
x = N_k(x1,k);
tam = size(x,1);

output_1 = rota_Total(x,Matriz);
output_2 = sort(output_1);
posicao = -1;
% Pegar o indice que está a menor posição diferente de zero

for aux =1: tam
    if output_2(aux) ~= 0
        posicao = aux;
        break;
    end
end
%Pegar o indice na qual está a menor posicao do vetor da rota
for aux =1: tam
    if output_2(posicao) == output_1(aux)
        posicao = aux;
        break;
    end
end

output = x(posicao,:);

