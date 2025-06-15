show databases;
SHOW TABLES

select * from actor
select * from address
select * from category
select * from city
select * from country
select * from customer
select * from film
select * from film_actor
select * from film_category
select * from film_text
select * from inventory
select * from language
select * from payment
select * from rental
select * from staff
select * from store
select * from customer_list

--Question 1 Answer
select title, count(*) as rental_number from film
join inventory using (film_id)
join rental using (inventory_id)
group by title order by rental_number desc
limit 1

--Question 2 Answer
select city, count(*) as number_of_customer from city
join address using (city_id)
join customer using (address_id)
group by city order by number_of_customer desc
limit 5

--Question 3 Answer
select customer_id, payment_id, first_name, last_name, email from customer
join payment using (customer_id)
where customer_id is null

--Question 4 Answer
select store_id, sum(amount) as total_revenue from store
join staff using (store_id)
join payment using (staff_id)
group by store_id

--Question 5 Answer
select customer_id, first_name, last_name, avg(amount) from customer
join payment using (customer_id)
group by customer_id, first_name, last_name
order by customer_id asc

--Question 6 Answer
select first_name, last_name from customer
join address using (address_id)
join city using (city_id)
join country using (country_id)
where country = "canada"

--Question 7 Answer
select title, length from film
order by length desc limit 5
