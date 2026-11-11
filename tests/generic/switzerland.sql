{# switzerland.sql test that checks if the element "Switzerland" es is present in a column #}
{% test switzerland(model, column_name) %}

with validation as (
    select
        {{column_name}} as name 
    from
        {{model}}
),

validation_error as(
    select name 
    from validation
    where name = 'Switzerland'
) 

select * from validation_error 


{% endtest %}