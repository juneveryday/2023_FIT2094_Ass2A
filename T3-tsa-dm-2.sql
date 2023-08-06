--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-tsa-dm.sql

--Student ID: 31994695
--Student Name: June Jin
--Unit Code:FIT2094
--Applied Class No: 04

/* Comments for your marker:


*/

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

--3(a)
DROP SEQUENCE booking_id_seq;

CREATE SEQUENCE booking_id_seq START WITH 100 INCREMENT BY 10;


--3(b)
INSERT INTO cabin  
                    
       VALUES (
               (
                select resort_id 
                from resort 
                natural join town
                where       resort_name = 'Awesome Resort'
                        and upper(town_name)   = upper('Broome') 
                        and town_lat = -17.9644 
                        and town_long = 122.2304
                ),
               4,
               4,
               10,
               'I',
               220,
               'A house with a beautiful view in the bedroom.'
              );
       
commit;

--3(c)
INSERT INTO booking  
       VALUES (
                (booking_id_seq.nextval),
                (select resort_id from resort natural join town where resort_name = 'Awesome Resort' and upper(town_name) = upper('Broome') and town_lat = -17.9644 and town_long = 122.2304),
                4,
                to_date('2023/05/26','yyyy/mm/dd'),
                to_date('2023/05/28','yyyy/mm/dd'),
                4,
                4,
                (select cabin_points_cost_day * (to_date('2023/05/28','yyyy/mm/dd') - to_date('2023/05/26','yyyy/mm/dd'))
                from cabin 
                    where  resort_id = (
                                select resort_id 
                                from resort 
                                natural join town
                                where upper(town_name) = upper('Broome')
                                and resort_name = 'Awesome Resort'
                                and town_lat = -17.9644 
                                and town_long = 122.2304
                                        )
                    and cabin_no = 4
                ),
                (select member_id from member where resort_id = 9 and member_no = 2),
                (select staff_id from staff where staff_phone = '0493427245'));
commit;

--3(d) 
UPDATE booking
SET
    booking_to = booking_to + 1
    
WHERE
    booking_id =
        (select booking_id 
        from booking 
        natural join resort 
        natural join cabin 
        where resort_id = (             select resort_id 
                                        from resort 
                                        natural join town
                                        where upper(town_name) = upper('Broome')
                                        and resort_name = 'Awesome Resort'
                                        and town_lat = -17.9644 
                                        and town_long = 122.2304) 
                and cabin_no = 4 
                and booking_from = to_date('2023/05/26','yyyy/mm/dd'));
commit;
    
UPDATE booking
SET
booking_total_points_cost = 
    (select cabin_points_cost_day * (booking_to - booking_from)
                                    
    from cabin
    where resort_id = (
                    select resort_id 
                    from resort 
                    natural join town
                    where upper(town_name) = upper('Broome')
                    and resort_name = 'Awesome Resort'
                    and town_lat = -17.9644 
                    and town_long = 122.2304
                    )  
    and cabin_no = 4
    )
WHERE resort_id = 
                (
                    select resort_id 
                    from resort 
                    natural join town
                    where upper(town_name) = upper('Broome')
                    and resort_name = 'Awesome Resort'
                    and town_lat = -17.9644 
                    and town_long = 122.2304
                ) 
AND cabin_no = 4
AND booking_from = to_date('2023/05/26','yyyy/mm/dd');

commit;


--3(e) 
DELETE FROM booking
WHERE
        resort_id = (
                    select resort_id 
                    from resort 
                    natural join town 
                    where resort_name = 'Awesome Resort'
                    and upper(town_name) = upper('Broome') 
                    and town_lat = -17.9644 
                    and town_long = 122.2304
                    )
        and cabin_no = 4 
        and booking_from > to_date('2023/05/04','yyyy/mm/dd');
        
commit;

DELETE FROM cabin
WHERE
        resort_id = (
                    select resort_id 
                    from resort 
                    natural join town 
                    where resort_name = 'Awesome Resort'
                    and upper(town_name) = upper('Broome') 
                    and town_lat = -17.9644 
                    and town_long = 122.2304
                    ) 
        and cabin_no = 4;
commit;
