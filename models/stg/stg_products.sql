
{{
  config(
    materialized = 'table'
    )
}}


with products as (

    select id as ProductId,
    cost as Cost,
    category as Category,
    name as ProductName,
    brand as Brand,
    retail_price as RetailPrice,
    department as Department,
    sku as Sku,
    distribution_center_id as DistributionCenterId

    
    from {{ source("RAW", "products")}}

)


select * from products