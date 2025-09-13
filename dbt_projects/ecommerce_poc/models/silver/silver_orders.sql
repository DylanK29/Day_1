select
  order_id,
  customer_id,
  cast(order_ts as timestamp) as order_ts,
  cast(subtotal as number(10, 2)) as subtotal,
  cast(discount as number(10, 2)) as discount,
  cast(tax as number(10, 2)) as tax,
  cast(total as number(10, 2)) as total,
  upper(cast(status as varchar)) as status
from {{ ref('bronze_orders') }}
qualify row_number() over (
  partition by order_id
  order by order_ts desc
) = 1
