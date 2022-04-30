function rota = Sol_Init(entrada)

n = length(entrada);
%%
rota = zeros(n,1); % 'rota' é vetor coluna

%%
% sorteia a cidade de partida
rota(1) = randperm(n,1);
%%
destinos = 1:n;
%%
for i = 2:n-2
   origem = rota(i-1);
   destinos = destinos(destinos~=origem);
   [~, pos] = sort(entrada(origem,destinos)); % ordenar a linha referente a cidade atual
    rota(i) = destinos(pos(1));
end 
%%
i = i + 1;
%%
origem = rota(i-1);
%%
destinos = destinos(destinos~=origem);
%%
[~, pos] = sort(entrada(origem,destinos));
%%
random = rand(1);
%%
if random <= .5
    rota(i) = destinos(pos(1));
else
    rota(i) = destinos(pos(2));
end
%%
i = i + 1;
%%
origem = rota(i-1);
%%
destinos = destinos(destinos~=origem);
%%
rota(i) = destinos;

deslocamento = zeros(13,1);
deslocamento(1) = fobj(rota,entrada);
for i = 2:13
    deslocamento(i) = fobj(Neighbor_alt(rota,i,n),entrada);
end

[~, posicao] = min(deslocamento);
if posicao ~= 1
    rota = Neighbor_alt(rota,posicao-1,n);
end

rota = rota';
