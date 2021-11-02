-- 1. How many actors are there with the last name ‘Wahlberg’?
-- Answer: 2
select first_name, last_name
from actor
where last_name like 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
-- Answer: 5607

select amount
from payment
where amount >= 3.99 and amount <= 5.99;

-- 3. What film does the store have the most of? (search in inventory)
-- Answer: Multiple films are tied at 8

select film_id, count(film_id)
from inventory
group by film_id
order by count(film_id) desc;

-- 4. How many customers have the last name ‘William’?
-- Answer: 0

select first_name, last_name
from customer
where last_name like 'William';

-- 5. What store employee (get the id) sold the most rentals?
-- Answer: 1 - 8040  // Wouldn't it be employee ID# 2? with 16008 rentals?

select staff_id, count(staff_id)
from rental
group by staff_id
order by count(staff_id) desc;

-- 6. How many different district names are there?
-- Answer: 378

select count(distinct district)
from address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Answer: film_id 508 - 15 actors

select film_id, count(film_id)
from film_actor
group by film_id
order by count(film_id) desc;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- Answer: 13

select count(last_name)
from customer
where last_name like '%es'
and store_id = 1;

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
-- Answer: 3

select amount, count(amount)
from payment
where customer_id >= 380 and customer_id <= 430
group by amount
having count(amount) >= 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
-- Answer: 5 ratings, PG-13 has the most

select distinct rating, count(rating)
from film
group by rating
order by count(rating) desc;
