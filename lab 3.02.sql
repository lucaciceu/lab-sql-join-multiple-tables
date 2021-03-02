-- LAB 3.02
-- 1. Write a query to display for each store its store ID, city, and country.
select s.store_id, c.city, co.country from store s
join address a on s.address_id = a.address_id
join city c on a.city_id = c.city_id
join country co on c.country_id = co.country_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(p.amount) from store s
join customer c on s.store_id = c.store_id
join payment p on c.customer_id = p.customer_id
group by s.store_id;

-- 3. What is the average running time of films by category?
select ca.category_id, ca.name, avg(f.length) from category ca
join film_category fc on ca.category_id = fc.category_id
join film f on fc.film_id = f.film_id
group by ca.category_id;

-- 4. Which film categories are longest?
select ca.category_id, ca.name, avg(f.length) as average_time from category ca
join film_category fc on ca.category_id = fc.category_id
join film f on fc.film_id = f.film_id
group by ca.category_id
order by average_time desc;

-- 5. Display the most frequently rented movies in descending order.
select f.film_id, f.title, count(rental_id) as times_rented from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.film_id
order by times_rented desc;


-- 6. List the top five genres in gross revenue in descending order.
select ca.category_id, ca.name, sum(p.amount) as gross_revenue from category ca
join film_category fc on ca.category_id = fc.category_id
join film f on fc.film_id = f.film_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join payment p on r.rental_id = p.rental_id
group by ca.category_id
order by gross_revenue desc limit 5;


-- 7. Is "Academy Dinosaur" available for rent from Store 1?
select f.title, s.store_id from film f
join inventory i on f.film_id = i.film_id
join store s on i.store_id = s.store_id
where f.title = "Academy Dinosaur";