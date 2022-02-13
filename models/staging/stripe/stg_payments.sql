with payments as (

    select 
        id as customer_id,
        orderid,
        paymentmethod,
        status,
        {{cents_to_dollars('amount')}} as amount,
        created,
        _batched_at
    from {{source('stripe','payment')}}
)

select * from payments