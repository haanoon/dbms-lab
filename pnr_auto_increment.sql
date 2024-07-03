	create or replace trigger pnr_generate
		before insert on reservation
		for each row
			begin 
				select res_seq.nextval into :new.pnr from dual;
	end;
	/