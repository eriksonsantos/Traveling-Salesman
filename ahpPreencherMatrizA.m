function output = ahpPreencherMatrizA(tam2,menor,i,j,descTempo)
importancia = [1,2,3,4,5,6,7,8,9];

if menor == 1
    if tam2 <0.1
        descTempo(i,j) = importancia(2);
        descTempo(j,i) = 1/importancia(2);
    end
    if tam2>= 0.1 && tam2 <0.3
          descTempo(i,j) = importancia(3);
          descTempo(j,i) = 1/importancia(3);
    end
    if tam2>= 0.3 && tam2 <0.8
         descTempo(i,j) = importancia(4);
         descTempo(j,i) = 1/importancia(4);
    end
    if tam2>= 0.8 && tam2 <1.4
          descTempo(i,j) = importancia(5);
          descTempo(j,i) = 1/importancia(5);
    end
    if tam2>= 1.4 && tam2 <1.8
          descTempo(i,j) = importancia(6);
          descTempo(j,i) = 1/importancia(6);
    end
    if tam2>= 1.8 && tam2 <2.6
         descTempo(i,j) = importancia(7);
         descTempo(j,i) = 1/importancia(7);
    end
    if tam2>= 2.6 && tam2 <3.4
         descTempo(i,j) = importancia(8);
         descTempo(j,i) = 1/importancia(8);
    end 
    if tam2>= 3.4 && tam2 <4.5
         descTempo(i,j) = importancia(9);
         descTempo(j,i) = 1/importancia(9);
    end 
     if tam2>= 4.5
         descTempo(i,j) = importancia(9);
         descTempo(j,i) = 1/importancia(9);
    end  

end
if menor == 0
    if tam2 <0.1
        descTempo(i,j) = 1/importancia(2);
        descTempo(j,i) = importancia(2);
    end
    if tam2>= 0.1 && tam2 <0.3
          descTempo(i,j) = 1/importancia(3);
          descTempo(j,i) = importancia(3);
    end
    if tam2>= 0.3 && tam2 <0.8
         descTempo(i,j) = 1/importancia(4);
         descTempo(j,i) = importancia(4);
    end
    if tam2>= 0.8 && tam2 <1.4
          descTempo(i,j) = 1/importancia(5);
          descTempo(j,i) = importancia(5);
    end
    if tam2>= 1.4 && tam2 <1.8
          descTempo(i,j) = 1/importancia(6);
          descTempo(j,i) = importancia(6);
    end
    if tam2>= 1.8 && tam2 <2.6
         descTempo(i,j) = 1/importancia(7);
         descTempo(j,i) = importancia(7);
    end
    if tam2>= 2.6 && tam2 <3.4
         descTempo(i,j) = 1/importancia(8);
         descTempo(j,i) = importancia(8);
    end 
    if tam2>= 3.4 && tam2 <4.5
         descTempo(i,j) = 1/importancia(9);
         descTempo(j,i) = importancia(9);
    end 
     if tam2>= 4.5
         descTempo(i,j) = 1/importancia(9);
         descTempo(j,i) = importancia(9);
    end  
end

output = descTempo;







        