  

select distinct OrderId, OrderTotalAmount from 
{{ref('fct_orders')}}
where OrderTotalAmount < 0