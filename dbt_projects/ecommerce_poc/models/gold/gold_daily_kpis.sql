with o as (
select date_trunc('day', order_ts) as day, total
from {{ ref('silver_orders') }}
where status = 'PAID'
)
select
day,
count(*) as orders,
sum(total) as revenue,
avg(total) as aov
from o
group by 1
order by 1