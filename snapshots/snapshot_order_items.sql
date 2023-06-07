{% snapshot snapshot_order_items %}


{{
    config(
        target_schema = 'snapshots',
        unique_key = 'OrderItemId',
        strategy = 'timestamp',
        updated_at = 'CreatedAtUtc'
    )
}}




select * from {{ref('stg_order_items')}}



{% endsnapshot %}