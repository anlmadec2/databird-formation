{% macro get_product_volume(lenght, height, width) %}
    {{ lenght }} * {{ height }} * {{ width }}
{% endmacro %}