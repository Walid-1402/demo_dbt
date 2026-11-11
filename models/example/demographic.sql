-- CTE "pop": alle Zeilen aus der Originaltabelle DEMOGRAPHICS holen
with pop as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),

-- CTE "final": das Macro auf die Spalte total_population anwenden
-- es wird nur argument1 angegeben, also gilt für argument2 der Standardwert 1
final as (
    select {{ divide_by_hundred('total_population') }} as divide
    from pop
)

-- Ergebnis ausgeben
select * from final