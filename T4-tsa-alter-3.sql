--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-tsa-alter.sql

--Student ID: 31994695
--Student Name: June Jin
--Unit Code: FIT2094
--Applied Class No: 04

/* Comments for your marker:




*/

--4(a)
ALTER 
    table cabin
ADD
    total_number_of_booking NUMBER(4) DEFAULT 0 NOT NULL;

COMMENT ON COLUMN cabin.total_number_of_booking IS
    'total number of booking in cabin.';
    
    
UPDATE cabin
SET total_number_of_booking = (
    SELECT COUNT(*)
    FROM booking
    WHERE booking.cabin_no = cabin.cabin_no and booking.resort_id = cabin.resort_id
);


commit;

select * from cabin;
desc cabin;

--4(b)
DROP TABLE staffrole CASCADE CONSTRAINTS PURGE;

CREATE TABLE staffrole (
        role_id                CHAR (1) NOT NULL,
        role_name              VARCHAR2(15) NOT NULL,
        job_description        VARCHAR2(99) NOT NULL
);

COMMENT ON COLUMN staffrole.role_id IS
    'Role id of staff';

COMMENT ON COLUMN staffrole.role_name IS
    'Name of role';

COMMENT ON COLUMN staffrole.job_description IS
    'description of job';
    
ALTER TABLE staffrole ADD CONSTRAINT staffrole_pk PRIMARY KEY ( role_id );


INSERT INTO staffrole (role_id,role_name,job_description) VALUES ('A','Admin','Take bookings, and reply to customer inquiries');
INSERT INTO staffrole (role_id,role_name,job_description) VALUES ('C','Cleaning','Clean cabins and maintain resort''s public area');
INSERT INTO staffrole (role_id,role_name,job_description) VALUES ('M','Marketing','Prepare and present marketing ideas and deliverables');
commit;

ALTER 
    table staff
ADD
    role_id CHAR (1) DEFAULT 'A' NOT NULL;  

ALTER TABLE staff
    ADD CONSTRAINT staff_role_fk FOREIGN KEY ( role_id )
        REFERENCES staffrole ( role_id );
      
select * from staff;
select * from staffrole;

desc staff;
desc staffrole;

--4(c)

DROP TABLE cleaning CASCADE CONSTRAINTS PURGE;

DROP TABLE payroll CASCADE CONSTRAINTS PURGE;

-- Table
CREATE TABLE cleaning (

        cleaning_id               NUMBER(4) NOT NULL,
        resort_id                 NUMBER(4) NOT NULL,
        cabin_no                  NUMBER(3) NOT NULL,  
        cleaning_date             DATE      NOT NULL
);

COMMENT ON COLUMN cleaning.cleaning_id IS
    'Cleaning id';
    
COMMENT ON COLUMN cleaning.resort_id IS
    'Resort identifier, for this booking';
    
COMMENT ON COLUMN cleaning.cabin_no IS
    'Cabin number within the resort, for this booking';

COMMENT ON COLUMN cleaning.cleaning_date IS
    'Cleaning date';


ALTER TABLE cleaning ADD CONSTRAINT cleaning_pk PRIMARY KEY ( cleaning_id );

ALTER TABLE cleaning ADD CONSTRAINT cleaening_unique UNIQUE ( resort_id, cabin_no, cleaning_date );

ALTER TABLE cleaning
    ADD CONSTRAINT cleaning_fk FOREIGN KEY ( resort_id, cabin_no )
        REFERENCES cabin ( resort_id, cabin_no );


-- Table
CREATE TABLE payroll (
        cleaning_id                NUMBER(4) NOT NULL,
        staff_id                   NUMBER(5) NOT NULL,
        start_time                 DATE NOT NULL,
        end_time                   DATE NOT NULL
);

COMMENT ON COLUMN payroll.cleaning_id IS
    'Cleaning id';
    
COMMENT ON COLUMN payroll.staff_id IS
    'Staff identifier';
    
COMMENT ON COLUMN payroll.start_time IS
    'Cleaning start';

COMMENT ON COLUMN payroll.end_time IS
    'cleaning finish';

ALTER TABLE payroll ADD CONSTRAINT payroll_pk PRIMARY KEY ( cleaning_id,staff_id );

ALTER TABLE payroll
    ADD CONSTRAINT payroll_fk1 FOREIGN KEY ( cleaning_id )
        REFERENCES cleaning ( cleaning_id );

ALTER TABLE payroll
    ADD CONSTRAINT payroll_fk2 FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id );

DESC cleaning;
DESC payroll;