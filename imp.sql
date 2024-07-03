		create or replace procedure imp_res is 
		begin
			for rec in (select r.regno,r.maths,r.maths_sess,r.os,r.os_sess,r.dbms,r.dbms_sess,r.grand_total,i.maths as imp_maths,i.os as imp_os,i.dcd as imp_dbms from reg_result r join imp_suppl_result i on r.regno=i.regno)
				LOOP
					
				if rec.imp_maths>rec.maths then
					update reg_result set maths=rec.imp_maths where regno=rec.regno;
				end if;
				
				if rec.imp_os>rec.os then
					update reg_result set os=rec.imp_os where regno=rec.regno;
				end if;

				if rec.imp_dbms>rec.dbms then
					update reg_result set dbms=rec.imp_dbms where regno=rec.regno;
				end if;		


					if(rec.maths>=40 and (rec.maths+rec.maths_sess)>=75) and 
						(rec.os>=40 and (rec.os+rec.os_sess)>=75) and 
						(rec.dbms>=40 and (rec.dbms+rec.dbms_sess)>=75) then

							update reg_result set grand_total=rec.maths+rec.maths_sess+rec.os+rec.os_sess+rec.dbms+rec.dbms_sess where regno=rec.regno;
					end if;
				end loop;

				commit;

			end;
			/				