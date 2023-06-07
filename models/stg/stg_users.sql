
{{
  config(
    materialized = 'incremental',
    unique_key = 'UserId'
    )
}}


with users as (

    select id as UserId,
    concat(first_name, " ", last_name) as UserName,
    email as Email,
    age as Age,
    case when gender = 'F' then 'Female' else 'Male' end as Gender,
    state as State,
    street_address as StreetAddress,
    postal_code as PostalCode,
    city as City,
    upper(country) as Country,
    latitude as Latitude,
    longitude as Longitude,
    traffic_source as TrafficSource,
    created_at as CreatedAtUtc

    from {{ source("RAW", "users")}}

    {% if is_incremental() %}

    where created_at > ( select max(CreatedAtUtc) from {{ this }} )

    {% endif %}

)


select * from users