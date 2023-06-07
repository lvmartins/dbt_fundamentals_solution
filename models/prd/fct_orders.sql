
{{
  config(
    materialized = 'table'
    )
}}






select * 
from {{ ref("snapshot_order_items")}}
where dbt_valid_to is null