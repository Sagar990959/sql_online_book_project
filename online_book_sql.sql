create DATABASE online_book_store;

use online_book_store;

show TABLES;

#1 Retrieve all books in the "fiction" genre.

select* from books;

select* from books
where genre="fiction";

#2: Find books published after the year 1950?

select* from books;

select* from books
where published_year>1950;

#3: List all the customers from canada.

select* from customers;

select* from customers
where country="canada";

#4: Show orders placed in november 2023?

select* from orders;

select * from orders
where order_date BETWEEN "2023-11-01" and "2023-11-30";

#5: Retrieve the total stock of books avaliable.

select* from books;

select sum(stock) as total_stocks_books
from books;

#6:Find the details of the most expensive book?

select* from books;

select* from books
ORDER BY price desc
limit 1;

#7: Show all the customers who ordered more than 1 quantity of book.

select* from customers;

select* from orders;

select* from orders
where quantity>1;

#8: Retrieve all the orders where total_amount exceeds 200.

select* from orders;

select* from orders
where total_amount>200;

#9: List all the genres available in the books table.

select* from books;

select  distinct genre from books;

#10: Find the books with the lowest stock?

Select* from books;

select * from books
ORDER BY stock
limit 1;

#11: Calculate the total revenue genrated from all orders.

select* from orders;

select sum(total_amount) as total_revenue
from orders;

#12: Retrieve the total number of books sold for each genre.

select* from books;

select b.genre,sum(o.quantity) as total_numbers
from books as b
join orders as o
on b.book_id=o.book_id
GROUP BY b.genre;
 
 #13:Find the average price of books in the fantasy genre?
 
 select* from books;
 
 select genre, avg(price) as average_price_fantasy
 from books
 where genre="fantasy"
 GROUP BY genre;
 
 #14: List customers who have placed atleast 2 orders.
 
 select* from customers;
 
 Select c.name,count(o.order_id) as orders_count
 from customers as c
 join orders as o
 on c.customer_id=o.customer_id
 GROUP BY c.name
 HAVING count(o.order_id)>=2;
 
 #15: Find the most frequently ordered books?
select o.book_id, b.title,count(o.order_id) as most_orderd
from books as b
join orders as o
on b.book_id=o.book_id
GROUP BY o.book_id,b.title
ORDER BY most_orderd desc
limit 1;

#16: Show the top 3 most expensive books of fantasy genre?

select* from books;

select* from books
where genre="fantasy"
ORDER BY price DESC
limit 3;

#17: Retrieve the total quantity of books sold by each author?

select b.author,sum(o.quantity) as total_quantity
from books as b
join orders as o
on b.book_id=o.book_id
GROUP BY b.author
ORDER BY total_quantity desc;

#18: List the cities where customers who spent over $30 are located?

select  c.city,sum(o.Total_Amount) as total
from orders as o
join customers  as c
on o.customer_id=c.customer_id
where o.total_amount>30
group by c.city;

#19: Find the customers who spent the most on orders?

select c.customer_id,c.name,sum(o.total_amount) as totals
from orders as o
join customers as c
on o.Customer_ID=c.Customer_ID
GROUP BY customer_id,c.name
ORDER BY totals desc
limit 1;

#20: Calculate the stock remaining after fullfilling all orders?

select b.book_id,b.title,b.stock,ifnull(sum(o.quantity),0) as order_quantity,
b.stock-coalesce(sum(o.quantity),0) as remaining_quantity
from books as b
LEFT JOIN orders as o 
on b.book_id=o.book_id
GROUP BY  b.book_id,b.title,b.stock;

