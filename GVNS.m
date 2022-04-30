function [output] = GVNS(x,Matriz,kmax,tmax,tipo)
t = 0;
k=0;
valoresSol = zeros(1,1);
while t <= tmax
    k = 0;
    while k < kmax
       x_linha = Shake(x,k);
       [x_linha2,valoresSol] = VND(x_linha,Matriz,kmax,tipo);
       [x,k] = Neigh_Change(x,x_linha2,k,Matriz,tipo);
    end
    
   t = t+1; 
end

output = x;

     
    