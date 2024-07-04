create or replace trigger check_seats
	before insert on reservation 
	for each row
	declare
		available_seats int;
	begin
		select seats_available into available_seats from train where train_no = :NEW.train_no;

		if available_seats < :NEW.no_of_seats then
			RAISE_APPLICATION_ERROR(-20001, 'Not enough seats available');
		end if;
	end;
/			
