--Ex1:
SELECT DISTINCT CITY
FROM STATION
WHERE ID%2 = 0
--Ex2:
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) AS difference
FROM STATION
--Ex4: 
SELECT ROUND(SUM(item_count::DECIMAL * order_occurrences) / SUM(order_occurrences), 1) AS mean
FROM items_per_order
--Ex5:
SELECT candidate_id
FROM candidates
WHERE skill IN('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) =3
--Ex6:
SELECT user_id, MAX(post_date)::date - MIN(post_date)::date AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT(*) > 1
--Ex7:
SELECT card_name, 
MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name;
ORDER BY difference desc 
--Ex8:
SELECT manufacturer,
COUNT(DISTINCT drug) AS drug_count,
SUM(ABS(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE (total_sales < cogs)
GROUP BY manufacturer
ORDER BY total_loss DESC
--Ex9:
SELECT id, movie, description, rating
FROM Cinema
WHERE id % 2 != 0 AND description != 'boring'
ORDER BY rating DESC
--Ex10:
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id
--Ex11:
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id
--Ex12:
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5
--Ex3:
SELECT CEIL(AVG(salary) - AVG(CAST(REPLACE(salary, '0', '') AS DECIMAL))) AS result
FROM EMPLOYEES
