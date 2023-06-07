
{{
  config(
    materialized = 'table'
    )
}}


with order_items as (

    select
    id as OrderItemId,
    order_id as OrderId,
    sale_price as SalePrice,
    user_id as UserId,
    product_id as ProductId,
    inventory_item_id as InventoryItemId,
    status as Status,
    created_at as CreatedAtUtc,
    shipped_at as ShippedAtUtc,
    delivered_at as DeliveredAtUtc,
    returned_at as ReturnedAtUtc

    from {{ source("RAW", "order_items")}}
)


select * from order_items