# LAB SQL QUERIES 9 ANDRE CONDE
USE sakila;

# 1. Create a table rentals_may to store the data from rental table with information for the month of May.
# 2. Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

# I think i did the first 2 exercices in 1 step

SELECT * 
FROM rental
LIMIT 5;

CREATE TABLE rentals_may
AS 
SELECT
  rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
FROM rental
WHERE rental_date >= "2005-05-01" AND rental_date <= "2005-05-31";

SELECT * 
FROM rentals_may;

# 3. Create a table rentals_june to store the data from rental table with information for the month of June.
# 4. Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
# In rentals_june i have done a mistake with the dates, the rentals_june_right is the corrected one.  
# Also in this one, made the 2 ex in one step

CREATE TABLE rentals_june_right
AS 
SELECT
  rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
FROM rental
WHERE rental_date >= "2005-06-01" AND rental_date <= "2005-06-30";

SELECT *
FROM rentals_june_right;

SELECT *
FROM rental
WHERE month(rental_date) = 6; #just to check if it was right

# 5. Check the number of rentals for each customer for May.
SELECT * 
FROM rentals_may;

SELECT customer_id, COUNT(rental_id) AS Number_of_rentals
FROM rentals_may
GROUP BY customer_id
HAVING COUNT(rental_id);

# 6. Check the number of rentals for each customer for June.
SELECT customer_id, COUNT(rental_id) AS Number_of_rentals
FROM rentals_june_right
GROUP BY customer_id
HAVING COUNT(rental_id);
