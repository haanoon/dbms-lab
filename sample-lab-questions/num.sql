set serveroutput on;

create or replace procedure find_num as
	vnum1 numbers.num1%TYPE;
	vnum2 numbers.num2%TYPE;
	vnum3 numbers.num3%TYPE;
	vmin number;
	vmax number;

	cursor numc is
		select num1,num2,num3 from numbers;
BEGIN
	for rec in numc LOOP
		vnum1 := rec.num1;
		vnum2 := rec.num2;
		vnum3 := rec.num3;

		vmin := LEAST(vnum1,vnum2,vnum3);

		vmax := GREATEST(vnum1,vnum2,vnum3);

		DBMS_OUTPUT.PUT_LINE('NUMBERS: ' || vnum1 || ', ' || vnum2 || ', ' || vnum3);
        DBMS_OUTPUT.PUT_LINE('MAXIMUM: ' || vmax);
        DBMS_OUTPUT.PUT_LINE('MINIMUM: ' || vmin);
	END LOOP;
END;
/		