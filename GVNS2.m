%GVNS para o multiobjetivo

%tipo: 1 - minimizar 2- maximizar

function [output] = GVNS2(x,MatrizT,MatrizD,kmax,tmax,tipo,peso,MIND,MINT,MAXD,MAXT,curva)
t = 1;
k=0;

output = zeros(1,250);

i=1;
while t <= tmax
    k = 0;
    while k < kmax
       x_linha = Shake(x,k);
       [x_linha2,valoresSolT,valoresSolD] = VND2(x_linha,MatrizT,MatrizD,kmax,tipo,peso,MIND,MINT,MAXD,MAXT);
       [x,k] = Neigh_Change2(x,x_linha2,k,MatrizT,MatrizD,tipo,peso,MIND,MINT,MAXD,MAXT);
       
       title("Curva de Convergência");
       plot(valoresSolD,valoresSolT,"b:s");
       ylabel("Tempo");
       xlabel("Distancia");
       hold on;
       
       i = i + 1;
    end
   output(t,:) = x;
   t = t+1; 
end


     
    