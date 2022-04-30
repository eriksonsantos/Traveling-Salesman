function [rota, x] = neighbor(rota,prioridade,tam,x,i) %rota tem que ser vetor coluna
    switch prioridade
        case 1
        if x < tam && i < tam
            temp = rota;
            rota(i) = temp(x);
            rota(x) = temp(i);
        end
            
        case 2
          if x < tam
              aux = rota(x); 
              rota(x) = rota(x+1);
              rota(x+1) = aux;
          end
           
        case 3 %switch
            if x < tam
                aux = rota(x);
                rota(x) = rota(x+1);
                rota(x+1) = aux;
                if x+1 == tam
                    x = 0;
                end
            else
                x = 0;
            end
            
        case 4 %shift rigth dois deslocamento
            if x < tam-1 %x > 1 && x < tam-1
                rota = [rota(1:x-1) rota(x+1:x+2) rota(x) rota(x+3:end)];
                if x+1 == tam-1
                    x = 0;
                end
            else
                x = 0;
            end
            
       case 5 %switch entre um pivo
            if x < tam-1
                aux = rota(x+2);
                rota(x+2) = rota(x);
                rota(x) = aux;
                if x+1 == tam-1
                    x = 0;
                end
            else
                x = 0;
            end 

            
        case 6 %shift rigth três deslocamento
            if x < tam-2
                rota = [rota(1:x-1) rota(x+1:x+3) rota(x) rota(x+4:end)];
                if x+1 == tam-2
                    x = 0;
                end
            else
                x = 0;
            end
            
        case 7 %switch entre dois pivos
            if x < tam-2 
                aux = rota(x);
                rota(x) = rota(x+3);
                rota(x+3) = aux;
                if x+1 == tam-2
                    x = 0;
                end
            else
                x = 0;
            end
            
        case 8 %shift quatro deslocamento
            if x < tam-3
                rota = [rota(1:x-1) rota(x+1:x+4) rota(x) rota(x+5:end)];
                if x+1 == tam-3
                    x = 0;
                end
            else
                x = 0;
            end
            
        case 9 %switch entre tres pivos
            if x < tam-3
                aux = rota(x+4);
                rota(x+4) = rota(x);
                rota(x) = aux;
                if x+1 == tam-3
                    x = 0;
                end
            else
                x  = 0;
            end
            
        case 10 %switch duplo entre um pivo
            if x < tam-3
                aux = rota(x+4);
                rota(x+4) = rota(x);
                rota(x) = aux;
                aux = rota(x+3);
                rota(x+3) = rota(x+1);
                rota(x+1) = aux;
                if x+1 == tam-3
                    x = 0;
                end
            else
                x = 0;
            end
    end
end

