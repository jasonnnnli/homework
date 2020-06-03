---1

SELECT SKU, Description

FROM INVENTORY

WHERE Description LIKE '%foot%';
---2

SELECT warehouse,sum(QuantityOnHand) FROM inventory GROUP BY warehouse;
---3

SELECT SKU, Description FROM INVENTORY, WAREHOUSE WHERE

INVENTORY.Warehouse = WAREHOUSE.Warehouse AND Manager = 'Smith';
---4

select StoreNumber, SUM(OrderTotal) as Revenue

from RETAIL_ORDER

where StoreNumber in (

select distinct StoreNumber from RETAIL_ORDER

)

group by StoreNumber;
---5

select SKU_DATA.Department, SUM(ORDER_ITEM.ExtendedPrice) as Revenue

from SKU_DATA, ORDER_ITEM

where SKU_DATA.SKU= ORDER_ITEM.SKU

group by SKU_DATA.Department

order by Revenue;
---6

select SKU_DATA.Department, SUM(ORDER_ITEM.ExtendedPrice) as Revenue

from SKU_DATA, ORDER_ITEM

where SKU_DATA.SKU= ORDER_ITEM.SKU

group by SKU_DATA.Department

order by Revenue;
---7

select

StoreNumber,

StoreZip,

(select sum(t.c) from

(

select count(1) as c, r.StoreNumber as stNum

from ORDER_ITEM o, RETAIL_ORDER r

where r.OrderNumber = o.OrderNumber

group by r.StoreNumber

) t

where t.stNUm = ro.StoreNumber

) as product_count

from RETAIL_ORDER ro

group by ro.StoreNumber, ro.StoreZip

order by product_count;

---8

select warehouse, Avg(QuantityOnHand) from INVENTORY group by warehouse;
---9

select sku,sku_description from SKU_DATA where sku between 200000 and 299999;
---10

SELECT Warehouse

FROM INVENTORY

GROUP BY Warehouse

HAVING avg(QuantityOnHand) < 225

ORDER BY COUNT(QuantityOnHand);
---11

Select * from Order_Item where SKU IN(

Select SKU from Inventory where warehouse = 'Atlanta' and QuantityOnHand = 0);

---12

Select Buyer,Department from SKU_Data inner join

Inventory on SKU_Data.SKU = Inventory.SKU where QuantityOnHand = 0;
---13

Select Department ,count(OrderNumber) from SKU_Data

inner join Order_Item on SKU_Data.SKU = Order_Item.SKU

group by Department order by count(Quantity) desc;
