%Genetik Algoritma Ýle Bulanýk Sistem

%Hiperparametreler
pop_Uz = 5;
pc = 0.25;
pm = 0.01;

%Her bir deðiþkenin deðiþim aralýðý [-1 1] olarak kabul edildi.
%kromozomdaki gen sayýný, 2 giriþli, her bir giriþin 2 dilsel deðerinin
%olduðu kabul edildi.
%Her bir dilsel deðerin GaussMf ile temsil edildiði kabul edildi. Buna göre
%kromozom boyutu 20 olarak hesaplandý. 5 bireyli bir populasyon üretildi.

pop=(-1)+(1-(-1))*rand(pop_Uz,20); %Baslangýc populasyonu oluþturuldu.

tempfis=readfis('BM_19_14_AnfisGA.fis');
for i=1:pop_Uz
    % Kuralýn öncül kýsýmlarý(premise part)
    tempfis.input(1,1).mf(1,1).params=pop(i,1:2); %X1 deðiþkenine ait A1 dilsel deðeri
    tempfis.input(1,1).mf(1,2).params=pop(i,3:4); %X1 deðiþkenine ait A2 dilsel deðeri
     
    tempfis.input(1,2).mf(1,1).params=pop(i,5:6); %X2 deðiþkenine ait B1 dilsel deðeri
    tempfis.input(1,2).mf(1,2).params=pop(i,7:8); %X2 deðiþkenine ait B2 dilsel deðeri

    %Kuralýn soncul kýsmý:(lineer olarak kodlanan kýsmý pi,qi ve ri)
    tempfis.output.mf(1,1).params=pop(i,9:11); % p1,q1,r1
    tempfis.output.mf(1,2).params=pop(i,12:14); %p2,q2,r2
    tempfis.output.mf(1,3).params=pop(i,15:17); %p3, q3, r3
    tempfis.output.mf(1,4).params=pop(i,18:20); % p4, q4, r4
    
    hesaplanan_cikis= evalfis(egt(:,1:2),tempfis);
    %MSE hesaplandý
    fitness_mse(i,1)=sum((egt(:,3)-hesaplanan_cikis).^2)/length(egt(:,1));
end
%çaprazlama ve mutasyon
