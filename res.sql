create or replace procedure reserve (p_name in varchar2,p_date in DATE,p_train in int,p_seats in int)	
	AS 
		total_seats int;
	begin 
		select seats_available into total_seats from train where tRain_no = p_train;

		if total_seats>=p_seats then
			insert into reservation (PNR,NAME,DATES,TRAIN_NO,NO_OF_SEATS) values (res_seq.NEXTVAL,p_name,p_date,p_train,p_seats);

			update train set seats_available = seats_available - p_seats where train_no = p_train;

			 DBMS_OUTPUT.PUT_LINE('Reservation of ' || p_seats || ' seats successful');
		else
			 DBMS_OUTPUT.PUT_LINE('Reservation unsuccesfull');	
		end if;
	end reserve;
	/	 