-- Senior most employee based on job title ?

select * from employee
order by levels desc
limit 1

-- Which country has the most invoices?

select count(*) as CountofBills, billing_country from invoice
group by billing_country
order by CountofBills desc

-- What are the top 3 value of Invoice?

select total from invoice
order by total desc
limit 3

-- Which city has the best customer?
-- Return both city names and invoice total.

select sum(total) as invoice_total, billing_city from invoice
group by billing_city
order by invoice_total desc

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1

-- Write a query to return first_name, last_name, email
-- Return your list alphabetically by email starting with A

SELECT DISTINCT email,first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoiceline ON invoice.invoice_id = invoiceline.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;


-- Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.alter

select name, milliseconds from track
where milliseconds > (
select avg(milliseconds) as avg_track_length from track
)
order by milliseconds desc









