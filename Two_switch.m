%Estrutura de vizinhança

% O parametro "entrada" é um vetor. 
%Saida é uma matriz
function saida = Two_switch(x)

size = length(x);
saida = zeros (1,size);

qtdLinha = 1;
for i = 1: size
   aux = x;
    j = i + 1;
    
    if (i+2) <= size && (j+2) <= size 
       
        aux2 = x(i+2);
        aux(i+2) = x(1);
        aux(1) = aux2;
        
        aux2 = x(j+2);
        aux(j+2) = x(2);
        aux(2) = aux2;   
        
        saida(qtdLinha,:) = aux;
        qtdLinha = qtdLinha+1;
    end
end

end