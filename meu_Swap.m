%Estrutura de vizinhança

% O parametro "entrada" é um vetor. 
% O parametro "quant_troc" é um escalar  
function saida = meu_Swap(entrada)
tam = length(entrada);
saida = zeros(1,tam);
for i = 1:tam
    if i+1 <= tam
        temp = entrada;
        aux = temp(i);
        temp(i) = temp(i+1);
        temp(i+1) = aux;
        saida(i,:) = temp;
    end
end