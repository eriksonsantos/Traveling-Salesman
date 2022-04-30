function [rota, x] = Neighbor_alt(rota,prioridade,tam) %rota tem que ser vetor coluna

    switch prioridade
        case 1 %switch adjacente rigth
            x = randperm(tam-1,1);
            aux = rota(x);
            rota(x) = rota(x+1);
            rota(x+1) = aux;
            if x+2>tam
                x = 1;
            else
                x = x + 2;
            end

        case 2 %shift rigth dois deslocamento
            x = 1 + randperm(tam-3,1);
            rota = [rota(1:x-1); rota(x+1:x+2); rota(x); rota(x+3:end)];
            if x+3>tam
                x = 1;
            else
                x = x + 3;
            end
        
        case 3 %switch entre um pivo
            x = randperm(tam-2,1);
            aux = rota(x+2);
            rota(x+2) = rota(x);
            rota(x) = aux;
            if x+3>tam
                x = 1;
            else
                x = x + 3;
            end
            
        case 4 %shift rigth três deslocamento
            x = randperm(tam-3,1);
            rota = [rota(1:x-1); rota(x+1:x+3); rota(x); rota(x+4:end)];
            if x+4>tam
                x = 1;
            else
                x = x + 4;
            end
            
        case 5 %switch entre dois pivos
            x = randperm(tam-3,1);
            aux = rota(x);
            rota(x) = rota(x+3);
            rota(x+3) = aux;
            if x+4>tam
                x = 1;
            else
                x = x + 4;
            end
            
        case 6 %shift rigth quatro deslocamento
            x = randperm(tam-4,1);
            rota = [rota(1:x-1); rota(x+1:x+4); rota(x); rota(x+5:end)];
            if x+5>tam
                x = 1;
            else
                x = x + 5;
            end

        case 7 %switch entre tres pivos
            x = randperm(tam-4,1);
            aux = rota(x+4);
            rota(x+4) = rota(x);
            rota(x) = aux;
            if x+5>tam
                x = 1;
            else
                x = x + 5;
            end
            
        case 8 %switch duplo entre um pivo
            x = randperm(tam-4,1);
            aux = rota(x+4);
            rota(x+4) = rota(x);
            rota(x) = aux;
            aux = rota(x+3);
            rota(x+3) = rota(x+1);
            rota(x+1) = aux;
            if x+5>tam
                x = 1;
            else
                x = x + 5;
            end
    end
end