%Genetik Algoritma �le Bulan�k Sistem

%Hiperparametreler
pop_Uz = 5;
pc = 0.25;
pm = 0.01;

%Her bir de�i�kenin de�i�im aral��� [-1 1] olarak kabul edildi.
%kromozomdaki gen say�n�, 2 giri�li, her bir giri�in 2 dilsel de�erinin
%oldu�u kabul edildi.
%Her bir dilsel de�erin GaussMf ile temsil edildi�i kabul edildi. Buna g�re
%kromozom boyutu 20 olarak hesapland�. 5 bireyli bir populasyon �retildi.

pop=(-1)+(1-(-1))*rand(pop_Uz,20); %Baslang�c populasyonu olu�turuldu.

tempfis=readfis('BM_19_14_AnfisGA.fis');
for i=1:pop_Uz
    % Kural�n �nc�l k�s�mlar�(premise part)
    tempfis.input(1,1).mf(1,1).params=pop(i,1:2); %X1 de�i�kenine ait A1 dilsel de�eri
    tempfis.input(1,1).mf(1,2).params=pop(i,3:4); %X1 de�i�kenine ait A2 dilsel de�eri
     
    tempfis.input(1,2).mf(1,1).params=pop(i,5:6); %X2 de�i�kenine ait B1 dilsel de�eri
    tempfis.input(1,2).mf(1,2).params=pop(i,7:8); %X2 de�i�kenine ait B2 dilsel de�eri

    %Kural�n soncul k�sm�:(lineer olarak kodlanan k�sm� pi,qi ve ri)
    tempfis.output.mf(1,1).params=pop(i,9:11); % p1,q1,r1
    tempfis.output.mf(1,2).params=pop(i,12:14); %p2,q2,r2
    tempfis.output.mf(1,3).params=pop(i,15:17); %p3, q3, r3
    tempfis.output.mf(1,4).params=pop(i,18:20); % p4, q4, r4
    
    hesaplanan_cikis= evalfis(egt(:,1:2),tempfis);
    %MSE hesapland�
    fitness_mse(i,1)=sum((egt(:,3)-hesaplanan_cikis).^2)/length(egt(:,1));
end
%�aprazlama ve mutasyon
