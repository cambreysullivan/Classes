ods pdf
file="\\Client\E$\Stats1\HW\Homework5";
Title "Homework 5";
title2 "Cambrey Sullivan";
title3 "Part 1";
data work.ordertype;
	set orion.orders;
	DayOfWeek = WEEKDAY(Order_Date);
	if Order_Type = 1 then Type='Retail Sale';
	if Order_Type = 2 then Type='Catalog Sale';
	if Order_Type = 3 then Type='Internet Sale';
	if Order_Type = 2 then SaleAds='Mail';
	if Order_Type = 3 then SaleAds='Email';
run;
proc print data=work.ordertype;
	var Order_ID Order_Date Delivery_Date Type SaleAds DayOfWeek;
run;
Proc Freq Data=work.ordertype;
	Tables SaleAds Type;
Run;
title3 "Part 2a";
data work.High_BP (keep=Diastolic Systolic Status);
	set Sashelp.Heart;
	if Systolic gt 250 or Diastolic gt 180; 
run;
proc print data=work.High_BP;
run;
data Problem4;
	do Expression= 'A', 'B', 'C', 'D';
		input Truth_Value $;
		output;
	end;
datalines;
True 
True 
False 
True
;

title3 "Part 2b";
proc print data= Problem4;
	id Expression;
run;
data Convert_Temp;
   do Temp_C = 0 to 100;
      Temp_F = 1.8*Temp_C + 32;
      output;
   end;
run;
title3 "Part 3a";
proc print data=Convert_Temp noobs;
run;
data Cubic;
   do x = -5 to 5 by .01;
      y = 2*x**3 - x**2 + 3*x;
      output;
   end;
run;
title3 "Part 3b";
proc print data=Cubic;
run;
title3 "Part 4";
data Interest;
	Interest_Rate=.03;
	Money = 100;
	Goal = 200;
	do until (Money = Goal);
		Year + 1;
		Money = Money + Interest_Rate*Money;
		output;
	end;
run;
proc print data=Interest;
run;
ods pdf close;
run;
