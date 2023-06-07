
{{
  config(
    materialized = 'table'
    )
}}


with metrics as (

    select 
    ProductId,
    count(OrderId) as TotalOrders,
    sum(SalePrice) as TotalAmountSpent 

from {{ ref("stg_order_items")}}

group by ProductId

),



products_all as (

    select p.*, m.TotalOrders, m.TotalAmountSpent
    from {{ ref("stg_products") }} p
    left join metrics m ON p.ProductId = m.ProductId

)



select * from products_all