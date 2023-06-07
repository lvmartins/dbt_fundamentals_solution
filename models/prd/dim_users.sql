
{{
  config(
    materialized = 'table'
    )
}}


with metrics as (

    select 
    UserId,
    count(OrderId) as TotalOrders,
    sum(SalePrice) as TotalAmountSpent 

from {{ ref("stg_order_items")}}

group by UserId

),

users_all as (

    select u.*, m.TotalOrders, m.TotalAmountSpent 
    from {{ ref("stg_users") }} u
    left join metrics m ON u.UserId = m.UserId

)



select * from users_all