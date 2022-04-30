
function [saida]=prtp(Solucao,MatrizT,MatrizD)

aux = Solucao;
tam = size(aux);

for i=1: tam(1)
   distancia = rota_Total(Solucao(i,:),MatrizD);
   tempo = rota_Total(Solucao(i,:),MatrizT);
   
   for j = i+1: tam(1)
      distancia2 = rota_Total(Solucao(j,:),MatrizD);
      tempo2 = rota_Total(Solucao(j,:),MatrizT);
      
      if(distancia2 < distancia) || (tempo2<tempo)
          aux(j,:) = zeros(1,250);
          tam(1) = tam(1) -1;
      end
   end
    
end
saida = aux;
    

