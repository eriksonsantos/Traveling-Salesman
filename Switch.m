%Estrutura de vizinhança

% O parametro "entrada" é um vetor.  
%saida é uma matriz
function saida = Switch(entrada)
tam = length(entrada);
saida = zeros(1,tam);
temp = entrada;
for i = 1:tam
    temp(i) = entrada(1);
    temp(1) = entrada(i);
    saida(i,:) = temp;
    temp = entrada;
end
saida = saida(2:end,:);
