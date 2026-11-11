with demographics as (
    select * from {{source('COVID19_Epidemiological_Data','DEMOGRAPHICS')}}
),

country_code as (
    select * from {{ref('country_codes')}}
),

final as (
    select 
        demographics.total_population,
        country_code.name
    from demographics
    left join country_code
        on country_code.code = demographics.ISO3166_1
)
select * from final 

