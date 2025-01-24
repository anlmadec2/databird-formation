SELECT
    product_id,
    IFNULL(product_category, 'Other') as product_category,
    cast(product_name_lenght as int) as product_name_lenght,
    cast(product_description_lenght as int) as product_description_lenght,
    cast(product_photos_qty as int) as product_photos_qty,
    cast(product_weight_g as int) as product_weight_g,
    cast(product_length_cm as int) as product_length_cm,
    cast(product_height_cm as int) as product_height_cm,
    cast(product_width_cm as int) as product_width_cm,
    {{ get_product_volume('product_length_cm', 'product_height_cm', 'product_width_cm') }} as product_volume_cm3
FROM {{ source('sales_database','product') }}