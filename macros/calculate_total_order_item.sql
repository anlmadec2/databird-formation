{% macro calculate_total_order_item(price_column, quantity_column) %}
    ({{ price_column }} * {{ quantity_column }}) + shipping_cost
{% endmacro %}