	-- 1.
select fa1.film_id, fa1.actor_id, fa2.actor_id
from film_actor fa1
join film_actor fa2
on fa1.actor_id < fa2.actor_id
and fa1.film_id = fa2.film_id
order by fa1.film_id, fa1.actor_id, fa2.actor_id;

	-- 2.
with rental_film as(
select rental_id, inventory_id, film_id, customer_id from rental
join inventory using(inventory_id)
)
select rf1.film_id, rf1.customer_id, rf2.customer_id, count(*) from rental_film rf1
join rental_film rf2
on rf1.customer_id < rf2.customer_id
and rf1.film_id = rf2.film_id
group by rf1.film_id, rf1.customer_id, rf2.customer_id
having count(*) > 3
order by count(*) desc;

	-- 3.
create temporary table actor_id
select distinct actor_id from actor;

create temporary table film_id
select distinct film_id from film;

select * from actor_id
cross join film_id;
