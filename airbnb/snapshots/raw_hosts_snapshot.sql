{% snapshot scd_raw_hosts %}

{{
    config(
        target_schema='snapshots',
        unique_key='id',
        updated_at='updated_at',
        strategy='timestamp',
        invalidate_hard_deletes=True 
    )
}}

select * from {{ source('airbnb', 'hosts') }}

{% endsnapshot %}