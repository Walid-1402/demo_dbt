{#- Variable a mit dem Wert 4 anlegen -#}
{%- set a = 6 -%}

{#- Wenn a gleich 4 ist, um 1 erhöhen; wenn a gleich 6 ist, um 1 verringern -#}
{%- if a == 4 -%}
    {%- set a = a + 1 -%}
{%- elif a == 6 -%}
    {%- set a = a - 1 -%}
{%- else -%}
{%- endif -%}

select {{ a }} as test