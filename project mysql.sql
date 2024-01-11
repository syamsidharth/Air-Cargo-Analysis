create database aircargo;
use aircargo;
create table customer(customer_id int,first_name varchar(20),last_name varchar(20),dob date,gender char);
create table passenger1(aircraft_id varchar(20),route_id int,customer_id int,depart varchar(20),arrival varchar(20),
seat_num varchar(20),class_id varchar(20),travel_date date,flight_num int);
create table ticket_details(p_date date,customer_id int,aircradft_id varchar(20),class_id varchar(20)
,no_of_tickets int,a_code varchar(20),price_per_ticket int,brand varchar(20));
create table routes(route_id int unique,flight_num int,orgin_airport varchar(20),destination_airport varchar(20),
aircraft_id varchar(20),distance_mile int);
select * from passenger1;
drop table customer;
create table customer1(customer_id int,first_name varchar(20),
last_name varchar(20),dob date,gender char);
select * from ticket_details;
select * from customer1;
select * from routes_details;
create table routes_details(route_id int unique,flight_num int,orgin_airport varchar(20),destination_airport varchar(20),
aircraft_id varchar(20),distance_miles int check(distance_miles>0));
drop table routes;
-- 1
select c.customer_id,first_name,dob,gender,route_id from customer1 c join passenger1 p on c.customer_id=p.customer_id where route_id between 0 and 25;
-- 2
select count(customer_id),sum(price_per_ticket) from ticket_details where class_id="bussiness";
-- 3
select concat(first_name," ",last_name) as full_name from customer1;
-- 4
select t.customer_id,first_name,last_name from customer1 c join ticket_details t on c.customer_id=t.customer_id; 
-- 5
select t.customer_id,first_name,last_name,brand from customer1 c join ticket_details t on c.customer_id=t.customer_id where brand like"emirates";
-- 6
select count(customer_id),class_id from passenger1 group by class_id having class_id="economy";
-- 7
select if (sum(price_per_ticket)>10000,"revenue crossed ","revenue doesnt crossed ")as total_revenue from ticket_details;
-- 8
create user user7@localhost identified by"syam7";
-- 9
grant all on my_db.* to user7@localhost;
-- 10
select class_id, max(price_per_ticket) from ticket_details group by class_id order by class_id ;
-- 11
select p.customer_id,first_name,last_name,route_id from customer1 c join passenger1 p on c.customer_id=p.customer_id where route_id=4;
-- 12
select * from passenger1 where route_id=4; 
-- 13
create view bsnscls as select t.customer_id,c.first_name,c.last_name,t.class_id,t.brand from ticket_details t join customer1 c using(customer_id) where class_id= "bussiness";
select * from aircargo.bsnscls; 


