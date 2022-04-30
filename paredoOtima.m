function saida = paredoOtima(entrada,MatrizT,MatrizD)
tam = size(entrada);
eliminar = zeros(1,tam(1));
qtd = 0;
for i=1: tam(1)
   
    for j=1:tam(1)
        if j ~= i && eliminar(i) == 0
            if rota_Total(entrada(j,:),MatrizT)>= rota_Total(entrada(i,:),MatrizT) && rota_Total(entrada(j,:),MatrizD)>=rota_Total(entrada(i,:),MatrizD)
                eliminar(j) = 1;
            end
        end
    end
end
saida = zeros(1,tam(2));

qtd = 1;
for i=1:tam(1)
    if eliminar(i) == 0
        
        saida(qtd,:) = entrada(i,:);
        qtd = qtd+1;
    end
end



