-- CTE "pop": alle Zeilen der Tabelle DEMOGRAPHICS aus der Quelle holen
-- source('Name der Quelle', 'Name der Tabelle') kommt aus der schema.yml
with pop as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),

-- CTE "final": hier würden normalerweise die Transformationen stehen,
-- im Moment übernehmen wir einfach alles aus "pop"
final as (
    select * from pop
)

-- Ergebnis ausgeben
select * from final