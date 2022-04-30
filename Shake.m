function rota_linha = Shake(rota, k)
tam = size(rota,2);
x = randi(tam);
if k == 2
    [rota_linha, ~] = neighbor(rota,k,tam,x,0);
elseif k == 1
   %i = 0;
   x = randi(tam - 1);
   i = x + randi(tam - x);
   while x > i%i <= tam
        i = x + randi(tam - x);
   end
   %i = x + randi(tam - x);
    [rota_linha, ~] = neighbor(rota,k,0,x,i);
else
    [rota_linha, ~] = neighbor(rota,k,tam,x,0);
end