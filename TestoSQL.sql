/* 1.	Visualizzare i clienti (customers) in ordine alfabetico*/
select* from customers order by ContactName;
/* 2.	Visualizzare i clienti che non hanno il fax*/
select * from customers where Fax is null;

/* 3.	Selezionare i nomi dei clienti (CompanyName) che iniziano con le lettere P, Q, R, S*/
select CompanyName from customers where CompanyName like 'P%' or  CompanyName like 'Q%' or CompanyName like 'R%' or CompanyName like 'S%';
/* 4.	Visualizzare Nome e Cognome degli impiegati assunti (HireDate) dopo il '1993-05-03' e aventi titolo di “Sales Representative”*/
select LastName, FirstName, Title, HireDate
from employees
where Title = 'Sales Representative'
and HireDate > '1993-05-03';
/* 5.	Selezionare la lista dei prodotti non sospesi (attributo discontinued), visualizzando 
anche il nome della categoria di appartenenza*/
select ProductName, c.categoryName, discontinued
from products p, categories c 
where p.categoryid = c.categoryid
and discontinued = 0;
/* 6. Selezionare gli ordini relativi al cliente ‘Ernst Handel’ (CompanyName)*/
select OrderID
from orders o, customers c
where c.companyName like 'Ernst Handel';
/* 7.	Selezionare il nome della società e il telefono dei corrieri (shippers) che hanno consegnato 
ordini nella città di ‘Rio de Janeiro’ (ShipCity in orders)
N.B. nella tabella orders l'id corriere è l'attributo ShipVia*/
select distinct CompanyName, Phone
from shippers s, orders o 
where o.ShipCity like 'Rio de Janeiro';
/* 8.	Selezionare gli ordini (OrderID, OrderDate, ShippedDate) per cui la spedizione (ShippedDate)
è avvenuta entro 30 giorni dalla data dell’ordine (OrderDate)*/
select OrderID, OrderDate, ShippedDate
from orders o
where datediff(ShippedDate, OrderDate)<30;
/* 9.	Selezionare l’elenco dei prodotti che hanno un costo compreso tra 18 e 50, ordinando il risultato
in ordine di prezzo crescente */
select *
from products
where UnitPrice >18 
and UnitPrice <50
order by UnitPrice;
/* 10.	Selezionare tutti i clienti (CustomerID, CompanyName) che hanno ordinato il prodotto 'Chang'*/
select distinct c.CustomerID, c.CompanyName 
from customers c
join orders o on c.CustomerID = o.CustomerID
join `order details` od on o.OrderID = od.OrderID
join products p on od.ProductID = p.ProductID
where p.ProductName = 'Chang';

/*select c.CustomerID, c.CompanyName 
from customers c, orders o, orders, ordersdetails od, products 
where c.CustomerID = o.CustomerID AND o.OrderId = od.OrderID AND od.ProductID = p.ProductID AND  p.productName = 'Chang';*/
/* 11.	Selezionare i clienti che non hanno mai ordinato prodotti di categoria ‘Beverages’*/
select distinct *, ca.CategoryName
from customers c
join orders o on c.CustomerID = o.CustomerID
join `order details` od on o.OrderID = od.OrderID
join products p on od.ProductID = p.ProductID
join categories ca on p.CategoryID = ca.CategoryID
where ca.CategoryName != 'Beverages';

/* 12.	Selezionare il prodotto più costoso*/
select *,  max(UnitPrice) 
from products;
 
/* 13.	Visualizzare l’importo totale di ciascun ordine fatto dal cliente 'Ernst Handel' (CompanyName)*/
SELECT o.OrderID, od.UnitPrice * od.Quantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN `orders details` od ON o.OrderID = od.OrderID
WHERE c.CompanyName = 'Ernst Handel'
GROUP BY o.OrderID;

/* 14.	Selezionare il numero di ordini ricevuti in ciascun anno */
select year(orderDate), count(*) as nOrdiniAnno
from orders o 
group by year(orderDate);
/* 15.	Visualizzare per ogni impiegato (EmployeeID, LastName, FirstName) il numero di clienti distinti serviti per ciascun paese (Country),
visualizzando il risultato in ordine di impiegato e di paese*/

/* 16.	Visualizzare per ogni corriere il numero di consegne effettuate, compresi i dati dei 
corrieri che non hanno effettuato nessuna consegna */
select e.*, count(o.OrderId) as numOrdini
from employees e, orders o 
where e.EmployeeID = o.EmployeeId
group by e.EmployeeID;
select ShipperId, COmpanyName, count(o.orderID)
from shippers s left join orders o on (s.ShipperID = o.ShipVia)
group by ShipperID, CompanyName;
/* 17.	Visualizzare i fornitori (SupplierID, CompanyName) che forniscono un solo prodotto */
select su.SupplierID, su.COmpanyName, count(*)
from suppliers su, products p
where su.SupplierID = p.SupplierID
group by SUpplierId, CompanyName
having count(*) = 1;
/* 18.	Visualizzare tutti gli impiegati che sono stati assunti dopo Margaret Peacock */
select e.*
from employees e
where e.HireDate > (
	select e.HireDate
    from employees e
    where e.FirstName = 'Margaret'
    and e.LastName = 'Peacock');
/* 19.	Visualizzare gli ordini relativi al prodotto più costoso */
select o.*
from orders o, `order details` od
where o.orderID = od.orderID
and od.productID IN (select productID
					from products
					where UnitPrice=(select max(UnitPrice)
									from products p1));
/* 20.	Visualizzare i nomi dei clienti per i quali l’ultimo ordine è relativo al 1998  */
select c.CustomerID, CompanyName, c.ContactName
from customers c, orders o 
where c.customerID = o.customerID
and year(o.orderDate) =1998
and c.customerID not in(select o1.customerID
						from orders o1
                        where year(o1.orderDate) > 1998);
/* 21.	Contare il numero di clienti che non hanno effettuato ordini */
select count(*)
from customers c 
where CustomerID not in (select o.customerID
						from orders o);
/* 22.	Visualizzare il prezzo minimo, massimo e medio dei prodotti per ciascuna categoria */
select c.CategoryID, c.CategoryName, min(UnitPrice), max(UnitPrice), avg(UnitPrice)
from products p, categories c
where p.CategoryID = c.categoryId
group by c.categoryId, c.categoryName;
/* 23.	Selezionare i prodotti che hanno un prezzo superiore al prezzo medio dei prodotti forniti dallo stesso fornitore */
select p.*
from products p
where p.UnitPrice > (select avg(p1.UnitPrice)
					from products p1
                    where p.SupplierID = p1.SupplierID);
/* 24.	Visualizzare, in ordine decrescente rispetto alla quantità totale venduta, i prodotti che hanno venduto una quantità 
totale superiore al prodotto ‘Chai’ */

/* 25.	Visualizzare il nome dei clienti che hanno fatto almeno due ordini di importo superiore a 15000 */

/* 26.	Individuare i codici dei clienti che hanno fatto un numero di ordini pari a quello del cliente 'Eastern Connection' */

/* 27. Visualizzare il numero di ordini ricevuti nel 1997 e di importo superiore a 10000*/

/* 28. Visualizzare i corrieri che hanno consegnato un numero di ordini superiore al numero di ordini consegnati da Speedy Express. */

/* 29. Visualizzare i clienti che hanno ordinato prodotti di tutte le categorie */

                     

