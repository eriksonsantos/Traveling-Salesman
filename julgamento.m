function QC = julgamento(A)

ICA = [0 0 0.52 0.89 1.11 1.25 1.35 1.4 1.45 1.49];
tam = size(A,2);
[autovetor, Mautovalor] = eig(A);

autovalor = zeros(1);
for i=1:size(Mautovalor,2)
 
  autovalor(i) = Mautovalor(i,i);
        
end
  

IC = (max(autovalor)-tam)/(tam-1);
if ICA(tam) ~= 0
QC = IC/(ICA(tam));
end
if ICA(tam)==0
    QC = 0;
end


