function matriz = N_k(rota, k)
tam = size(rota,2);
matriz = zeros(1,tam);
if k == 1
    x = randi(tam-1);
    l = tam;
    tam = round(.1*tam);%randi(tam-x);%
    i = x + 1;
    j = 1;
    while i <= (x + tam)%tam
        %temp = rota;
        %temp(i) = rota(x);
        %temp(x) = rota(i);
        %matriz(j,:) = temp;
        [matriz(j,:), ~] = neighbor(rota,k,l,x,i);
        i = i + 1;
        j = j + 1;
    end
    %return
elseif k == 2
    temp = rota;
    j = 1;
    i = randi(tam-1);
    a = round(.1*tam);%randi(tam-i);%
    while a > 0%i < tam%(a + i)
        %aux = temp(i);
        %temp(i) = temp(i+1);
        %temp(i+1) = aux;
        [matriz(j,:), ~] = neighbor(temp,k,tam,i,0);%matriz(j,:) = temp;
        i = i + 1;
        j = j + 1;
        a = a - 1;
    end
    %return
else
    x = 1;
    j = 1;
    i = randi(tam);%1;
    a = round(.1*tam);
    while j <= a && x ~= 0
        [matriz(j,:), x] = neighbor(rota, k, tam, i,0);
        i = i + 1;
        j = j + 1;
    end
end