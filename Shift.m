%Estrutura de vizinhança

% A saida da função, o "x", é uma matriz.
% O parametro "input" é um vetor de n posições

function x = Shift(input)
size = length(input);
x = zeros (1,size);

temp = input;
for i = 1:size
    
    if (i+1) <= size   
        aux = temp(i);
        temp(i) = temp(i+1);
        temp(i+1) = aux;
        x(i,:) = temp;
    end
end

