with payment as (

    select * from {{ ref('stg_stripe_payments') }}

),

orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        payment.payment_amount

    from orders
    
    left join payment using (order_id)
)

select * from final