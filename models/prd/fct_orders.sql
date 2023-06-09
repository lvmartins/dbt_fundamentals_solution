
{{
  config(
    materialized = 'table'
    )
}}


with valid_orders as (

select OrderId, sum(SalePrice) as OrderTotalAmount, count(OrderItemId) as NumItems
from `dbt-fundamentals-lvmartins.snapshots.snapshot_order_items`
group by OrderId

)



select oi.*, vo.OrderTotalAmount, vo.NumItems from 
`snapshots.snapshot_order_items` oi
left join valid_orders vo ON oi.OrderId = vo.OrderId
where dbt_valid_to is null