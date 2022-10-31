use assignment;
## 1. Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. 

## Example:  call order_status(2005, 11);


Select * from customers;
Select * from orders;

  Delimiter //
CREATE PROCEDURE Order_status (IN in_year year , IN in_month datetime ,
 OUT orderNumber int, OUT orderDate date, OUT in_status VARCHAR(50) )
Begin

SELECT *, monthname(shippedDate)  , year(shippedDate) FROM orders 
WHERE monthname  = in_monthname AND year = in_year AND status = in_status;


End //

## /*Question2*/

## /*Question2a*/

create table cancellations (
 id int(11) not null,
 customerNumber int(11) NOT NULL, orderNumber int(11) NOT NULL,
 comments text DEFAULT NULL, 
 PRIMARY KEY (id),
 FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber),
 FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)
 );
 
 
 ## /*Question2b*/
  Delimiter //
CREATE PROCEDURE CANCEL_ORDER()
    BEGIN
    
    INSERT INTO CANCELLATIONS(CUSTOMERNUMBER,ORDERNUMBER)
    SELECT CUSTOMERNUMBER,ORDERNUMBER FROM ORDERS
    WHERE STATUS = 'CANCELLED';
END//


 ## /*Question3*/   
       
       ## a 
       Delimiter // 
       create procedure sp_payment_status (in customerno int)
 begin
 select (case when amount<25000 then 'Silver' when amount<=50000 then 'Gold' when amount>50000 then 'Platinum' end) as purchase_status from payments where customernumber=customerno;
 end//
 
 ## b 
 
 select p.customernumber,customername,(case when amount<25000 then 'Silver' when amount<=50000 then 'Gold' when amount>50000 then 'Platinum' end) as purchase_status from payments as p inner join customers as c on c.customernumber=p.customernumber;


 ## Q4
 

 Update trigger for update cascade functionality
Delimiter // 
CREATE DEFINER=`root`@`localhost` TRIGGER `movies_AFTER_UPDATE` AFTER UPDATE ON `movies` FOR EACH ROW BEGIN

update rentals 
set movieid = new.id
where movieid = old.id;

END//

 delete trigger for update delete functionality
Delimiter // 
CREATE DEFINER=`root`@`localhost` TRIGGER `movies_AFTER_DELETE` AFTER DELETE ON `movies` FOR EACH ROW BEGIN

delete from rentals
-- set movieid = new.id
where movieid = old.id;

END//

## Q5
SELECT MAX(salary)
FROM (
    SELECT salary
    FROM employee
    ORDER BY salary desc
    LIMIT 3
) AS TopThreeSalary;

## Q6

SELECT 
	fname, 
	lname, 
	salary, 
	RANK() OVER (ORDER BY salary desc) salary_rank
FROM  employee;


 
