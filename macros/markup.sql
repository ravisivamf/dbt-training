{% macro markup(SELLPRICE, COSTPRICE) %}
    ({{SELLPRICE}} - {{COSTPRICE}})/{{COSTPRICE}}
{% endmacro %}