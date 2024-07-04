create or replace procedure cancel(c_pnr in int)
	as
		seats int;
		c_train int;
	begin
		select train_no,no_of_seats into c_train,seats from reservation where pnr = c_pnr;

		delete from reservation where pnr = c_pnr;

		update train set seats_available = seats_available+seats where train_no = c_train;

		DBMS_OUTPUT.PUT_LINE('Cancellation succesfull');
	end;
/		

