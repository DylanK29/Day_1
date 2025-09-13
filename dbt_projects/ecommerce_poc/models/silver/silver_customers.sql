select
  customer_id,
  cast(created_at as timestamp) as created_at,
  email,
  country
from {{ ref('bronze_customers') }}
qualify row_number() over (
  partition by customer_id
  order by created_at desc
) = 1
