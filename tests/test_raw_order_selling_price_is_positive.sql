with orders as(
    select *
    from {{ ref('raw_order') }}
)
select orderid,
    sum(ordersellingprice) as totalsp
from orders
group by orderid
having totalsp < 0