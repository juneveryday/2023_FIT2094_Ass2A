/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-tsa-insert.sql

--Student ID: 31994695
--Student Name: June Jin
--Unit Code: FIT2094
--Applied Class No: 04

/* Comments for your marker:

CABIN
Involved at least 5 different resorts 
- at least 2 of these resorts must have more than 2 cabins : Done.


Involved at least 10 cabins in 5 different resorts 
- at least 3 of these cabins must be booked at least three times
    resort_id 2, cabin_no 2 : 3 times
    resort_id 4, cabin_no 2 : 3 times
    resort_id 7, cabin_no 3 : 3 times
    
Involve at least 10 different members
- at least 3 of these members have more than one booking
    Member_id : 5 - 3 bookings
    Member_id :18 - 2 bookings
    Member_id :13 - 2 bookings


*/

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (1,1,3,6,'I',150,'Cozy cabin in the woods.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (1,2,4,8,'C',200,'Modern home with pool.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (2,1,2,4,'I',60,'Rustic farmhouse charm.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (2,2,1,2,'C',50,'Spacious family home.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (3,1,2,3,'I',100,'Quaint cottage retreat.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (3,2,3,6,'I',160,'Stylish city apartment.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (3,3,4,9,'C',250,'Charming country cottage.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (4,1,2,2,'C',90,'Elegant mansion estate.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (4,2,1,1,'C',20,'Cozy beach bungalow.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (4,3,2,3,'I',120,'Classic colonial style.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (5,1,3,6,'I',140,'Beautiful lake view home.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (5,2,4,5,'I',110,'Contemporary loft living.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (5,3,1,2,'C',70,'Traditional family home.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (6,1,2,2,'C',130,'Rustic mountain cabin.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (6,2,3,5,'C',150,'Chic urban townhouse.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (6,3,4,9,'I',230,'Luxurious beachfront villa.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (7,1,1,2,'I',100,'Cozy lakeside cottage.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (7,2,2,4,'I',150,'Modern minimalist design.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (7,3,3,7,'C',200,'Quirky artist’s retreat.');
INSERT INTO cabin (resort_id,cabin_no,cabin_nobedrooms,cabin_sleeping_capacity,cabin_bathroom_type,cabin_points_cost_day,cabin_description) VALUES (7,4,4,7,'C',250,'Classic Victorian beauty.');


--------------------------------------
--INSERT INTO booking
--------------------------------------
INSERT INTO booking  VALUES (1,1,1,to_date('2023/03/01','yyyy/mm/dd'),to_date('2023/03/05','yyyy/mm/dd'),4,2,600,20,2);
INSERT INTO booking  VALUES (2,1,2,to_date('2023/03/04','yyyy/mm/dd'),to_date('2023/03/07','yyyy/mm/dd'),4,4,600,19,1);
INSERT INTO booking  VALUES (3,2,1,to_date('2023/03/11','yyyy/mm/dd'),to_date('2023/03/12','yyyy/mm/dd'),2,2,60,18,4);

INSERT INTO booking  VALUES (4,2,2,to_date('2023/03/15','yyyy/mm/dd'),to_date('2023/03/20','yyyy/mm/dd'),1,1,250,17,3);
INSERT INTO booking  VALUES (5,2,2,to_date('2023/03/24','yyyy/mm/dd'),to_date('2023/03/25','yyyy/mm/dd'),1,1, 50,21,3);
INSERT INTO booking  VALUES (6,2,2,to_date('2023/03/28','yyyy/mm/dd'),to_date('2023/03/29','yyyy/mm/dd'),1,1, 50,22,3);


INSERT INTO booking  VALUES (7,3,1,to_date('2023/03/16','yyyy/mm/dd'),to_date('2023/03/19','yyyy/mm/dd'),1,2,300,16,5);
INSERT INTO booking  VALUES (8,3,2,to_date('2023/03/19','yyyy/mm/dd'),to_date('2023/03/21','yyyy/mm/dd'),3,3,320,15,6);
INSERT INTO booking  VALUES (9,3,3,to_date('2023/03/20','yyyy/mm/dd'),to_date('2023/03/24','yyyy/mm/dd'),5,4,1000,14,7);
INSERT INTO booking  VALUES (10,4,1,to_date('2023/03/23','yyyy/mm/dd'),to_date('2023/03/24','yyyy/mm/dd'),2,0,90,13,9);


INSERT INTO booking  VALUES (11,4,2,to_date('2023/03/26','yyyy/mm/dd'),to_date('2023/04/01','yyyy/mm/dd'),1,0,120,13,9);
INSERT INTO booking  VALUES (12,4,2,to_date('2023/04/10','yyyy/mm/dd'),to_date('2023/04/11','yyyy/mm/dd'),1,0, 20,22,9);
INSERT INTO booking  VALUES (13,4,2,to_date('2023/04/20','yyyy/mm/dd'),to_date('2023/04/11','yyyy/mm/dd'),1,0, 20,23,9);


INSERT INTO booking  VALUES (14,4,3,to_date('2023/04/01','yyyy/mm/dd'),to_date('2023/04/05','yyyy/mm/dd'),2,1,480,11,8);
INSERT INTO booking  VALUES (15,5,1,to_date('2023/04/03','yyyy/mm/dd'),to_date('2023/04/10','yyyy/mm/dd'),3,3,980,10,10);
INSERT INTO booking  VALUES (16,5,2,to_date('2023/04/06','yyyy/mm/dd'),to_date('2023/04/10','yyyy/mm/dd'),4,1,440,1,10);
INSERT INTO booking  VALUES (17,5,3,to_date('2023/04/11','yyyy/mm/dd'),to_date('2023/04/14','yyyy/mm/dd'),1,1,210,8,10);
INSERT INTO booking  VALUES (18,6,1,to_date('2023/04/12','yyyy/mm/dd'),to_date('2023/04/17','yyyy/mm/dd'),2,0,650,7,12);
INSERT INTO booking  VALUES (19,6,2,to_date('2023/04/19','yyyy/mm/dd'),to_date('2023/04/22','yyyy/mm/dd'),4,1,450,6,11);
INSERT INTO booking  VALUES (20,6,3,to_date('2023/04/15','yyyy/mm/dd'),to_date('2023/04/18','yyyy/mm/dd'),8,1,690,5,11);
INSERT INTO booking  VALUES (21,7,1,to_date('2023/04/19','yyyy/mm/dd'),to_date('2023/04/27','yyyy/mm/dd'),1,1,800,4,13);
INSERT INTO booking  VALUES (22,7,2,to_date('2023/04/20','yyyy/mm/dd'),to_date('2023/04/21','yyyy/mm/dd'),2,2,150,18,14);

INSERT INTO booking  VALUES (23,7,3,to_date('2023/04/26','yyyy/mm/dd'),to_date('2023/04/30','yyyy/mm/dd'),4,3,800,2,14);
INSERT INTO booking  VALUES (24,7,3,to_date('2023/04/27','yyyy/mm/dd'),to_date('2023/04/28','yyyy/mm/dd'),6,1,200,5,14);
INSERT INTO booking  VALUES (25,7,3,to_date('2023/04/29','yyyy/mm/dd'),to_date('2023/04/30','yyyy/mm/dd'),6,1,200,5,14);

commit;