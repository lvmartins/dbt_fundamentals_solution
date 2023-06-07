
{{
  config(
    materialized = 'table'
    )
}}


with orders as (

    select 
    id as OrderId,
    status as Status,
    created_at as CreatedAtUtc,
    returned_at as ReturnedAtUtc,
    shipped_at as ShippedAt_Utc,
    delivered_at as DeliveredAtUtc
    from {{ source("RAW", "orders")}}
)


select * from orders