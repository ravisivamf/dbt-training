select 
--from raw order
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordercostprice,
o.ordersellingprice,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit,
{{ markup('ORDERSELLINGPRICE', 'ORDERCOSTPRICE') }} as markup,
--from raw customer
c.customerid,
c.customername,
c.segment,
c.country,
--from raw product
p.productid,
p.productname,
p.category,
p.subcategory
from {{ ref('raw_order') }} as o
join {{ ref('raw_customer') }} as c
on o.customerid= c.customerid
join {{ ref('raw_product') }} as p
on o.productid = p.productid
{{ limit_data_in_dev('Furniture')}}