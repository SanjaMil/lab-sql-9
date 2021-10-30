use sakila;
-- Create a table rentals_may to store the data from rental table with information for the month of May.
drop table if exists rentals_may;
select *, date_format(rental_date, '%m') as Month from rental
where date_format(rental_date, '%m') = '05'; -- saving bellow output as CSV file in a case we need to import it with file
create table rentals_may (
`rental_id` int unique not null,
`rental_date` date default null,
`inventory_id` int default null,
`customer_id` int default null,
`return_date` date default null,
`staff_id` int default null,
`last_update` date default null,
constraint primary key (rental_id)
);

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May. 
insert into rentals_may
select * from rental
where date_format(rental_date, '%m') = '05';

-- checking data
select* from rentals_may;

-- Create a table rentals_june to store the data from rental table with information for the month of June.
drop table if exists rentals_june;
create table rentals_june (
`rental_id` int unique not null,
`rental_date` date default null,
`inventory_id` int default null,
`customer_id` int default null,
`return_date` date default null,
`staff_id` int default null,
`last_update` date default null,
constraint primary key (rental_id)
);
select * from rentals_june;
-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

insert into rentals_june
select * from rental
where date_format(rental_date, '%m') = '06';

select * from rentals_june;

-- Check the number of rentals for each customer for May.
select customer_id, count(rental_id) as no_of_rentals from rentals_may
group by customer_id;

-- Check the number of rentals for each customer for June.

select customer_id, count(rental_id) from rentals_june
group by customer_id;