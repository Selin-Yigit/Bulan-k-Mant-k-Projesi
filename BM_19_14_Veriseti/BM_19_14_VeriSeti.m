
%Sentetik veri seti üretelim
egt_veriSeti_in = (-1) + (1-(-1)) * rand(100,2);
egt_veriSeti_out = create_VeriSeti(100,egt_veriSeti_in);
egt=[egt_veriSeti_in egt_veriSeti_out];


%Sentetik veri seti üretelim
test_veriSeti_in= (-1) + (1-(-1)) * rand(50,2);
test_veriSeti_out = create_VeriSeti(50,test_veriSeti_in);
test=[test_veriSeti_in test_veriSeti_out];

% SUM OF DIFFERENT POWERS FUNCTION
function y = create_VeriSeti(vs_eleman,veriseti_in) 
d = 2;
xx = veriseti_in;
boyut = length(xx);
disp(boyut);
A = zeros(vs_eleman,1);
for ii = 1:boyut
    sum = 0;
    for jj = 1:d
      xi = xx(ii,jj);
      new = (abs(xi))^(jj+1);
      sum = sum + new;
    end
    A(ii,1) = sum;
end
y=A;
end 

